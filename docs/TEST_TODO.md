# Test-TODO — målbild

Prioriterad arbetslista härledd ur [TESTSTRATEGI.md](TESTSTRATEGI.md).
Varje punkt genomförs enligt processen i
[UTVECKLINGSPROCESS_BDD_TDD.md](UTVECKLINGSPROCESS_BDD_TDD.md):
scenario först (BDD), sedan red → green → blue (TDD). Bocka av här och
referera punkten i commit/PR.

## Fas A — enhetstester utan refaktorering

- [ ] **A1. Testkörbar**: skapa `meos_tests`-konsolprojekt (egen .vcxproj eller CMake)
      som länkar mot berörda `.cpp`-filer och returnerar exit-kod ≠ 0 vid fel.
      Minimal assert-hjälpare i stil med `Parser::test()`.
- [ ] **A2. Tidstolkning** (`meos_util.cpp`): scenarier + tester för
      `convertAbsoluteTimeHMS/MS/ISO`, `convertDateYMD`, `parseRelativeTime`,
      `extendYear`. Inkludera kantfall: `2D`/`2T`/`3+`-syntax, tiondelar,
      `NOTIME`, tom sträng, samt de kända lukterna (minut/sekund > 60
      koerceras tyst till 0; ISO-tidszon ignoreras) — dokumentera nuvarande
      beteende med tester innan det ändras.
- [ ] **A3. Tidsformatering**: `formatTime`, `formatTimeMS`, `formatTimeHMS`,
      `formatTimeIOF` inkl. alla `SubSecond`-lägen och negativa tider.
- [ ] **A4. Matchning**: `compareClassName`/`decomposeClassName`
      (`H21 Elit` ≡ `H21E`), `compareBib` (`A-203`, `301a/301b`),
      `stringMatch`, `stringDistance`, `canonizeName` med svenska tecken.
- [ ] **A5. Kval/final-scheman** (`qualification_final.cpp`):
      `getPrelFinalFromPlace` inkl. delade placeringar, `computeFinals`,
      `encode`→`init`-rundresa, `importXML`/`exportXML`.
      Scenarier: `features/10-kval-och-final-knockout-sprint/redigera-kval-final-scheman.feature`.
- [ ] **A6. RunnerDB**: rundresetester för binärformat V1→V3-migrering,
      bitpackade födelsedatum, namn-/id-/brickhashar, `canonizeSplitName`.
- [ ] **A7. Startlottning** (`DrawOptimAlgo`, seedad RNG):
      invarianttester — inga startkrockar, startintervall respekteras,
      `checkDrawSettings` varnar rätt.
- [ ] **A8. Parser**: utöka `Parser::test()` med felhantering
      (ogiltig syntax, division med noll) och operatorprecedens.

## Fas B — CI

- [ ] **B1.** CMakeLists som bygger `meos_core` (statiskt bibliotek),
      `MeOS.exe` och `meos_tests.exe`.
- [ ] **B2.** GitHub Actions-workflow (`windows-latest`, MSVC) som bygger
      och kör `meos_tests.exe` på varje push/PR; röd bygge blockerar merge.

## Fas C — fixturer (låser upp integrationstester)

- [ ] **C1.** Bryt ut `narrow`/`widen`/`toUTF8` ur `gdioutput` till fria
      funktioner; koppla loss `xmlparser` och `csvparser` från globala
      `gdi_main` (blue-steg, säkras av A-testerna).
- [ ] **C2.** `initTestEnvironment()`: replikera `WinMain`-bootstrap
      (`RunnerStatusOrderMap`, `lang`, `StringCache`, `InitRanom(0,0)`).
- [ ] **C3.** Headless `oEvent`-fixtur: fönsterlös `gdioutput` +
      byggare för klass/bana/kontroll/löpare/lag/bricka i minnet.
- [ ] **C4.** Ta bort `TabList`-beroendet i `oEventResult.cpp:780`
      (resultatberäkning ska inte nå in i en UI-flik).

## Fas D — integrationstester av kärnlogik

- [ ] **D1. Brickutvärdering** (`oRunner::evaluateCard`):
      scenarier i `features/02-mindre-arrangemang/brickavlasning.feature` →
      tester för godkänd/felstämplad/extra stämplingar/okänd bricka,
      startstämpling vs tilldelad starttid, båda `doApply`-lägena.
- [ ] **D2. Placering** (`oEvent::calculateResults`):
      scenarier i `features/02-mindre-arrangemang/resultatberakning-och-placering.feature` →
      delade tider, statusordning, flerdagars input-tider, preliminära resultat.
- [ ] **D3. Stafett** (`oTeam`): sträckstatus-propagering, parallella/
      valfria/oordnade sträckor, omstart/rep, patrull.
- [ ] **D4. Rogaining**: poäng och övertidsreduktion; verifiera att lag- och
      patrullvarianterna ger samma svar (och slå ihop dem i blue-steget).
- [ ] **D5. IOF XML 3.0**: ersätt `gdioutput&`-loggparametrarna med ett
      logginterface; golden-file- och import→export→import-fixpunktstester
      för entry/start/result/course.
- [ ] **D6. CSV-import**: formatsniffning (`iscsv`), OE/OS/OCAD-import,
      teckenkodningsdetektering mot golden-filer.
- [ ] **D7. Banadaption/gaffling**: `getAdapetedCourse`, loop-banor,
      `autoForking` (inkl. overflow-gräns).
- [ ] **D8.** `oDataContainer`-serialisering och `oFreePunch`-hashning.

## Fas E — GUI-röktester

- [ ] **E1.** Ett inspelat helhetsflöde i `TestMeOS`-harnesset:
      ny tävling → anmälan → avläsning → resultatlista → IOF-export.
- [ ] **E2.** Gör harnesset körbart headless med exit-kod (idag bara
      GUI-knappar + `OutputDebugString`).

## Arbetsregler

1. Ta punkterna i ordning inom en fas; faserna A och B kan gå parallellt.
2. Varje punkt = eget scenario (vid beteende) + red → green → blue + grön svit.
3. Befintligt (även felaktigt-men-invant) beteende dokumenteras först med
   tester; beteendeändringar görs som separata, tydligt markerade commits.
