# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5408
# Kod: oCourse (getAdapetedCourse, loopbanor)
Egenskap: Slingor med varvningskontroll
  Som banläggare för en träning med slingor i valfri ordning
  vill jag mata in ett exempel på banan och peka ut varvningskontrollen
  så att jag slipper mata in alla gafflingsvarianter för hand.

  # Fem slingor i valfri ordning ger 120 möjliga banvarianter.

  Regel: Banan anges som ett exempel plus en varvningskontroll

    Scenario: Bana med slingor läggs upp från ett exempel
      Givet sidan "Banor"
      När en bana matas in med slingorna tagna i ordningen A, B, C, D, E
      Och "Bana med slingor" markeras med varvningskontrollen angiven
      Så är banan definierad för alla ordningar av slingorna

    Scenario: Banan anpassas efter deltagarens faktiska ordning
      Givet en bana med slingor och angiven varvningskontroll
      När en deltagare gått i mål med slingorna i ordningen C, A, E, B, D
      Så skapas automatiskt en bana som matchar den ordningen
      Och deltagaren bedöms mot den banan

  Regel: Funktionen fungerar även för gafflingar av typ fjäril

    Scenario: Fjärilsgaffling hanteras som slingor
      Givet en bana med fjärilsgaffling och angiven varvningskontroll
      När en deltagare gått i mål
      Så bedöms deltagaren mot en bana som matchar den faktiska ordningen

  Regel: Slingorna kan sorteras vid sträcktidsexport

    Scenario: Sorterade slingor gör sträcktider jämförbara
      Givet en tävling med slingbanor
      När sträcktider exporteras med sortering av slingor
      Så ser alla deltagare ut att ha sprungit slingorna i samma ordning

    Scenario: Osorterade slingor behåller den faktiska ordningen
      Givet en tävling med slingbanor
      När sträcktider exporteras utan sortering av slingor
      Så redovisas slingorna i den ordning deltagaren sprang dem
      Och sträcktiderna kan matchas mot GPS-spår

  Regel: Slingor kan kombineras med avkortning

    Scenario: Avkortad banvariant med färre slingor
      Givet en bana med slingor där "Med avkortning" är markerad
      Och en avkortad banvariant med färre slingor
      När en deltagare gått i mål med det mindre antalet slingor
      Så bedöms deltagaren mot den avkortade varianten

  Regel: Ordningen mellan slingorna kontrolleras inte
    # Funktionen är främst tänkt för träningar och träningstävlingar.

    Scenario: MeOS kontrollerar inte att en viss slingordning följts
      Givet en bana med slingor
      När en deltagare sprungit slingorna i en annan ordning än den tänkta
      Så godkänns deltagaren ändå
