# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5436
# Kod: infoserver.cpp, restserver.cpp, RestService.cpp
Egenskap: MeOS informationsserver
  Som arrangör
  vill jag starta MeOS inbyggda webbserver
  så att resultat kan visas på nätverkets skärmar och hämtas av egna program.

  Regel: Servern startas som en automat

    Scenario: Informationsservern startas med vald TCP-port
      Givet sidan "Automater"
      När funktionen "Informationsserver" startas med en vald TCP-port
      Så lyssnar servern på den porten

    Scenario: Statistik och testlänk visas
      Givet en startad informationsserver
      När automaten visas
      Så visas statistik och en webblänk för att testa servern

    Scenario: Brandvägg kan behöva öppnas
      Givet en startad informationsserver
      När servern inte går att nå från en annan dator
      Så kan trafik behöva tillåtas genom brandväggar på den angivna porten

  Regel: Testsidan länkar till resultatlistor

    Scenario: Resultatlistor nås via länkar
      Givet en startad informationsserver
      När testsidan öppnas
      Så visas länkar till olika resultatlistor från MeOS

    Scenario: Resultatsidorna uppdateras automatiskt
      Givet en öppnad resultatsida från informationsservern
      När tävlingsdata ändras
      Så uppdateras sidan med jämna mellanrum

    Scenario: Sidorna kan visas på en nätverksansluten TV
      Givet en startad informationsserver
      När en TV ansluten till nätverket öppnar en resultatsida
      Så visas resultaten på skärmen

  Regel: Rotadressen kan mappas

    Scenario: Rotadressen mappas till direktanmälan
      Givet en startad informationsserver
      När "Mappa rotadressen" sätts till direktanmälan
      Så leder http://datornamn:port/ till direktanmälan

    Scenario: Port 80 förenklar adressen
      Givet en dator utan annan webbserver
      När porten sätts till 80
      Så förenklas adressen till http://datornamn/

  Regel: Egna listor blir tillgängliga via servern

    Scenario: Sparad lista publiceras
      Givet en egen lista som visats och sparats med "Kom ihåg listan"
      När informationsservern körs
      Så är listan tillgänglig via servern

  Regel: REST-API för egna tillämpningar

    Scenario: API-dokumentationen finns på testsidan
      Givet en startad informationsserver
      När testsidan visas
      Så följer dokumentation av MeOS REST-API efter länkarna

    Scenario: Data hämtas direkt från MeOS
      Givet ett eget program och en startad informationsserver
      När programmet anropar REST-API:t
      Så hämtas tävlingsdata direkt från MeOS
