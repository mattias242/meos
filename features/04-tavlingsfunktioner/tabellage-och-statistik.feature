# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5512
# Kod: oControl (bomtidsstatistik), Table.cpp
Egenskap: Tabelläge och statistik för kontroller
  Som banläggare
  vill jag se hur många som besökt varje kontroll och hur mycket de bommat
  så att jag får återkoppling på banläggningen.

  Regel: Statistik finns per kontroll under och efter tävlingen

    Scenario: Antal besökare visas per kontroll
      Givet en tävling med registrerade stämplingar
      När kontrollens statistik visas
      Så framgår hur många besökare kontrollen haft

    Scenario: Bomtider visas per kontroll
      Givet en tävling med registrerade stämplingar
      När kontrollens statistik visas
      Så framgår hur stora bommar som gjorts

  Regel: Tabelläget visar statistiken i tabellform

    Scenario: Tabellen innehåller besökare och bomtider
      Givet sidan "Kontroller"
      När "Tabelläge" väljs
      Så visas antal besökare, maximal bomtid, genomsnittlig bomtid
         och median-bomtid per kontroll

    Scenario: Positiv medianbom betyder att hälften missat kontrollen
      Givet en kontroll med median-bomtid 0:45
      När statistiken tolkas
      Så har hälften av besökarna missat kontrollen med minst 45 sekunder

  Regel: Extrema bomtider räknas bort

    Scenario: Individuella extremvärden påverkar inte statistiken
      Givet en kontroll där en enskild deltagare bommat mycket kraftigt
      När kontrollstatistiken beräknas
      Så räknas det extrema värdet bort
