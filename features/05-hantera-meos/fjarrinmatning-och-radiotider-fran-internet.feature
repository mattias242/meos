# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5433
# Kod: onlineinput.cpp (MIP, ROC, SI), TabAuto.cpp
Egenskap: Fjärrinmatning och radiotider från Internet
  Som arrangör
  vill jag hämta stämplingar, brickinläsningar och anmälningar från en webbtjänst
  så att radiokontroller i skogen och fjärranmälningar når tävlingen.

  Regel: Automaten Fjärrinmatning hämtar data från en URL

    Scenario: Adressen till webbservern anges
      Givet sidan "Automater"
      När automaten "Fjärrinmatning" läggs till och en URL anges
      Så hämtas data från den servern

    Scenario: Inställningarna kan sparas och namnges
      Givet en konfigurerad automat
      När "Spara inställningar" väljs
      Så kan automaten snabbt startas om
      Och lösenord sparas på datorn men inte i tävlingen

  Regel: Servertypen väljs

    Scenario: MeOS Input Protocol stöder allt
      Givet automaten med typen "MeOS Input Protocol"
      När data hämtas
      Så stöds stämplingar, brickinläsningar och anmälningar

    Scenario: Radio Online Control stöds
      Givet automaten med typen "Radio Online Control"
      När data hämtas
      Så hämtas radiostämplingar

    Scenario: SportIdent Center stöds
      Givet automaten med typen "SportIdent Center"
      När data hämtas
      Så hämtas radiostämplingar

  Regel: Anmälan via MIP kan begränsas

    Scenario: Anmälan tillåts
      Givet automaten med typen "MeOS Input Protocol"
      När "Tillåt anmälan" väljs
      Så kan deltagare anmäla sig via tjänsten

    Scenario: Alla tillåts anmäla sig
      Givet att anmälan är tillåten med begränsningen "Alla"
      När någon anmäler sig
      Så accepteras anmälan

    Scenario: Endast personer i löpardatabasen tillåts
      Givet begränsningen "Från löpardatabasen"
      När en person som inte finns i databasen anmäler sig
      Så nekas anmälan

    Scenario: Klubben måste redan finnas i tävlingen
      Givet begränsningen "Från löpardatabasen i befintliga klubbar"
      När en person från en klubb som inte finns i tävlingen anmäler sig
      Så nekas anmälan

    Scenario: Klubben måste vara fakturerbar
      Givet begränsningen "Från löpardatabasen i fakturerbar klubb"
      När en person från en klubb utan adress i databasen anmäler sig
      Så nekas anmälan

    Scenario: Tillåtna klasser begränsas
      Givet att anmälan är tillåten
      När klassvalet "Med direktanmälan" görs
      Så kan anmälan endast ske till klasser som tillåter direktanmälan

  Regel: Tävlingen identifieras mot servern

    Scenario: Tävlingens id-nummer definieras av webbservern
      Givet automaten
      När tävlingens id-nummer anges
      Så hämtas stämplingar från rätt tävling

    Scenario: Enhets-id kan användas i stället för tävlings-id
      Givet automaten med typen "Radio Online Control" eller "SportIdent Center"
      När enhets-id väljs i stället för tävlings-id
      Så hämtas stämplingar per enhet

    Scenario: Flera enheters id kan listas för SportIdent Center
      Givet automaten med typen "SportIdent Center"
      När flera enheters id-nummer listas
      Så hämtas stämplingar från samtliga

  Regel: Kontrollmappning ger en kod en särskild funktion

    Scenario: Kod utan mappning tolkas som en kontroll
      Givet en inkommande kod utan kontrollmappning
      När koden tolkas
      Så behandlas den som en kontroll med den koden

    Scenario: Kod mappas till start, check eller mål
      Givet automaten
      När en kod matas in och funktionen "Mål" väljs
      Så tolkas inkommande stämplingar med den koden som målstämpling
