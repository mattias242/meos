# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5432
# Kod: onlineresults.cpp (MOP), iof30interface.cpp, TabAuto.cpp
Egenskap: Publicera resultat på Internet
  Som arrangör
  vill jag skicka tävlingsdata löpande till en webbtjänst
  så att publiken kan följa resultaten live.

  Regel: Automaten Resultat online sköter publiceringen

    Scenario: Automaten startas på sidan Automater
      Givet sidan "Automater"
      När automaten "Resultat online" läggs till
      Så kan tävlingsdata exporteras eller laddas upp

    Scenario: Inställningarna kan sparas i tävlingen
      Givet en konfigurerad automat
      När "Spara inställningar" väljs
      Så kan automaten snabbt startas om vid behov

    Scenario: Lösenord sparas inte i tävlingen
      Givet en automat med lösenord
      När inställningarna sparas
      Så sparas lösenordet på datorn men inte i tävlingen

    Scenario: Automaten kan namnges
      Givet en automat
      När ett namn anges
      Så visas automaten med det namnet

  Regel: Klasser och kontroller väljs

    Scenario: Klassurval styr vad som publiceras
      Givet automaten "Resultat online"
      När klasser väljs i listan
      Så publiceras resultat endast för dessa klasser

    Scenario: Namngivna kontroller och radiokontroller är förvalda
      Givet en tävling med namngivna kontroller och registrerade radiostämplingar
      När kontrollurvalet visas
      Så är dessa kontroller förvalda

    Scenario: Kontrollurvalet utökas när stämplingar inkommer
      Givet en publicerande automat
      När radiostämplingar från en ny kontroll inkommer
      Så utökas antalet exporterade kontroller automatiskt

  Regel: MeOS Online Protocol skickar förändringar kompakt

    Scenario: MOP skickar mål, start och mellantider
      Givet automaten med formatet "MeOS Online Protocol"
      När tävlingsdata förändras
      Så skickas förändringarna kompakt

    Scenario: MOP 2.0 hanterar raderade deltagare effektivare
      Givet en mottagare som stöder MOP version 2.0
      När formatet väljs
      Så bör version 2.0 användas

    Scenario: Banor kan inkluderas
      Givet automaten med MOP-format
      När "Inkludera banor" väljs
      Så skickas detaljer om gafflingsalternativ för alla deltagare

    Scenario: IOF-XML kan användas men ger stora filer
      Givet automaten
      När formatet IOF-XML väljs
      Så exporteras resultaten i det formatet
      Och filerna kan bli ganska stora

  Regel: Filerna kan skickas till webben eller sparas på disk

    Scenario: Stora filer packas
      Givet automaten med "Packa stora filer" valt
      När en stor fil exporteras
      Så komprimeras den i ett zip-arkiv

    Scenario: Filer skickas direkt till en webbserver
      Givet automaten med "Skicka till webben" valt
      När tävlingens id-nummer och lösenord angetts
      Så skickas filerna till servern

    Scenario: Filer sparas på disk med löpnummer
      Givet automaten med "Spara på disk" och filnamnsprefixet "res"
      När filer exporteras
      Så får de namnen "res1.xml", "res2.xml" och så vidare

    Scenario: Eget skript körs efter varje export
      Givet automaten med ett angivet skript
      När en export genomförts
      Så körs skriptet

  Regel: Tomt tidsintervall ger direktexport vid förändring

    Scenario: MOP exporterar direkt när tidsintervallet är tomt
      Givet automaten med MOP-format och stabil internetuppkoppling
      När tidsintervallet lämnas blankt
      Så exporteras data direkt när en förändring sker

  Regel: Långsam uppkoppling bör inte blockera sekretariatet

    Scenario: Dedikerad MeOS-klient för uppladdning
      Givet en långsam internetuppkoppling
      När uppladdningen tar tid
      Så bör en dedikerad MeOS-process användas enbart för uppladdning

    Scenario: Flera MeOS-instanser på samma dator varnar
      Givet en dator med flera startade MeOS-instanser
      När instanserna körs
      Så varnar MeOS om att snabb förhandsinformation är blockerad på alla klienter utom den först startade
