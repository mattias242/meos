# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5520
# Kod: maprenderer.cpp, utm.cpp (UTM-projektion), image.cpp
Egenskap: Kartor
  Som sekretariat och funktionär
  vill jag kunna visa banor och felstämplingar på en riktig karta
  så att avvikelser blir begripliga och direktanmälda kan välja bana.

  Regel: Kartan importeras tillsammans med banorna

    Scenario: Kartbild importeras med banfilen
      Givet en banfil med kontrollkoordinater i formatet IOF-XML
      När "Importera från fil" väljs på sidan "Banor" och "Importera kartbild" markeras
      Och bildfilen och en world-fil väljs
      Så importeras kartan georefererad

    Scenario: Kartan kan läggas till i efterhand
      Givet en tävling med importerade banor men utan karta
      När "Lägg till karta" väljs under funktioner på sidan "Banor"
      Så läggs kartan till

    Scenario: Karta utan world-fil lokaliseras manuellt
      Givet en kartbild utan world-fil
      När ett par kontroller placeras ut manuellt
      Så blir kartan lokaliserad

  Regel: Kartbilden ska ha en läsbar skärmupplösning

    Scenario: PNG med lagom upplösning
      Givet en karta som ska visas på skärm
      När bilden exporteras
      Så ska det vara en PNG-fil med lagom upplösning
      Och onödigt hög utskriftsupplösning ger ingen fördel

  Regel: World-filens projektion tolkas

    Scenario: UTM-projektion stöds
      Givet en world-fil med koordinater i UTM
      När kartan importeras
      Så tolkas koordinaterna

    Scenario: Oprojicerad longitud och latitud stöds
      Givet en world-fil med oprojicerade koordinater i longitud och latitud
      När kartan importeras
      Så tolkas koordinaterna

    Scenario: UTM-zonen bestäms från kontrollernas koordinater
      Givet en karta i UTM-projektion
      När kartan importeras
      Så bestäms zonen automatiskt från kontrollernas koordinater

  Regel: Kartan används på flera sidor

    Scenario: Felstämpling visas på karta
      Givet en felstämplad deltagare
      När "Visa felstämpling" väljs på sidan "Deltagare"
      Så visas kontrollen som saknar stämpling på kartan
      Och en eventuell kontroll som felaktigt stämplats i stället

    Scenario: Enskild kontroll visas på karta
      Givet en vald kontroll på sidan "Kontroller"
      När "Karta" väljs
      Så visas kontrollen i en liten kartbild
      Och en översiktsbild visar var på kartan kontrollen ligger

    Scenario: Banan visas vid direktanmälan
      Givet anmälningsläget på sidan "SportIdent"
      När "Visa karta" väljs
      Så visas den aktuella banan i ett separat fönster

    Scenario: Samtliga banor visas från sidan Banor
      Givet sidan "Banor"
      När "Karta" väljs
      Så visas samtliga banor på kartan

    Scenario: Kartfönstret kan flyttas till en deltagarvänd skärm
      Givet ett öppet kartfönster och en separat skärm riktad mot deltagarna
      När fönstret dras till skärmen
      Så visas kartan för deltagarna
