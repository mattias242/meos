# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5446
# Kod: oEvent (autosave), TabAuto.cpp (säkerhetskopiering),
#      TabSI.cpp (sireadlog, importera från fil)
Egenskap: Säkerhetskopior och återställning
  Som arrangör
  vill jag att tävlingen säkerhetskopieras automatiskt och kunna återställa den
  så att ett haveri inte kostar mer än några minuters arbete.

  Regel: Alla anslutna datorer säkerhetskopierar automatiskt

    Scenario: Säkerhetskopia var tredje minut
      Givet en MeOS-dator ansluten mot tävlingen
      När tävlingen är öppen
      Så tas en säkerhetskopia var tredje minut

    Scenario: Kopiorna sparas i MeOS datakatalog
      Givet automatiska säkerhetskopior
      När de ska letas upp
      Så ligger de i MeOS datakatalog

    Scenario: Datakatalogen framgår under inställningar
      Givet MeOS utan öppen tävling
      När "Inställningar" öppnas
      Så framgår vilken datakatalog som används

  Regel: Automatiska kopior återställs från första sidan

    Scenario: Säkerhetskopia väljs ur en lista
      Givet MeOS första sida
      När "Återställ säkerhetskopia" väljs
      Så visas en lista sorterad på tävlingsnamn och tidpunkt

    Scenario: Vald kopia återställs
      Givet listan över säkerhetskopior
      När en kopia väljs
      Så återställs tävlingen från den

  Regel: Extra kopior kan sparas på annan plats

    Scenario: Automaten säkerhetskopiering sparar på vald plats
      Givet sidan "Automater"
      När automaten "Säkerhetskopiering" läggs till med en plats och ett tidsintervall
      Så sparas extra säkerhetskopior där med det intervallet

  Regel: Manuell säkerhetskopia sparas som en fristående fil

    Scenario: Hela tävlingen sparas som XML
      Givet en öppen tävling
      När "Säkerhetskopiera" eller "Spara som fil" väljs på sidan "Tävling"
      Så sparas hela tävlingen som en fristående XML-fil

    Scenario: Filen återställs som en ny tävling
      Givet en sparad tävlingsfil och MeOS utan öppen tävling
      När "Importera tävling" väljs
      Så importeras tävlingen som en ny tävling
      Och ingen befintlig tävling skrivs över

  Regel: Varje inläst bricka loggas omedelbart

    Scenario: Brickinläsningar sparas i en csv-fil
      Givet en pågående brickinläsning
      När en bricka läses in
      Så sparas den omedelbart i filen sireadlog_datum_tid.csv

    Scenario: Filnamnets datum och tid avser inläsningens start
      Givet en loggfil från brickinläsningen
      När filnamnet tolkas
      Så avser datum och tid när MeOS brickinläsning påbörjades

    Scenario: Filen ligger i mappen MeOS på skrivbordet
      Givet en loggfil från brickinläsningen
      När den ska letas upp
      Så ligger den i mappen "MeOS" på skrivbordet

    Scenario: Loggfilen läses in igen
      Givet en loggfil med inlästa brickor
      När "Importera från fil" väljs på sidan "SportIdent"
      Så får det samma effekt som om alla brickor lästs in igen
