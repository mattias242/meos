# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5418
# Kod: oReport.cpp, TabRunner.cpp (rapportläge/resultatkiosk)
Egenskap: Individuell resultatrapport och resultatkiosker
  Som arrangör
  vill jag visa en individuell resultatrapport på skärm
  så att deltagaren kan se sitt resultat direkt vid avläsningen.

  Regel: Rapportläget visar en vald deltagare

    Scenario: Deltagare väljs ur en lista
      Givet sidan "Deltagare"
      När "Rapportläge" väljs och en deltagare pekas ut
      Så visas deltagarens individuella resultatrapport

    Scenario: Rapporten följer den senast inlästa brickan
      Givet rapportläget med "Visa senast inlästa deltagare" markerat
      När en bricka läses in
      Så byter rapporten till den deltagaren

    Scenario: Deltagare som inte startat visas med starttid
      Givet en deltagare som ännu inte startat
      När rapporten visas
      Så visas starttid och startnamn

    Scenario: Väntad stafettlöpares radiopasseringar visas
      Givet en stafett där nästa löpares rapport visas
      När den föregående löparen passerat en radiokontroll
      Så visas radiopasseringen i rapporten

  Regel: Flera rapporter kan visas samtidigt

    Scenario: Antal rader och kolumner styr antalet rapporter
      Givet rapportläget
      När antalet rader sätts till 2 och antalet kolumner till 2
      Så visas fyra rapporter samtidigt

    Scenario: Klassens resultatlista kan visas i rapporten
      Givet rapportläget
      När visning av klassens resultatlista med ett visst antal resultat väljs
      Så visas resultatlistan tillsammans med rapporten

    Scenario: Sträcktider kan visas i rapporten
      Givet rapportläget
      När visning av sträcktider väljs
      Så visas deltagarens sträcktider

  Regel: Resultatkiosk låser MeOS i visningsläge

    Scenario: Kioskläget hindrar ändringar
      Givet rapportläget
      När "Resultatkiosk" väljs
      Så går endast resultatrapporten att nå
      Och inga ändringar kan göras i tävlingen

    Scenario: Kioskläget lämnas bara genom omstart
      Givet MeOS i resultatkiosk
      När läget ska lämnas
      Så måste MeOS startas om

    Scenario: SI-enhet styr vilken deltagare som visas
      Givet en resultatkiosk med ansluten SI-enhet
      När en deltagare stämplar i enheten
      Så visas deltagarens rapport

    Scenario: Tävlingsdatabasen bör lösenordsskyddas vid kiosk
      Givet en resultatkiosk tillgänglig för deltagarna
      När säkerheten övervägs
      Så bör tävlingsdatabasen lösenordsskyddas

  Regel: Deltagare i lag visas med hela laget

    Scenario: Lagets rapport visas för en lagmedlem
      Givet en deltagare som ingår i ett lag
      När deltagarens rapport visas
      Så visas hela laget

    Scenario: Inrapporterade radiotider visas för laget
      Givet ett lag med inrapporterade radiotider
      När lagets rapport visas
      Så presenteras radiotiderna

    Scenario: Checkkontroll vid växlingsfållan visar lagets status
      Givet en uppkopplad checkkontroll vid ingången till växlingsfållan
      När nästa löpare checkar
      Så visas lagets växlingstid och radiopasseringar
