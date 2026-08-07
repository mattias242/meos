# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5443
# Kod: MeosSQL.cpp, oEventSQL.cpp, socket.cpp (UDP-sändning),
#      MeOSFeatures::Network, DirectPort i lokala inställningar
Egenskap: MeOS i nätverk
  Som arrangör med flera sekretariatsdatorer
  vill jag köra samma tävling mot en gemensam databas
  så att avläsning, anmälan och speaker arbetar mot samma data.

  Regel: Nätverksdrift kräver en MySQL-server

    Scenario: En dator agerar server
      Givet flera datorer som ska köra samma tävling
      När nätverksdrift sätts upp
      Så måste en dator agera server med MySQL installerad

    Scenario: MySQL version 5.0 eller senare krävs
      Givet en server som ska köra MeOS-databasen
      När MySQL installeras
      Så krävs version 5.0 eller senare

  Regel: Anslutningen konfigureras på sidan Tävling

    Scenario: Serveruppgifter matas in
      Givet sidan "Tävling"
      När "Databasanslutning" väljs
      Så går det att mata in uppgifter om servern

    Scenario: Servernamn eller IP-adress anges
      Givet databasanslutningens formulär
      När serverns namn eller IP-adress skrivs i fältet "MySQL server"
      Så ansluter MeOS dit

    Scenario: Användarnamn och lösenord avser MySQL
      Givet databasanslutningens formulär
      När användarnamn och lösenord matas in
      Så avser de MySQL-kontot, inte datorns inloggningsuppgifter

    Scenario: Portfältet kan lämnas blankt
      Givet en MySQL-server med standardinställningar
      När portfältet lämnas blankt
      Så används standardporten

    Scenario: Klientnamn identifierar datorn
      Givet databasanslutningens formulär
      När klientnamnet "Avläsning 1" anges
      Så visas det namnet i listan över anslutna datorer

  Regel: Tävlingar öppnas lokalt eller från servern

    Scenario: Båda listorna visas efter anslutning utan öppen tävling
      Givet en anslutning som gjorts utan öppen tävling
      När anslutningen är klar
      Så visas en lista över lokala tävlingar och en över servertävlingar

    Scenario: Tävling öppnas från en av listorna
      Givet listorna över lokala tävlingar och servertävlingar
      När en tävling väljs och "Öppna tävling" klickas
      Så öppnas tävlingen

    Scenario: Fönsterrubriken visar driftläget
      Givet en öppnad tävling
      När fönsterrubriken visas
      Så står tävlingens namn där
      Och inom parentes om tävlingen körs lokalt eller mot server

  Regel: Tävlingen laddas upp från en lokal klient

    Scenario: Lokal tävling laddas upp på servern
      Givet en lokalt öppnad tävling och anslutning mot rätt server
      När "Ladda upp öppnad tävling på server" väljs på sidan "Databasanslutningar"
      Så kan andra klienter ansluta och öppna tävlingen

    Scenario: Löpardatabasen följer med från uppladdande dator
      Givet en dator som laddar upp en tävling
      När andra klienter ansluter
      Så använder de löpardatabasen från den datorn

    Scenario: Uppdaterad löpardatabas kräver omanslutning
      Givet en uppdaterad löpardatabas på servern
      När klienterna ska använda den
      Så måste de kopplas ner och anslutas igen

  Regel: Brandväggar bör stängas av inom nätverket

    Scenario: Brandvägg hindrar anslutning
      Givet en aktiv brandvägg på servern
      När en klient försöker ansluta
      Så kan anslutningen misslyckas helt

    Scenario: Trafikanalyserande brandvägg gör nätverket långsamt
      Givet en brandvägg som analyserar all trafik
      När tävlingen körs
      Så kan nätverket fungera men gå extremt långsamt

    Scenario: Internet begränsas till en dator
      Givet ett nätverk utan interna brandväggar
      När säkerheten ska bevaras
      Så bör endast den dator som behöver Internet ha anslutning
      Och den bör ha en aktiv brandvägg mot utsidan

  Regel: Snabb förhandsinformation kringgår databasen

    Scenario: Resultat skickas ut direkt på nätverket
      Givet att "Skicka och ta emot snabb förhandsinformation" är markerat
      När ett resultat ändras
      Så skickas informationen direkt ut på nätverket

    Scenario: Lyssnande klienter uppdaterar utan databasomväg
      Givet en klient som lyssnar på förhandsinformation
      När ett resultat ändras på en annan dator
      Så uppdateras resultatlistor och speakerstöd direkt

    Scenario: Databasen ger rätt resultat även utan förhandsinformation
      Givet en klient som inte tar emot förhandsinformation
      När informationen blir tillgänglig i databasen
      Så blir resultatet rätt ändå

    Scenario: Endast först startade klienten kan lyssna
      Givet flera MeOS-klienter startade på samma dator
      När ytterligare en klient ansluter
      Så får den ett felmeddelande om att den inte kan ta emot förhandsinformation

    Scenario: Standardporten är 21338
      Givet en MeOS-installation
      När förhandsinformation skickas
      Så används UDP-sändning på port 21338 om inte "DirectPort" ändrats

    Scenario: Samma port måste användas på alla datorer
      Givet ett nätverk där "DirectPort" ändrats från standardvärdet
      När klienterna konfigureras
      Så måste samma värde användas på alla datorer

    Scenario: Flera tävlingar kan dela port
      Givet två tävlingar med olika id i samma databas
      När båda körs på samma nätverk och port
      Så stör de inte varandra

  Regel: Nedkoppling ger en lokal ögonblickskopia

    Scenario: Nedkoppling skapar en lokal kopia
      Givet en öppen servertävling
      När "Koppla ner databasen" väljs
      Så skapas en lokal kopia med namnet "tävlingsnamn (lokal kopia från: servernamn)"

    Scenario: Den lokala kopian är inte nödvändigtvis fullständig
      Givet en lokal kopia skapad vid nedkoppling
      När kopian ska användas
      Så bör den endast användas som säkerhetskopia i nödfall

    Scenario: Manuell säkerhetskopia är den normala vägen
      Givet en pågående tävling
      När en säkerhetskopia behövs
      Så används funktionen "Säkerhetskopiera" på sidan "Tävling"
