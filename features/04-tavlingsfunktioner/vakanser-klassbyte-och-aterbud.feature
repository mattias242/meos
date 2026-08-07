# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5509
# Kod: MeOSFeatures::Vacancy, TabRunner.cpp (vakanser, klassbyte, återbud)
Egenskap: Vakanser, klassbyte och återbud
  Som sekretariat
  vill jag kunna tillsätta vakanser, byta klass och ta emot återbud
  så att startlistan kan ändras efter lottningen utan att lottas om.

  Regel: Vakanser tillsätts på sidan Deltagare

    Scenario: Deltagare sätts in på en vakansplats
      Givet en lottad klass med lediga vakanser
      När "Vakanser" väljs på sidan "Deltagare"
      Och deltagarens uppgifter skrivs in och en vakansplats klickas
      Så tillsätts vakansen med deltagaren

    Scenario: Löpardatabasen fyller i deltagaren från bricknumret
      Givet tillgång till löpardatabasen
      När ett bricknummer som finns i databasen skrivs in på vakanssidan
      Så hämtas löparens uppgifter från databasen

    Scenario: SI-enhet läser in bricknumret
      Givet en startad SI-enhet på sidan "SportIdent"
      När vakanssidan öppnas och en bricka placeras i enheten
      Så fylls bricknumret i

    Scenario: Startlistan visas efter tillsättning
      Givet en tillsatt vakans i en klass
      När tillsättningen är klar
      Så visas startlistan för klassen
      Och det går att tillsätta fler vakanser eller återgå till sidan "Deltagare"

  Regel: Utan lottning behövs inga vakanser

    Scenario: Ny deltagare läggs in direkt när klassen inte lottas
      Givet en klass som inte lottas
      När "Ny deltagare" väljs och namn, klubb, bricknummer och starttid skrivs in
      Så anmäls deltagaren utan att någon vakans behövs

  Regel: Avgiften bestäms vid anmälnings- eller tillsättningstillfället

    Scenario: Vakanstillsättning ger klassens gällande avgift
      Givet en klass med efteranmälningsavgift 150 efter ett visst datum
      När en vakans tillsätts efter det datumet
      Så får deltagaren avgiften 150

  Regel: Återbud frigör startplatsen

    Scenario: Återbud skapar en ny vakans på starttiden
      Givet en deltagare med starttid 10:24:00
      När "Återbud" väljs för deltagaren
      Så förlorar deltagaren sin starttid
      Och deltagaren får status "Återbud"
      Och en ny vakans skapas på 10:24:00

  Regel: Klassbyte flyttar deltagaren till en vakans

    Scenario: Deltagaren flyttas till en vald vakansplats
      Givet en deltagare med starttid 10:24:00 i klass "H21"
      Och en ledig vakans i klass "H35"
      När "Klassbyte" väljs och vakansen i "H35" klickas
      Så flyttas deltagaren till vakansens startplats i "H35"
      Och deltagarens tidigare plats i "H21" blir vakant

  Regel: Avgifter justeras inte automatiskt

    Scenario: Ny anmälningsavgift måste ändras för hand
      Givet en deltagare som gjort klassbyte
      När en ny anmälningsavgift eller ändringsavgift gäller
      Så måste avgiften ändras manuellt
