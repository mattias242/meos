# Teststrategi för MeOS

Detta dokument beskriver nuläget för test i kodbasen, strategin framåt och de
identifierade svaga områden där tester behövs mest. Arbetssättet (BDD + TDD
red→green→blue) beskrivs i
[UTVECKLINGSPROCESS_BDD_TDD.md](UTVECKLINGSPROCESS_BDD_TDD.md) och den
prioriterade målbilden i [TEST_TODO.md](TEST_TODO.md).

---

## 1. Nuläge

Kodbasen är ~173 000 rader C++ i en platt katalog (`code/`), byggd enbart med
Visual Studio (`MeOS.sln`/`MeOS.vcxproj`, Win32-applikation).

| Observation | Konsekvens |
|---|---|
| `tests.cpp` innehåller en **tom** `registerTests()` — inga tester finns i repot | Ingen regressionssäkring alls idag |
| Testharnesset (`testmeos.h/cpp`, `recorder.cpp`) är ett **GUI-baserat record/playback-ramverk**: det spelar in knapptryck och spelar upp dem genom Win32-meddelandeloopen | Kan bara användas för end-to-end-GUI-tester, inte enhetstester av domänlogik. Körs endast inifrån GUI:t (`-test`-flaggan), utan exit-kod eller konsolutdata |
| **Ett** äkta enhetstest finns: `Parser::test()` i `parser.cpp:1399`, körs vid uppstart | Prejudikat och mall — rena enhetstester är redan accepterade i kodbasen |
| **Ingen CI**: ingen `.github/`, ingen CMake/Makefile | Inget bygge eller test körs automatiskt någonsin |
| Tider lagras internt i **tiondels sekunder** (`timeconstants.hpp`: `timeUnitsPerSecond = 10`) medan sekundbaserade konstanter också förekommer | Systemisk risk: enhetsfel i tid slår igenom i alla resultat |
| `oEvent` har **en enda konstruktor: `oEvent(gdioutput&)`** och använder GUI-objektet även för teckenkodning (`widen`/`narrow`), dialoger och flikåtkomst | Största hindret för att testa runner-/lag-/resultatlogik. Dock: `gdioutput` kan skapas **utan fönster** (så gör `meos.cpp` vid uppstart), och `isTestMode` finns redan |
| Globala beroenden initieras i `WinMain`: `RunnerStatusOrderMap`, `lang`, `StringCache`, RNG-seed | En testbinär måste replikera denna bootstrap, annars är t.ex. statusordningen odefinierad |

Slutsats: det saknas inte testbar kod — det saknas testinfrastruktur. En stor
del av den mest riskfyllda logiken är ren (utan GUI-beroende) och kan testas
**utan någon refaktorering alls**.

## 2. Strategi

### 2.1 Testpyramid för MeOS

```
        ▲  GUI/E2E: befintligt TestMeOS-harness (record/playback)
       ▲▲  — få, för kritiska flöden (avläsning → resultat → export)
      ▲▲▲
     ▲▲▲▲  Integrationstester: in-memory oEvent-fixturer
    ▲▲▲▲▲  — evaluateCard, resultat/placering, stafett, IOF-XML-rundresa
   ▲▲▲▲▲▲
  ▲▲▲▲▲▲▲  Enhetstester: rena funktioner
 ▲▲▲▲▲▲▲▲  — tid, matchning, kvalscheman, lottning, RunnerDB, parser
```

- **Enhetstester** är basen och byggs först — de kräver ingen refaktorering.
- **Integrationstester** låses upp av en headless `oEvent`-fixtur (fas C nedan).
- **GUI-tester** skrivs sparsamt i det befintliga harnesset, bara för de flöden
  som inte kan nås under GUI:t.

### 2.2 Infrastruktur (förutsättning)

1. **Separat testkörbar**: bryt ut domänkoden till ett statiskt bibliotek
   (`meos_core`) + `MeOS.exe` + `meos_tests.exe` (konsolapp med exit-kod).
   CMake rekommenderas — det låser samtidigt upp GitHub Actions
   (`windows-latest` + MSVC) som CI.
2. **Testbootstrap**: en `initTestEnvironment()` som replikerar det
   `WinMain` gör: initiera `RunnerStatusOrderMap`, `lang`, `StringCache`
   och deterministisk RNG (`InitRanom(0,0)`).
3. **Headless `oEvent`-fixtur**: fönsterlös `gdioutput("main", 1.0)` +
   byggarfunktioner för klass/bana/löpare/lag/bricka i minnet.
   Cheapaste första steget dit: bryt ut `narrow`/`widen`/`toUTF8` ur
   `gdioutput` till fria funktioner — det befriar direkt `xmlparser` och
   `csvparser` från den globala `gdi_main`.

### 2.3 Testtyper och tekniker

| Teknik | Används för |
|---|---|
| Exempelbaserade enhetstester (BDD-scenarier → testfall) | Tidstolkning, placering, kvalscheman, rogaining-reduktion |
| Rundresetester (serialisera → deserialisera → jämför) | `RunnerDB` (binärformat V1–V3), `QualificationFinal::encode/init`, IOF-XML import→export→import |
| Golden-file-tester | IOF XML 3.0, CSV-import (OE/OS/OCAD) |
| Egenskapstester/invarianter (med seedad RNG) | Lottning (`DrawOptimAlgo`): inga startkrockar, intervall respekteras |
| GUI-record/playback (befintligt harness) | Ett fåtal kritiska helhetsflöden |

### 2.4 BDD-koppling

Nya testfall utgår från Gherkin-scenarier i `features/` (se processdokumentet).
Scenarierna skrivs i domänspråk; testfallen namnges efter scenariot så att
krav ↔ test ↔ kod alltid är spårbart.

---

## 3. Identifierade svaga områden

Rangordnade efter (risk × spridning) ÷ insats. **Område 1–6 kräver ingen
refaktorering** och kan testas direkt.

| # | Område | Risk | Testbarhet |
|---|---|---|---|
| 1 | **Tidstolkning/-formatering** — `meos_util.cpp`: `convertAbsoluteTimeHMS/MS/ISO`, `convertDateYMD`, `formatTime*`, `parseRelativeTime`, `extendYear` | Tiondelsenheten; exotiska syntaxer (`2D`, `2T`, `3+`); **felaktig indata koerceras tyst till 0** (`minute>60 → 0`); `NOTIME`-sentinel vs `-1` vs `0`; ligger under varje resultat | Utmärkt — rena funktioner, noll GUI |
| 2 | **Kval/final-scheman** — `qualification_final.cpp`: `getPrelFinalFromPlace`, `computeFinals`, `encode/init`-rundresa | Fel i uppflyttning ogiltigförklarar tävlingar och är nästan omöjliga att upptäcka manuellt; delade placeringar är subtila | Mycket god — nästan ren algoritm |
| 3 | **Startlottning** — `oEventDraw.cpp`: `DrawOptimAlgo::optimizeStartOrder` (390 rader), `drawListStartGroups` (530 rader), `checkDrawSettings` | Kombinatorisk optimering; fel ⇒ startkrockar för hela tävlingen; valideras idag bara med ögonen | God — arbetar på rena structar, seedbar RNG; debug-utskrift (`printGroups`) behöver brytas ut |
| 4 | **RunnerDB** — binärformat V1–V3, bitpackade födelsedatum, namn-/id-/brickhashar, `canonizeSplitName` | Bugg korrumperar användarnas ackumulerade löpardatabas irreversibelt | Utmärkt — helt fristående, ideal för rundresetester |
| 5 | **Namn-/klass-/nummerlappsmatchning** — `compareClassName`, `compareBib`, `stringMatch` (179 rader), `stringDistance`, `canonizeName` | Fuzzy-heuristik som tyst felmatchar anmälningar vid import; locale-/accentkänslig | Utmärkt — rena funktioner |
| 6 | **Parser** (resultatmodulspråket) — `parser.cpp` | 1639 rader handrullad parser; användardefinierade resultatregler beror på den | `Parser::test()` finns redan — utöka med negativa fall och precedens |
| 7 | **`oRunner::evaluateCard`** (596 rader — kodbasens största domänfunktion) | Avgör Godkänd/Felstämplad för varje deltagare; två lägen (`doApply`) med olika aliasing av interna fält | Medel — kräver oEvent-fixtur (fas C) |
| 8 | **Resultat/placering** — `oEventResult.cpp`: `calculateResults`, `calculateTeamResults` ×3, komparatorer, `RunnerStatusOrderMap` | Delade tider, blandade statusar, flerdagars; `oEventResult.cpp:780` når in i UI-fliken `TabList`; statusordningen initieras i `WinMain` — landmina för testbinär | Medel — kräver fixtur + borttagen `TabList`-koppling |
| 9 | **Stafett/lag-logik** — `oTeam::apply` (365 rader), parallella/valfria/oordnade sträckor, omstart/rep | Kombinatorisk matris omöjlig att täcka manuellt | God — `oTeam.cpp` har i princip noll GUI-koppling |
| 10 | **Rogaining/poäng** — `calculateReduction`, lag- vs patrullvarianter | Två nästan identiska implementationer (lag/patrull) som kan glida isär; övertidsavdrag verifieras först vid protest | God — liten, aritmetisk, nära ren |
| 11 | **IOF XML 3.0** — `iof30interface.cpp` (4948 rader): entry/start/result/course-listor | Interoperabilitetsytan mot omvärlden; tyst dataförlust vid import är felmoden | Medel — golden-file-tester ideala, men ~20 `gdioutput&`-loggparametrar behöver ersättas med logginterface |
| 12 | **Testinfrastrukturen själv** (fas B/C nedan) | Inte ett test, utan **förutsättningen** för 7, 8, 9, 13, 14 | Medelinsats, låser upp allt |
| 13 | **Banvarv/gaffling/avkortning** — `oCourse::getAdapetedCourse`, `oClass::autoForking` (kombinatorisk, overflow-risk) | Banadaption ändrar tyst vad "rätt stämplat" betyder | Medel–god |
| 14 | **CSV-import** — `csvparser`: formatsniffning, OE/OS/OCAD, teckenkodning | Klassisk källa till "hälften av anmälningarna blev fel" | God — fil-in/data-ut |
| 15 | **`oDataContainer` + `oFreePunch`-hashning** | Datacontainern bär varje anpassat fält på varje objekt; hashkrockar felplacerar radiostämplingar | God — nära rena |

### Kända kodlukter att bevaka med tester (inte "fixa" utan red-test först)

- `convertAbsoluteTimeHMS`: minuter/sekunder utanför 0–60 nollställs tyst; `60` accepteras.
- `convertAbsoluteTimeISO`: parsar tidszon men **ignorerar den**.
- `formatTime*` returnerar referenser in i en roterande 256-posters `StringCache` — aliasing-fara.
- Rogaining: lag- och patrullberäkning är duplicerad kod.

---

## 4. Faser

- **Fas A — enhetstester utan refaktorering** (område 1–6): separat testkörbar
  + tester för tid, matchning, kval, lottning, RunnerDB, parser.
- **Fas B — CI**: CMake + GitHub Actions som bygger och kör `meos_tests.exe`
  på varje push/PR.
- **Fas C — fixturer**: teckenkodning ut ur `gdioutput`, testbootstrap,
  headless `oEvent`-byggare.
- **Fas D — integrationstester** (område 7–11, 13–15): evaluateCard, resultat,
  stafett, rogaining, IOF-XML-rundresa, CSV.
- **Fas E — GUI-röktester**: ett fåtal flöden i befintligt harness, körbara
  via `-test`.

Den körbara nedbrytningen finns i [TEST_TODO.md](TEST_TODO.md).
