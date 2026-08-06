# MeOS funktionskatalog (BDD)

Strukturerad BDD-dokumentation av MeOS funktioner ("MeOS Features" — de
funktionsmoduler som slås på/av per tävling under Tävling → Funktioner).

> **Källa:** Kodens kanoniska funktionsregister `code/MeOSFeatures.cpp`
> (konstruktorn definierar samtliga funktioner, grupper, koder och beroenden).
> Webbsidan `melin.nu/meos/sv/show.php?base=156&id=5400` kunde inte hämtas
> från denna miljö (nätverkspolicyn tillåter endast GitHub/paketregister) —
> katalogen bör korsläsas mot sidan när den är åtkomlig.

Scenarierna finns som körbar dokumentation i `features/funktioner/`:

| Fil | Innehåll |
|---|---|
| [funktionsval.feature](../features/funktioner/funktionsval.feature) | Själva funktionsmekanismen: beroenden, standardval, serialisering |
| [allmant.feature](../features/funktioner/allmant.feature) | Gruppen **Allmänt** |
| [meos-funktioner.feature](../features/funktioner/meos-funktioner.feature) | Gruppen **MeOS-funktioner** |
| [lag-och-gaffling.feature](../features/funktioner/lag-och-gaffling.feature) | Gruppen **Lag och gaffling** |
| [rogaining.feature](../features/funktioner/rogaining.feature) | Gruppen **Rogaining** |
| [tidtagning.feature](../features/funktioner/tidtagning.feature) | Gruppen **Tidtagning** |

## Funktionsöversikt

Kod = den tvåbokstavskod som lagras i tävlingens `Features`-sträng
(serialiseras som t.ex. `BB+CL+SL`, tom uppsättning som `NONE`).

### Allmänt (General)

| Funktion | Kod | Beskrivning | Kräver |
|---|---|---|---|
| Lotta startlistor (DrawStartList) | `SL` | Förbered/lotta startlistor | — |
| Nummerlappar (Bib) | `BB` | Nummerlappshantering | — |
| Klubbar (Clubs) | `CL` | Klubbtillhörighet för deltagare | — |
| Redigera klubbar (EditClub) | `CC` | Egen klubbtabell och redigering | Clubs |
| Kvar-i-skogen (InForest) | `RF` | Spåra löpare som är kvar i skogen | — |
| Nätverk (Network) | `NW` | Flera MeOS-klienter i nätverk mot samma tävling | — |

### MeOS-funktioner

| Funktion | Kod | Beskrivning | Kräver |
|---|---|---|---|
| Speakerstöd (Speaker) | `SP` | Speakerläge med förvarningar och liveresultat | — |
| Flera etapper (SeveralStages) | `ST` | Etapptävling med totaltider | — |
| Ekonomi (Economy) | `EC` | Avgifter och fakturering | EditClub, Clubs |
| Vakanser (Vacancy) | `VA` | Vakansplatser och återbud | DrawStartList |
| Tidstillägg (TimeAdjust) | `TA` | Manuella tidstillägg och justeringar | — |
| Löpardatabas (RunnerDb) | `RD` | Klubb- och löpardatabas | Clubs |

### Lag och gaffling

| Funktion | Kod | Beskrivning | Kräver |
|---|---|---|---|
| Gafflad individuell (ForkedIndividual) | `FO` | Gafflade individuella banor | — |
| Patrull (Patrol) | `PT` | Patrullklasser (flera löpare, gemensamt resultat) | — |
| Stafett (Relay) | `RL` | Stafettklasser med sträckor | — |
| Flera lopp per löpare (MultipleRaces) | `MR` | Samma löpare springer flera lopp | Relay |

### Rogaining

| Funktion | Kod | Beskrivning | Kräver |
|---|---|---|---|
| Rogaining | `RO` | Poängorientering med maxtid | — |
| Poängavdrag (PointAdjust) | `PA` | Manuella poängavdrag och justeringar | Rogaining |

### Tidtagning

| Funktion | Kod | Beskrivning | Kräver |
|---|---|---|---|
| Utan banor (NoCourses) | `NC` | Tidtagning utan banor/kontroller | — |

## Regler i funktionsmekanismen (verifierade i kod)

1. **Beroenden aktiveras automatiskt**: när en funktion slås på aktiveras även
   alla funktioner den kräver (`useFeature`).
2. **Krävda funktioner kan inte slås av**: en funktion som någon aktiv funktion
   beror på vägras avaktivering (`isRequiredInternal`). Rogaining kan
   dessutom inte slås av så länge tävlingen har rogaining-klasser.
3. **Standardval härleds från tävlingen** (`loadDefaults`): klubbar, nätverk,
   gafflad individuell, vakanser, kvar-i-skogen, startlottning och nummerlappar
   är alltid på som standard; ekonomi/speaker/löpardatabas styrs av
   tävlingsinställningar; patrull/stafett/flera lopp/etapper härleds från
   klasstrukturen.
4. **Serialisering**: aktiva funktioner lagras som `+`-separerade koder;
   tom uppsättning lagras som `NONE`; okända koder ignoreras vid inläsning
   och saknade beroenden fylls i.
5. **"Använd alla"** aktiverar allt utom Utan banor (`useAll`).
