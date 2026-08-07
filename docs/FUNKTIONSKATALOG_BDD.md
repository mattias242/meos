# MeOS funktionskatalog (BDD)

Strukturerad BDD-dokumentation av MeOS funktioner ("MeOS Features" — de
funktionsmoduler som slås på/av per tävling under Tävling → MeOS funktioner).

> **Källor:**
> 1. Kodens kanoniska funktionsregister `code/MeOSFeatures.cpp`
>    (konstruktorn definierar samtliga funktioner, grupper, koder och beroenden)
>    samt guiden i `code/newcompetition.cpp`.
> 2. Officiell dokumentation, korsläst 2026-08-07:
>    [MeOS funktioner](https://melin.nu/meos/sv/show.php?base=5400&id=5434) (uppd. 2024-03-25),
>    [Skapa en ny tävling](https://melin.nu/meos/sv/show.php?base=5400&id=5422),
>    [Tidtagning utan banor och kontroller](https://melin.nu/meos/sv/show.php?base=5400&id=5507) (uppd. 2026-05-04).
>
> Kolumnen **Namn i MeOS** är den svenska etiketten som visas för användaren;
> `Identifierare` är enum-värdet i `MeOSFeatures::Feature`.

Scenarierna finns som körbar dokumentation i `features/` (se
[DOKUMENTATIONSTACKNING.md](DOKUMENTATIONSTACKNING.md) för hela strukturen):

| Fil | Innehåll |
|---|---|
| [funktionsval.feature](../features/05-hantera-meos/meos-funktioner/funktionsval.feature) | Själva funktionsmekanismen: beroenden, standardval, guidens profiler, serialisering |
| [allmant.feature](../features/05-hantera-meos/meos-funktioner/allmant.feature) | Gruppen **Allmänt** |
| [meos-funktioner.feature](../features/05-hantera-meos/meos-funktioner/meos-funktioner.feature) | Gruppen **MeOS-funktioner** |
| [lag-och-gaffling-funktioner.feature](../features/09-lag-stafetter-gafflingar-och-flera-lopp/lag-och-gaffling-funktioner.feature) | Gruppen **Lag och gaffling** |
| [rogaining-funktioner.feature](../features/11-rogaining/rogaining-funktioner.feature) | Gruppen **Rogaining** |
| [tidtagning-utan-banor-och-kontroller.feature](../features/03-tidtagning-utan-banor-och-kontroller/tidtagning-utan-banor-och-kontroller.feature) | Gruppen **Tidtagning** |

## Funktionsöversikt

Kod = den tvåbokstavskod som lagras i tävlingens `Features`-sträng
(serialiseras som t.ex. `BB+CL+SL`, tom uppsättning som `NONE`).

### Allmänt (General)

| Namn i MeOS | Identifierare | Kod | Beskrivning (officiell dokumentation) | Kräver |
|---|---|---|---|---|
| Förbereda startlistor | DrawStartList | `SL` | Lottning och relaterade funktioner. | — |
| Nummerlappar | Bib | `BB` | Hantering av nummerlappar. | — |
| Klubbar | Clubs | `CL` | Indela deltagarna i klubbar. Kan stängas av när klubbtillhörighet inte är relevant (multisport, prova-på). | — |
| Redigera klubbar | EditClub | `CC` | Används om klubbarna behöver hanteras manuellt, t.ex. slå ihop en klubb som lagts in två gånger med olika stavningar. | Klubbar |
| Beräkna kvar-i-skogen | InForest | `RF` | Håll reda på vilka löpare som inte gått i mål. | — |
| Flera MeOS-klienter i nätverk | Network | `NW` | Använd en databas för att koppla ihop flera datorer. | — |

### MeOS-funktioner (MeOS Features)

| Namn i MeOS | Identifierare | Kod | Beskrivning (officiell dokumentation) | Kräver |
|---|---|---|---|---|
| Använd speakerstöd | Speaker | `SP` | Aktiverar sidan **Speaker**. | — |
| Flera etapper | SeveralStages | `ST` | När du vill få ut totalresultat från flera tävlingar. | — |
| Ekonomi och avgifter | Economy | `EC` | Tilldela avgifter och hantera fakturor. | Redigera klubbar, Klubbar |
| Vakanser och återbud | Vacancy | `VA` | Tilldela vakansplatser, hantera klassbyten och återbud i lottade individuella startlistor. | Förbereda startlistor |
| Manuellt tidstillägg/justering | TimeAdjust | `TA` | Justera sluttiden manuellt utan att ändra tidpunkten för målgång. | — |
| Klubb- och löpardatabas | RunnerDb | `RD` | Fyll i fullständig information om löpare från databasen. Avaktiveras t.ex. vid distriktsmatcher, landslagsdrabbningar eller multisport. | Klubbar |

### Lag och gaffling (Teams and forking)

| Namn i MeOS | Identifierare | Kod | Beskrivning (officiell dokumentation) | Kräver |
|---|---|---|---|---|
| Gafflade individuella banor | ForkedIndividual | `FO` | Kan vara både rättvisa (slingor) eller orättvisa (banpool, träning). | — |
| Patruller | Patrol | `PT` | Stöd för patruller med två eller flera deltagare (och en eller flera brickor). | — |
| Stafetter och lagtävlingar | Relay | `RL` | Hantera klasser med flera sträckor, gafflingar, växlingar och jaktstart. | — |
| Flera lopp för en löpare | MultipleRaces | `MR` | Låt samma deltagare springa flera lopp i samma stafett. | Stafetter |

### Rogaining

| Namn i MeOS | Identifierare | Kod | Beskrivning (officiell dokumentation) | Kräver |
|---|---|---|---|---|
| Rogaining | Rogaining | `RO` | Poängorientering. | — |
| Manuella poängavdrag/justeringar | PointAdjust | `PA` | Manuell justering av poäng. | Rogaining |

### Tidtagning (Timekeeping)

| Namn i MeOS | Identifierare | Kod | Beskrivning | Kräver |
|---|---|---|---|---|
| Utan banor | NoCourses | `NC` | Tidtagning utan orienteringsbana med kontroller. Främsta effekten är att fliken **Banor** och andra baninställningar döljs. | — |

> **Avvikelse mellan kod och dokumentation:** funktionen *Utan banor* (`NC`)
> saknas i beskrivningslistan på dokumentationssidan *MeOS funktioner*. Den
> beskrivs i stället i det egna avsnittet
> [Tidtagning utan banor och kontroller](https://melin.nu/meos/sv/show.php?base=5400&id=5507),
> som också anger att funktionen väljs via guidens knapp
> *Endast tidtagning (utan banor)*. Övriga 18 funktioner i koden motsvaras
> exakt av dokumentationens beskrivningslista.

## Regler i funktionsmekanismen (verifierade i kod)

1. **Beroenden aktiveras automatiskt**: när en funktion slås på aktiveras även
   alla funktioner den kräver (`useFeature`).
2. **Krävda funktioner kan inte slås av**: en funktion som någon aktiv funktion
   beror på vägras avaktivering (`isRequiredInternal`). Rogaining kan
   dessutom inte slås av så länge tävlingen har rogaining-klasser
   (`isRequired`). Dokumentationen formulerar samma regel som "vissa funktioner
   kan inte avaktiveras när de används eller behövs för annan funktionalitet".
3. **Att slå av en funktion raderar aldrig data.** Dokumentationens formulering:
   *"Att stänga av en funktion påverkar aldrig tävlingen på annat sätt än att
   funktionen inte är aktiv."* Inmatade avgifter försvinner ur gränssnittet när
   Ekonomi stängs av, men finns kvar om funktionen aktiveras igen.
   `useFeature(f, false, oe)` rör bara `features`-mängden och `Features`-strängen
   — ingen tävlingsdata skrivs om.
4. **Standardval härleds från tävlingen** (`loadDefaults`): klubbar, nätverk,
   gafflad individuell, vakanser, kvar-i-skogen, startlottning och nummerlappar
   är alltid på som standard; ekonomi (`UseEconomy`), speaker (`UseSpeaker`) och
   löpardatabas (`SkipRunnerDb`) styrs av tävlingsinställningar;
   patrull/stafett/flera lopp/etapper härleds från klasstrukturen
   (`ClassConfigInfo`), och rogaining av att tävlingen har rogaining-klasser.
5. **Serialisering**: aktiva funktioner lagras som `+`-separerade koder;
   tom uppsättning lagras som `NONE`; okända koder ignoreras vid inläsning
   och saknade beroenden fylls i.
6. **"Använd alla"** aktiverar allt utom Utan banor (`useAll`).

## Funktionsprofiler i guiden "Ny tävling"

När en ny tävling skapas väljs funktionsuppsättning i guidens steg 2
(`newcompetition.cpp`, `newCompetitionGuide(gdi, 2)`). Valet kan när som helst
ändras via Tävling → MeOS funktioner. Profilerna är genvägar — de sätter en
bestämd uppsättning funktioner och kör sedan vidare i guiden.

| Knapp | Grupp | Aktiverar | Knapp-id |
|---|---|---|---|
| Individuell tävling | Individuellt | Speaker, Ekonomi, Redigera klubbar, Nätverk, Vakanser, Kvar-i-skogen, Förbereda startlistor, Nummerlappar, Löpardatabas (+ Klubbar via beroenden) | `FIndividual` |
| Individuellt, gafflat | Individuellt | Som *Individuell tävling* + Gafflade individuella banor | `FForked` |
| Endast grundläggande (enklast möjligt) | Individuellt | Nollställer allt och aktiverar endast Klubbar och Löpardatabas | `FBasic` |
| Endast tidtagning (utan banor) | Individuellt | Speaker, Ekonomi, Redigera klubbar, Nätverk, Vakanser, Förbereda startlistor, Nummerlappar, Löpardatabas, **Utan banor** (obs: *inte* Kvar-i-skogen) | `FNoCourses` |
| Tävling med lag | Lag och stafett | Som *Individuell tävling* + Stafett (+ Flera lopp per löpare om tävlingen har flerloppslöpare) | `FTeam` |
| Endast tidtagning (utan banor), stafett | Lag och stafett | Som *Endast tidtagning* + Stafett | `FNoCoursesRelay` |
| Alla funktioner | Övrigt | `useAll` — allt utom Utan banor | `FAll` |
| Välj från lista… | Övrigt | Går till guidens steg 3 med kryssrutor per funktion | `FSelect` |

**Regel:** om tävlingen redan innehåller lag (`oEvent::hasTeam()`) avaktiveras
de individuella profilerna (`FIndividual`, `FForked`, `FBasic`, `FNoCourses`) —
lagtävlingen skulle annars förlora stafettfunktionen.

> Dokumentationssidan *Skapa en ny tävling* (uppd. 2015-02-12) listar sex
> profiler; koden i MeOS 5.0 har åtta — de två *Endast tidtagning*-varianterna
> har tillkommit. Dokumentationen är alltså efter koden på den punkten.

## Användningsfall som bygger på Utan banor

Dokumentationssidan *Tidtagning utan banor och kontroller* beskriver
**varvräkning** som ett användningsfall: deltagaren stämplar en varvningskontroll
efter varje varv och en målkontroll vid målgång, och resultatet tas fram med
listorna *Varvräkning* eller *Varvräkning med mellantid*. Två stämplingar av
varvningskontrollen räknas som samma varv om de sker inom en minut (skydd mot
extra säkerhetsstämpling). Regeln ligger i resultatmodulen för varvningsresultat
(MRL), inte i C++-koden i detta repo, och kan ändras där.
