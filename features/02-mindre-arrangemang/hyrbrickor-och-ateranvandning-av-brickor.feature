# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5407
# Kod: TabSI.cpp (tilldela hyrbrickor), oRunner (hyrbricksflagga)
Egenskap: Hyrbrickor och återanvändning av brickor
  Som sekretariat
  vill jag kunna dela ut hyrbrickor och låta samma bricka användas av flera
  så att brickförrådet räcker och brickorna kommer tillbaka.

  # Avstämning av utlämnade hyrbrickor beskrivs i avsnitt 06.

  Regel: Hyrbrickor tilldelas på sidan SportIdent

    Scenario: Deltagare utan bricka listas för tilldelning
      Givet en tävling där tre deltagare saknar bricka
      När funktionen "Tilldela hyrbrickor" väljs på sidan "SportIdent"
      Så listas de tre deltagarna med fält för bricknummer

    Scenario: SI-enhet läser in bricknumret vid tilldelning
      Givet funktionen "Tilldela hyrbrickor" med en ansluten SI-enhet
      När en bricka placeras i enheten
      Så fylls bricknumret i för den valda deltagaren

  Regel: Hyrbricka markeras på deltagaren

    Scenario: Kryssrutan hyrbricka sätts på sidan Deltagare
      Givet en deltagare med bricka 500123
      När kryssrutan för hyrbricka markeras
      Så är brickan markerad som hyrbricka för deltagaren

    Scenario: Påminnelse vid avläsning av hyrbricka
      Givet en deltagare med en bricka markerad som hyrbricka
      När deltagarens bricka läses av
      Så visas en påminnelse om att lämna tillbaka brickan

  Regel: Avgift för brickhyra ställs in på tävlingen

    Scenario: Brickhyra sätts i tävlingsinställningarna
      Givet sidan "Tävling" och dess inställningar
      När avgiften för brickhyra sätts till 50
      Så debiteras 50 för deltagare med hyrbricka

  Regel: En bricka kan återanvändas efter att den lästs av

    Scenario: Bricka tilldelas ny deltagare efter avläsning
      Givet en deltagare som gått i mål och fått bricka 500123 avläst
      När bricka 500123 tilldelas en ny deltagare
      Så accepteras tilldelningen

    Scenario: Samma bricka kan inte tilldelas två deltagare i förväg
      Givet en deltagare med bricka 500123 som inte gått i mål
      När bricka 500123 tilldelas ytterligare en deltagare
      Så går det inte att avgöra vem som sprungit med brickan först

    Scenario: Lag är undantaget eftersom sträckordningen avgör
      Givet ett stafettlag där sträcka 1 och sträcka 2 delar bricka 500123
      När laget läggs upp i förväg
      Så accepteras det, eftersom sträckordningen avgör användningsordningen
