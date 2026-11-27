# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5444
# Kod: MeosSQL.cpp (återanslutning, reparation), oEvent (loggfiler)
Egenskap: Server- och nätverksproblem
  Som sekretariat
  vill jag kunna arbeta vidare när kontakten med servern bryts
  så att ett strömavbrott inte stoppar tävlingen.

  Regel: Förlorad serverkontakt stoppar inte arbetet

    Scenario: Meddelande visas när kontakten bryts
      Givet en pågående servertävling
      När kontakten med servern bryts
      Så visas ett meddelande om problemet

    Scenario: Arbetet kan fortsätta utan server
      Givet en bruten serverkontakt
      När brickor läses in och tävlingen redigeras
      Så accepteras ändringarna

    Scenario: Anslutningen återställs i bakgrunden
      Givet en bruten serverkontakt
      När MeOS arbetar vidare
      Så försöker MeOS återställa databasanslutningen i bakgrunden

    Scenario: Ändringar skickas när databasen är tillbaka
      Givet ändringar gjorda under en bruten serverkontakt
      När databasen återställts
      Så skickas ändringarna automatiskt till databasen
      Och blir tillgängliga för andra MeOS-användare

    Scenario: Kortvarigt strömavbrott klaras på batteridrivna datorer
      Givet batteridrivna klienter och en server som startas om
      När avbrottet är kortvarigt
      Så kan arbetet fortsätta utan avbrott

  Regel: Automatisk återanslutning har en risk

    Scenario: Ändringar kan gå förlorade om servern inte kommer tillbaka
      Givet en server som inte går att återställa
      När MeOS fortsätter försöka återansluta
      Så kan ändringar gå förlorade

    Scenario: Nedkoppling avbryter återanslutningsförsöken
      Givet en bruten serverkontakt
      När "Koppla ner databasen" väljs på sidan med serverinställningar
      Så slutar MeOS försöka återställa kopplingen
      Och arbetet fortsätter lokalt

  Regel: Loggfiler kan användas för att föra över avläsningar

    Scenario: Inlästa brickor förs över manuellt
      Givet loggfiler från utläsningen på en avläsningsdator
      När de förs över till huvuddatorn
      Så kan de inlästa brickorna återskapas där

  Regel: Databasen kan repareras

    Scenario: Reparation kräver att endast en klient är ansluten
      Givet meddelanden om databasfel
      När reparation ska göras
      Så måste alla andra klienter kopplas ner först

    Scenario: Nätverket bryts fysiskt för säkerhets skull
      Givet en förestående reparation
      När klienterna ska kopplas ner
      Så är det säkrast att dra ur nätverkskablar eller stänga av switchen

    Scenario: Reparation utförs från den kvarvarande klienten
      Givet den enda anslutna MeOS-klienten
      När sidan med databasanslutningar öppnas och "Reparera vald tävling" väljs
      Så repareras tävlingen

    Scenario: Lyckad reparation låter arbetet fortsätta
      Givet en lyckad reparation
      När tävlingen öppnas
      Så går arbetet att fortsätta som vanligt

  Regel: Säkerhetskopia är sista utvägen

    Scenario: Misslyckad reparation kräver återställning från säkerhetskopia
      Givet en reparation som misslyckats
      När tävlingen ska räddas
      Så öppnas en säkerhetskopia och laddas upp på servern som en ny tävling
      Och alla klienter ansluter mot den nya tävlingen
