# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5486
# Kod: oEvent (Hantera flera etapper), oevent_transfer.cpp
Egenskap: Förberedelser inför flera etapper
  Som arrangör
  vill jag koppla ihop etapperna innan tävlingen börjar
  så att resultat kan överföras mellan dem.

  # Rubriken är stavad "Förberelser" på dokumentationssidan.

  Regel: Varje etapp är en fristående tävling

    Scenario: Etapperna kan köras på olika datorsystem
      Givet en tävling med flera etapper
      När etapperna genomförs
      Så är varje etapp en helt fristående tävling

    Scenario: Överföring kräver att båda etapperna finns lokalt
      Givet två etapper som ska kopplas ihop
      När resultat ska överföras
      Så måste båda tävlingarna finnas lokalt på samma dator

  Regel: Variant ett — en anmälan till samtliga etapper

    Scenario: Etapp 1 skapas med klasser och anmälda
      Givet en ny tävling
      När klasser och anmälda importeras
      Så blir tävlingen etapp 1

    Scenario: Ny etapp kopierar klasser och anmälda
      Givet etapp 1 med klasser och anmälda
      När "Hantera flera etapper" och "Lägg till ny etapp" väljs på sidan "Tävling"
      Så skapas en ny tävling "Etapp 2"
      Och alla klasser och anmälda kopieras dit

    Scenario: Etappnumret sätts vid skapandet
      Givet en tävling utan etappnummer
      När en ny etapp läggs till
      Så ändras denna etapps nummer från "Inget nummer" till "Etapp 1"

    Scenario: Fler etapper skapas genom att upprepa
      Givet två skapade etapper
      När "Öppna nästa" väljs och proceduren upprepas
      Så skapas ytterligare etapper

    Scenario: Etapperna hanteras därefter var för sig
      Givet skapade etapper
      När banor läggs till och lottning görs
      Så hanteras varje etapp som en separat tävling

  Regel: Nummerlappar och lottning bör göras före etappskapandet

    Scenario: Samma nummerlapp i alla etapper
      Givet en tävling där nummerlappar tilldelats och vakanser lottats in
      När etapperna skapas
      Så får deltagarna samma nummerlapp i alla etapper

    Scenario: Nummerlappar kan annars klistras mellan etapper
      Givet etapper skapade utan nummerlappar
      När nummerlappar ska sättas
      Så kan de klippas och klistras i tabelläget med deltagarna sorterade lika

  Regel: Större klassändringar bör undvikas efter etappskapandet

    Scenario: Vakanstillsättning och klassbyte kan följa med
      Givet en tillsatt vakans eller ett klassbyte i etapp 1
      När resultat överförs till nästa etapp
      Så kan följande etapper uppdateras på motsvarande sätt

    Scenario: Tillagda eller delade klasser måste ändras i alla etapper
      Givet en klass som läggs till eller delas efter att etapperna skapats
      När ändringen görs
      Så måste samma ändring göras manuellt i samtliga etapper
      Och slutresultatet måste kontrolleras noggrant

    Scenario: Etapperna bör skapas efter efteranmälningstidens slut
      Givet en tävling med öppen efteranmälan
      När etapperna ska skapas
      Så bör det vänta tills tiden gått ut, om inte vakanser används
         för att tillsätta efteranmälda

  Regel: Variant två — separat anmälan till varje etapp

    Scenario: Etapperna skapas som fristående tävlingar
      Givet separat anmälan per etapp
      När varje etapp skapas med egna klasser, banor och anmälda
      Så finns oberoende tävlingar med delvis överlappande deltagare

    Scenario: Klassnamnen måste matcha exakt
      Givet två fristående etapper som ska kopplas ihop
      När klasserna skapas
      Så måste klassnamnen matcha exakt

    Scenario: Etapperna kopplas ihop från etapp 1
      Givet två fristående tävlingar
      När etapp 1 öppnas och "Hantera flera etapper" väljs
      Och etapp 2 väljs i listvalet "Nästa etapp"
      Och denna etapps nummer sätts till "Etapp 1"
      Så är etapperna kopplade

    Scenario: Kopplingen kontrolleras från nästa etapp
      Givet en gjord koppling
      När "Öppna nästa" väljs
      Så sparas ändringarna och nästa etapp öppnas
      Och etapp 1 står som "Föregående etapp"
      Och denna etapps nummer är två

    Scenario: Navigering tillbaka till föregående etapp
      Givet en öppnad etapp 2
      När "Öppna föregående" väljs
      Så öppnas etapp 1 igen
