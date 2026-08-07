# Utvecklingsprocess: BDD + TDD (red → green → blue)

Detta dokument beskriver hur utveckling i MeOS-forken dokumenteras och drivs med
**BDD** (Behaviour-Driven Development) på kravnivå och **TDD** (Test-Driven
Development) på kodnivå. Teststrategin och prioriterade svaga områden finns i
[TESTSTRATEGI.md](TESTSTRATEGI.md), och den körbara målbilden i
[TEST_TODO.md](TEST_TODO.md).

---

## 1. BDD — beteendedriven dokumentation av utveckling

Allt nytt beteende (och allt beteende vi säkrar upp i befintlig kod) dokumenteras
som **scenarier i Gherkin** innan implementation. Scenarierna är den levande
dokumentationen av vad systemet ska göra — inte en efterhandskonstruktion.

### 1.1 Struktur

```
features/
  <NN-avsnitt>/<sida>.feature      # Gherkin-scenarier (svenska)
docs/
  UTVECKLINGSPROCESS_BDD_TDD.md    # detta dokument
  DOKUMENTATIONSTACKNING.md        # checklista: 121 dokumentationssidor -> feature-filer
  FUNKTIONSKATALOG_BDD.md          # MeOS 19 funktionsmoduler
  TESTSTRATEGI.md                  # teststrategi + svaga områden
  TEST_TODO.md                     # prioriterad todo/målbild
```

Katalogerna under `features/` speglar avsnittsindelningen i den officiella
MeOS-dokumentationen på melin.nu, och varje `.feature`-fil motsvarar en
dokumentationssida. Kopplingen sida ↔ fil, och hur långt arbetet kommit,
följs i [DOKUMENTATIONSTACKNING.md](DOKUMENTATIONSTACKNING.md).

### 1.2 Gherkin på svenska

Gherkin har inbyggt stöd för svenska (`# language: sv`):

```gherkin
# language: sv
Egenskap: Avläsning av löparbricka
  Som tävlingssekretariat
  vill jag att en avläst bricka automatiskt kopplas till rätt löpare
  så att resultat kan räknas utan manuell hantering.

  Scenario: Bricka med korrekta stämplingar ger godkänt resultat
    Givet en tävling med en bana 31-32-33
    Och en löpare med bricknummer 500123 anmäld på banan
    När bricka 500123 läses av med stämplingarna 31, 32, 33 och mål
    Så får löparen status "Godkänd"
    Och löparens tid är måltid minus starttid
```

### 1.3 Regler för scenarier

- **Ett scenario = ett beteende.** Inga "och sen dessutom..."-scenarier.
- **Skriv i domänspråk** (löpare, bricka, stämpling, bana, klass, stafett,
  kvalificering) — aldrig i implementationstermer (pekare, SQL, GDI).
- **Givet/När/Så**: Givet = utgångsläge, När = exakt en händelse, Så = observerbart utfall.
- Scenariot skrivs **innan** koden, granskas gärna av någon med domänkunskap,
  och checkas in i samma commit/PR som implementationen.
- Kantfall (felstämpling, kvarvarande löpare, delad placering, omstart) får egna
  scenarier — det är oftast där buggarna bor.

### 1.4 Koppling scenario → test

MeOS har inget Cucumber-ramverk; scenarierna exekveras som vanliga testfall i
testharnesset (se TESTSTRATEGI.md). Kopplingen dokumenteras i testets namn och
en kommentar som pekar på .feature-filen:

```cpp
// Scenario: "Bricka med korrekta stämplingar ger godkänt resultat"
// features/02-mindre-arrangemang/brickavlasning.feature
```

Så länge testet är namngivet efter scenariot går det alltid att spåra
krav ↔ test ↔ kod.

---

## 2. TDD — red → green → blue

Varje beteende implementeras i tre steg. Committa gärna per steg, eller åtminstone
så att stegen syns i commit-historiken.

### 🔴 Red — skriv ett fallerande test först

1. Välj **nästa scenario** (eller nästa delbeteende av ett scenario).
2. Skriv testet som uttrycker det förväntade beteendet.
3. Kör testet och **verifiera att det fallerar av rätt anledning**
   (kompileringsfel räknas inte som red — testet ska köra och falla på assert).

> Om testet är svårt att skriva är det en signal om designproblem
> (oftast GUI-koppling i domänkod). Bryt loss logiken först — det är
> en del av arbetet, inte ett undantag.

### 🟢 Green — enklaste kod som får testet grönt

1. Skriv **minsta möjliga** implementation som får testet (och alla gamla
   tester) att passera.
2. Fuska gärna (hårdkoda, förenkla) — nästa test tvingar fram generalisering.
3. Kör hela testsviten. Grönt = klart med steget.

### 🔵 Blue — refaktorera

1. Städa: ta bort dubblering, förbättra namn, bryt ut funktioner,
   minska beroenden (särskilt mot `gdioutput`/Win32).
2. **Ändra inte beteende** — testsviten ska vara grön hela tiden.
3. Uppdatera scenariot om domänspråket förbättrats under arbetet.

### Definition of Done för ett beteende

- [ ] Scenario finns i `features/` och är läsbart för en icke-programmerare
- [ ] Test finns, är namngivet efter scenariot och körs i sviten
- [ ] Testet har varit rött innan implementationen (red)
- [ ] Minimal implementation på plats (green)
- [ ] Koden refaktorerad, inga nya GUI-beroenden i domänlager (blue)
- [ ] Hela testsviten grön

---

## 3. Arbetsflöde per uppgift

```
TEST_TODO.md ──▶ välj uppgift
      │
      ▼
skriv/uppdatera .feature-scenario        (BDD — dokumentation först)
      │
      ▼
red ──▶ green ──▶ blue                   (TDD — per delbeteende, repetera)
      │
      ▼
commit + PR (scenario + test + kod)      bocka av i TEST_TODO.md
```

Commitmeddelanden refererar scenariot, t.ex.
`Avläsning: godkänt resultat vid korrekta stämplingar (red+green)` följt av
`Avläsning: refaktorering av stämplingsmatchning (blue)`.
