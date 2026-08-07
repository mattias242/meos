# MRL-symboler — referens

Symboler som MeOS definierar för resultatmoduler skrivna i MRL
(MeOS Result Language). Källa:
[Definierade symboler](https://melin.nu/meos/sv/show.php?base=5400&id=5500),
hämtad 2026-08-07, korsläst mot `code/generalresult.cpp` (`declareSymbol`).

Vektorer markeras med `[]` och matriser med `[][]`. Index är nollbaserade.
Använd `Symbol.size()` för antalet element, och `RunnerStatus.size()` för
antalet deltagare i ett lag.

Språkets syntax och reglernas semantik dokumenteras som scenarier i
[features/13-resultatmoduler/](../features/13-resultatmoduler/).

## Avvikelser funna vid korsläsningen

1. **`StatusNotCompetiting` är den föråldrade stavningen.** Koden deklarerar båda
   stavningarna (`generalresult.cpp:1084-1085`); den felstavade är markerad
   `// Deprecated`. Dokumentationssidan *Resultatregler* anger den felstavade
   varianten bland tillåtna returvärden, medan symboltabellen anger den rätta.
   Använd `StatusNotCompeting`.
2. **`RGPointLimit` har fel beskrivning.** Symbolen deklareras med texten
   "Rogaining time limit" (`generalresult.cpp:1072`), men tilldelas
   `getMinimumRogainingPoints()` (`generalresult.cpp:1230`) — alltså
   rogainingtävlingens **poänggräns**, inte tidsgräns. Felet finns i koden och
   har följt med till dokumentationen. `RGTimeLimit` är tidsgränsen.


## Deltagare (70 symboler)

| Symbol | Betydelse |
|---|---|
| `Age` | Ålder vid årets slut |
| `AgeHighLimit` | Åldersgräns äldre/pensionär |
| `AgeLowLimit` | Åldersgräns ungdom |
| `Bib` | Nummerlapp |
| `BirthYear` | Födelseår |
| `CardControls[]` | Deltagares bricka, matchade kontroller (-1 för omatchade stämplingar) |
| `CardPunches[]` | Deltagares bricka, stämplingskoder |
| `CardTimes[]` | Deltagares bricka, stämplingstider |
| `CheckTime` | Checktid |
| `ClassDataA` | Extra tilldelad klassdata (A) |
| `ClassDataB` | Extra tilldelad klassdata (B) |
| `ClubId` | Klubb-id |
| `ComputedPoints` | Poäng beräknad av modulens poängmetod |
| `ComputedStatus` | Status beräknad av modulens statusmetod |
| `ComputedTime` | Tid beräknad av modulens tidsmetod |
| `Course[]` | Deltagares bana |
| `CourseId` | Deltagares banans id |
| `CourseLength` | Banans längd |
| `DataA` | Extra tilldelad data (A) |
| `DataB` | Extra tilldelad data (B) |
| `DistrictId` | Distrikt-id |
| `Fee` | Deltagares/lags avgift |
| `Finish` | Deltagares/lags måltid |
| `InputNumber` | Användardefinierat inmatat värde |
| `InputPlace` | Deltagares/lags ingångsplacering |
| `InputPoints` | Deltagares/lags ingångspoäng |
| `InputStatus` | Deltagares/lags ingångsstatus |
| `InputTime` | Deltagares/lags ingångstid |
| `Leg` | Sträcknummer, nollindexerat |
| `LegPlace[]` | Placering på sträcka |
| `LegTimeAfter[]` | Tid efter sträcksegrare |
| `LegTimeDeviation[]` | Avvikelse +/- från förväntad tid på sträcka |
| `LocalTime` | Lokal datortid |
| `MaxTime` | Maxtid |
| `Place` | Deltagares/lags placering |
| `PointAdjustment` | Deltagares/lags manuella poängjustering |
| `PointGross` | Rogainingpoäng före automatisk reduktion |
| `PointOvertime` | Deltagares/lags rogaining-övertid |
| `PointReduction` | Uträknad poängreduktion för rogaining |
| `Points` | Deltagares/lags rogainingpoäng |
| `RGMaxPoints` | Maximalt antal rogainingpoäng |
| `RGPointLimit` | Rogaining **poänggräns** (dokumentationen och koden anger felaktigt "tidsgräns", se avvikelse 2) |
| `RGReduction` | Rogaining, poängreduktion per minut |
| `RGTimeLimit` | Rogaining tidsgräns |
| `Shorten` | Antal banavkortningar |
| `ShortestClassTime` | Snabbast tid i klassen |
| `SplitTimes[]` | Deltagares mellantider |
| `SplitTimesAccumulated[]` | Deltagares totala löptid till kontroll |
| `StagePlace[]` | Deltagare/lag: placering på etapper |
| `StagePoints[]` | Deltagare/lag: poäng på etapper |
| `StageStatus[]` | Deltagare/lag: status på etapper |
| `StageTime[]` | Deltagare/lag: tid på etapper |
| `Start` | Deltagares/lags starttid |
| `Status` | Deltagares/lags status |
| `StatusCANCEL` | Statuskod för återbud |
| `StatusDNF` | Statuskod för utgått |
| `StatusDNS` | Statuskod för ej start |
| `StatusDQ` | Statuskod för diskvalificering |
| `StatusMAX` | Statuskod för uppnådd maxtid |
| `StatusMP` | Statuskod för saknad stämpling |
| `StatusNoTiming` | Statuskod för utan tidtagning |
| `StatusNotCompeting` | Statuskod deltar ej |
| `StatusOK` | Statuskod för giltigt resultat |
| `StatusOutOfCompetition` | Statuskod för lopp utom tävlan |
| `StatusUnknown` | Statuskod för okänt resultat |
| `Time` | Deltagares/lags tid |
| `TimeAdjustment` | Deltagares/lags tidsjustering |
| `TotalPlace` | Deltagares/lags sammanlagda placering |
| `TotalStatus` | Deltagares/lags sammanlagda status |
| `TotalTime` | Deltagares/lags sammanlagda tid |

## Lag (70 symboler)

| Symbol | Betydelse |
|---|---|
| `Bib` | Nummerlapp |
| `ClassDataA` | Extra tilldelad klassdata (A) |
| `ClassDataB` | Extra tilldelad klassdata (B) |
| `ClubId` | Klubb-id |
| `ComputedPoints` | Poäng beräknad av modulens poängmetod |
| `ComputedStatus` | Status beräknad av modulens statusmetod |
| `ComputedTime` | Tid beräknad av modulens tidsmetod |
| `DataA` | Extra tilldelad data (A) |
| `DataB` | Extra tilldelad data (B) |
| `DistrictId` | Distrikt-id |
| `Fee` | Deltagares/lags avgift |
| `Finish` | Deltagares/lags måltid |
| `InputNumber` | Användardefinierat inmatat värde |
| `InputPlace` | Deltagares/lags ingångsplacering |
| `InputPoints` | Deltagares/lags ingångspoäng |
| `InputStatus` | Deltagares/lags ingångsstatus |
| `InputTime` | Deltagares/lags ingångstid |
| `LocalTime` | Lokal datortid |
| `MaxTime` | Maxtid |
| `PatrolRogainingOvertime` | Patrulls tid övertid |
| `PatrolRogainingReduction` | Patrullens poängreduktion |
| `PatrolRogainingScore` | Patrullpoäng, rogaining |
| `Place` | Deltagares/lags placering |
| `PointAdjustment` | Deltagares/lags manuella poängjustering |
| `PointGross` | Rogainingpoäng före automatisk reduktion |
| `PointOvertime` | Deltagares/lags rogaining-övertid |
| `PointReduction` | Uträknad poängreduktion för rogaining |
| `Points` | Deltagares/lags rogainingpoäng |
| `RGMaxPoints` | Maximalt antal rogainingpoäng |
| `RGPointLimit` | Rogaining **poänggräns** (dokumentationen och koden anger felaktigt "tidsgräns", se avvikelse 2) |
| `RGReduction` | Rogaining, poängreduktion per minut |
| `RGTimeLimit` | Rogaining tidsgräns |
| `RunnerCardControls[][]` | Matchade kontroller (-1 för omatchade) för varje lagmedlem |
| `RunnerCardPunches[][]` | Stämplingskoder för varje lagmedlem |
| `RunnerCardTimes[][]` | Stämplingstider för varje lagmedlem |
| `RunnerCourse[][]` | Deltagares bana |
| `RunnerDataA[]` | Extra data (A) för var lagmedlem |
| `RunnerDataB[]` | Extra data (B) för var lagmedlem |
| `RunnerFinish[]` | Måltid för varje lagmedlem |
| `RunnerOutputNumbers[][]` | Utdata (tal) från varje lagmedlem |
| `RunnerOutputTimes[][]` | Utdata (tid) från varje lagmedlem |
| `RunnerPoints[]` | Poäng för varje lagmedlem |
| `RunnerSplitTimes[][]` | Deltagares mellantider |
| `RunnerStart[]` | Starttid för varje lagmedlem |
| `RunnerStatus[]` | Status för varje lagmedlem |
| `RunnerTime[]` | Tid för varje lagmedlem |
| `Shorten` | Antal banavkortningar |
| `ShortestClassTime` | Snabbast tid i klassen |
| `StagePlace[]` | Deltagare/lag: placering på etapper |
| `StagePoints[]` | Deltagare/lag: poäng på etapper |
| `StageStatus[]` | Deltagare/lag: status på etapper |
| `StageTime[]` | Deltagare/lag: tid på etapper |
| `Start` | Deltagares/lags starttid |
| `Status` | Deltagares/lags status |
| `StatusCANCEL` | Statuskod för återbud |
| `StatusDNF` | Statuskod för utgått |
| `StatusDNS` | Statuskod för ej start |
| `StatusDQ` | Statuskod för diskvalificering |
| `StatusMAX` | Statuskod för uppnådd maxtid |
| `StatusMP` | Statuskod för saknad stämpling |
| `StatusNoTiming` | Statuskod för utan tidtagning |
| `StatusNotCompeting` | Statuskod deltar ej |
| `StatusOK` | Statuskod för giltigt resultat |
| `StatusOutOfCompetition` | Statuskod för lopp utom tävlan |
| `StatusUnknown` | Statuskod för okänt resultat |
| `Time` | Deltagares/lags tid |
| `TimeAdjustment` | Deltagares/lags tidsjustering |
| `TotalPlace` | Deltagares/lags sammanlagda placering |
| `TotalStatus` | Deltagares/lags sammanlagda status |
| `TotalTime` | Deltagares/lags sammanlagda tid |
