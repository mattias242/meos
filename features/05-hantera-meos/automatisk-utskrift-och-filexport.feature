# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5426
# Kod: TabAuto.cpp, printresultservice.cpp
Egenskap: Automatisk utskrift och filexport
  Som sekretariat
  vill jag låta en automat skriva ut och exportera listor med jämna mellanrum
  så att anslagstavla och webb hålls uppdaterade utan handpåläggning.

  Regel: Automaten skapas på sidan Automater eller från listan

    Scenario: Automaten Resultat/export skapas
      Givet sidan "Automater"
      När automaten "Resultat / export" läggs till
      Så kan utskrift och export ställas in

    Scenario: Automat skapas direkt från en lista
      Givet en visad lista
      När "Automatisera" väljs
      Så skapas en automat för den listan

  Regel: Automaten kan skriva ut, exportera eller båda

    Scenario: Utskrift kräver skrivarval
      Givet en automat med utskrift vald
      När automaten konfigureras
      Så måste skrivare och inställningar väljas

    Scenario: Export kräver en målfil
      Givet en automat med export vald
      När automaten konfigureras
      Så måste en fil att exportera till väljas

    Scenario: Filformatet kan vara strukturerat eller fritt formaterat
      Givet en automat med export vald
      När filformatet väljs
      Så kan det vara strukturerat, baserat på en tabellstruktur, eller fritt formaterat

    Scenario: HTML med AutoRefresh laddas om i webbläsaren
      Givet en automat med HTML-export
      När "HTML med AutoRefresh" aktiveras
      Så instrueras webbläsaren att ladda om filen med samma intervall som den exporteras

  Regel: Ett eget skript kan köras efter varje export

    Scenario: Skript körs efter export
      Givet en automat med ett angivet skript
      När en export genomförts
      Så körs skriptet

  Regel: Tidsintervallet styr hur ofta automaten kör

    Scenario: Intervall sätts på automaten
      Givet en automat
      När tidsintervallet sätts
      Så görs utskriften eller exporten med det intervallet

  Regel: Listval styr innehåll och formatering

    Scenario: Listans innehåll väljs i automaten
      Givet en automat
      När listval görs
      Så bestäms vad listan innehåller och hur den formateras

  Regel: Endast ändrade sidor kan skrivas ut

    Scenario: Oförändrade sidor hoppas över
      Givet en automat med "Skriv endast ut ändrade sidor"
      När endast sida två i en klass har ändrats
      Så skrivs bara sida två ut

    Scenario: Den som anslår listor måste vara uppmärksam
      Givet att endast ändrade sidor skrivs ut
      När sidor anslås
      Så måste den som anslår hålla reda på vilka sidor som hör ihop

    Scenario: Omstart nollställer minnet av utskrivna sidor
      Givet en automat som skrivit ut ett antal sidor
      När automaten startas om
      Så glömmer MeOS vilka sidor som skrivits ut tidigare
