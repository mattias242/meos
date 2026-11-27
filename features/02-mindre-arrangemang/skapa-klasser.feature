# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5404
# Kod: oClass, TabClass.cpp; StatusNoTiming i oRunner.h
Egenskap: Skapa klasser
  Som arrangör
  vill jag lägga upp klasser med de egenskaper tävlingen kräver
  så att rätt deltagare bedöms mot rätt bana och rätt regler.

  # Klassernas lag- och stafettegenskaper beskrivs i avsnitt 09,
  # kval/final-egenskaper i avsnitt 10.

  Regel: Enklare arrangemang klarar sig utan avancerade inställningar

    Scenario: Förenklad vy döljer inställningar för större arrangemang
      Givet sidan "Klasser"
      När "Visa avancerade funktioner" inte är markerat
      Så visas en förenklad vy utan inställningar som bara behövs för större arrangemang

  Regel: Banpool knyter ihop bana och deltagare vid målgång

    Scenario: Deltagare får bana först vid målgång
      Givet en klass med en banpool om tre gafflingsvarianter
      Och en deltagare utan tilldelad bana
      När deltagarens bricka läses av
      Så knyts deltagaren till den bana i poolen som stämplingarna matchar

    Scenario: Banpool möjliggör gaffling utan förhandsbestämd banfördelning
      Givet en klass med gemensam start och liggande omärkta kartor
      När klassen läggs upp med banpool
      Så behöver ingen deltagare tilldelas bana i förväg

  Regel: Klassen kan öppnas för direktanmälan

    Scenario: Markerad direktanmälan gör klassen valbar i snabbformuläret
      Givet en klass där "Tillåt direktanmälan" är markerad
      När anmälningsläget på sidan "SportIdent" används
      Så går det att anmäla till klassen

  Regel: Klass utan tidtagning redovisar ingen tid

    Scenario: Godkänd deltagare i klass utan tidtagning får status utan tidtagning
      Givet en klass där "Utan tidtagning" är markerad
      När en deltagare i klassen får ett godkänt resultat
      Så är deltagarens status "Utan tidtagning"
      Och deltagarens tid visas inte i listor
      Och deltagarens tid exporteras inte
