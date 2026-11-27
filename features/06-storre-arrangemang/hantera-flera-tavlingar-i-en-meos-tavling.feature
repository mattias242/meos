# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5462
# Kod: iof30interface.cpp (import med förskjutning av klass-id)
Egenskap: Hantera flera tävlingar i en MeOS-tävling
  Som arrangör av två samtidiga tävlingar på samma plats
  vill jag hantera dem som en MeOS-tävling
  så att brickavläsning och direktanmälan kan delas.

  Regel: Klasserna bör ha unika namn

    Scenario: Unika klassnamn minskar risken för fel bana
      Givet två uppsättningar klasser från olika källor
      När klasserna läggs in
      Så bör namnen vara unika eftersom banimportfiler vanligtvis kopplar bana till klass via namnet

    Scenario: MeOS tillåter ändå flera klasser med samma namn
      Givet två klasser med samma namn
      När de skapas
      Så accepteras det

  Regel: Olika klass-id kräver ingen särskild hantering

    Scenario: Två källor med olika klass-id importeras rakt av
      Givet två anmälningsfiler vars klasser har olika id
      När båda importeras
      Så läggs de nya klasserna till
      Och deltagarna hamnar i rätt klass

  Regel: Överlappande klass-id kräver förskjutning

    Scenario: Förskjutning adderas till klassernas id
      Givet två källor där samma klass-id används för olika klasser
      När den andra källan importeras med förskjutningen 1000
      Så adderas 1000 till klassernas id när klasserna skapas
      Och när anmälningarnas klass-id tolkas

    Scenario: Samma förskjutning måste användas varje gång
      Givet en källa som importerats med en viss förskjutning
      När data importeras från samma källa igen
      Så måste samma förskjutning användas

  Regel: Export sker per uppsättning klasser

    Scenario: Klasser väljs vid exporten
      Givet en tävling med två uppsättningar klasser
      När start- och resultatlistor exporteras
      Så väljs vilka klasser som ska ingå i varje fil

    Scenario: Ursprungligt klass-id används vid export
      Givet en import gjord med förskjutning av klass-id
      När data exporteras
      Så används det ursprungliga klass-id:t

    Scenario: Två klasser med samma id kan inte exporteras till samma fil
      Givet två klasser med samma externa id
      När de ska exporteras till samma fil
      Så måste antingen det externa id:t ändras eller olika filer användas

  Regel: Eventorkopplingen kan inte användas

    Scenario: Manuell import och export krävs
      Givet en tävling med data från flera källor
      När Eventor ska användas
      Så måste import och export av filer göras manuellt
