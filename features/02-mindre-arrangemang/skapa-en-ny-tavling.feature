# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5422
# Kod: code/newcompetition.cpp (newCompetitionGuide)
Egenskap: Skapa en ny tävling
  Som arrangör
  vill jag skapa tävlingen i en guide som frågar efter det nödvändiga
  så att jag snabbt kommer igång och slipper se funktioner jag inte använder.

  # Funktionsprofilerna i guidens steg 2 dokumenteras i
  # features/05-hantera-meos/meos-funktioner/funktionsval.feature.

  Regel: Tävlingen skapas från MeOS startsida

    Scenario: Ny tävling skapas med namn, datum och första starttid
      Givet MeOS startsida
      När "Ny tävling" väljs
      Och namn, datum och första tillåtna starttid fylls i
      Så skapas en tävling med de angivna uppgifterna

    Scenario: Tävling hämtas från Eventor i stället för att skapas manuellt
      Givet MeOS startsida och en konfigurerad Eventorkoppling
      När en tävling hämtas från Eventor
      Så skapas tävlingen med uppgifter från Eventor

  Regel: Anmälda kan importeras direkt eller senare

    Scenario: Anmälda importeras som ett steg i guiden
      Givet en nyss ifylld tävlingsuppgift i guiden
      När "Importera anmälda" väljs
      Så visas ett formulär för att välja filer med anmälningsdata
      Och guiden går vidare till valet av funktioner

    Scenario: Import hoppas över och guiden går direkt till funktionsvalet
      Givet en nyss ifylld tävlingsuppgift i guiden
      När import av anmälda väljs bort
      Så visas valet av MeOS funktioner

  Regel: Funktionsvalet kan ändras när som helst

    Scenario: Funktioner ändras efter att tävlingen skapats
      Givet en skapad tävling
      När "MeOS funktioner" väljs på sidan "Tävling"
      Så går det att aktivera och avaktivera funktioner
      Och bortvalda funktioner döljs i användargränssnittet
