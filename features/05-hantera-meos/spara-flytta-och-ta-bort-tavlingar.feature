# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5431
# Kod: oEvent (spara/öppna meosxml), oevent_transfer.cpp, TabCompetition.cpp
Egenskap: Spara, flytta och ta bort tävlingar
  Som arrangör
  vill jag kunna flytta en tävling mellan datorer och hålla isär versioner
  så att förberedelser hemma och drift på plats hänger ihop.

  Regel: Tävlingen sparas som en fristående fil

    Scenario: Hela tävlingen sparas som meosxml
      Givet en öppen tävling
      När "Spara som fil" väljs på sidan "Tävling"
      Så sparas hela tävlingen som en fristående meosxml-fil

    Scenario: Sparad fil importeras på en annan dator
      Givet en meosxml-fil från en annan dator
      När "Importera tävling" väljs
      Så öppnas tävlingen som en ny tävling

  Regel: Filen används för att växla mellan server och lokal drift

    Scenario: Serverdrift växlas till lokal drift
      Givet en tävling som körs mot en server
      När tävlingen sparas som fil och importeras lokalt
      Så kan arbetet fortsätta lokalt

    Scenario: Hemförberedd tävling laddas upp på server
      Givet en tävling förberedd på en hemmadator och sparad som fil
      När filen importeras på en serveransluten dator
      Och "Ladda upp tävling på server" väljs
      Så finns tävlingen på servern

  Regel: Versioner hålls isär med kommentar

    Scenario: Kommentar sätts på tävlingen
      Givet sidan "Tävling"
      När kommentaren "OL-träffen LOTTAD" skrivs i fältet "Kommentar/version"
      Så visas kommentaren i listan när en tävling ska öppnas

  Regel: Tävlingar kan raderas

    Scenario: Radering kräver bekräftelse
      Givet en öppen tävling
      När "Radera" väljs på sidan "Tävling"
      Så ställs en kontrollfråga innan tävlingen raderas

    Scenario: Tävling på server kan inte raderas när någon annan har den öppen
      Givet en tävling på en server som är öppen hos en annan användare
      När radering försöker göras
      Så nekas åtgärden

  Regel: Tävlingen har ett internt unikt id

    Scenario: Id bevaras vid import
      Givet en meosxml-fil från en tävling med ett internt id
      När tävlingen importeras
      Så bevaras id:t

    Scenario: Id används för serveruppladdning och etappkoppling
      Givet en tävling med ett internt id
      När tävlingen laddas upp på server eller kopplas till en annan etapp
      Så används id:t för att identifiera tävlingen

    Scenario: Import av befintlig tävling ger val mellan version och nytt id
      Givet att det redan finns en version av tävlingen
      När tävlingen importeras
      Så frågar MeOS om den ska importeras som ytterligare en version eller få ett nytt id

    Scenario: Mall bör importeras med nytt id
      Givet en tävling som ska användas som mall för ett nytt tävlingstillfälle
      När mallen importeras
      Så bör ett nytt id skapas
