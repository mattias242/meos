# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5483
# Kod: oTeam.cpp (rogaining för lag), oEvent (Stämplingsintervall inom
#      rogainingpatrull), oListInfo (Rogaining (Lag) / (Lag/Patrull))
Egenskap: Rogaining i lag
  Som arrangör av lagrogaining
  vill jag välja om laget delar upp sig eller springer tillsammans
  så att poängen räknas enligt tävlingens regler.

  Regel: Klassen definieras som en lagklass

    Scenario: Lagklass med maximalt antal deltagare
      Givet en lagrogaining
      När klassen definieras
      Så används en lagklass med så många deltagare som ett lag maximalt kan ha

    Scenario: Valbar sträcka tillåter färre deltagare
      Givet en lagklass för rogaining
      När sträcktypen "Valbar" används
      Så tillåts lag med färre än det maximala antalet deltagare

    Scenario: Övriga inställningar görs som vanligt
      Givet en lagklass för rogaining
      När starttid och rogaininginställningar sätts
      Så hanteras de som för individuell rogaining

  Regel: Listan Rogaining (Lag) passar när laget delar upp sig

    Scenario: Deltagarnas poäng summeras
      Givet ett lag där medlemmarna besökt olika kontroller
      När listan "Rogaining (Lag)" visas
      Så summeras deltagarnas poäng

    Scenario: Samma kontroll räknas bara en gång
      Givet ett lag där två medlemmar besökt samma kontroll
      När listan "Rogaining (Lag)" visas
      Så räknas kontrollen bara en gång

  Regel: Listan Rogaining (Lag/Patrull) förutsätter att laget håller ihop

    Scenario: Poäng ges bara för kontroller alla besökt
      Givet ett lag som ska springa tillsammans
      När en kontroll besökts av endast en lagmedlem
      Så ger kontrollen inga poäng

    Scenario: Besöken måste ske inom det tillåtna intervallet
      Givet ett inställt stämplingsintervall inom rogainingpatrull
      När lagmedlemmarna stämplat en kontroll inom intervallet
      Så ger kontrollen poäng

    Scenario: Intervallet definieras i tävlingsinställningarna
      Givet sidan "Tävling"
      När "Stämplingsintervall inom rogainingpatrull" sätts under tävlingsregler
      Så gäller det för listan "Rogaining (Lag/Patrull)"

  Regel: Listorna finns under avancerade resultatlistor

    Scenario: Båda listorna nås från sidan Listor
      Givet sidan "Listor"
      När "Resultat" och "Avancerat" väljs
      Så finns listorna "Rogaining (Lag)" och "Rogaining (Lag/Patrull)"
