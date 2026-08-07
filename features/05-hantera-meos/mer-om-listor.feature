# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5428
# Kod: TabList.cpp, oListInfo.cpp, metalist.cpp
Egenskap: Mer om listor
  Som sekretariat
  vill jag nå specialiserade listor och spara egna listval
  så att tävlingen kan presenteras på de sätt den kräver.

  Regel: Avancerade resultatlistor ger fler alternativ

    Scenario: Avancerat öppnar specialiserade listor
      Givet sidan "Listor" under rubriken "Resultatlistor"
      När "Avancerat" väljs
      Så blir mer specialiserade listor tillgängliga
      Och det går att välja exakt vilka klasser listan ska omfatta

    Scenario: Alla listor stöder inte alla alternativ
      Givet en vald specialiserad lista
      När alternativen visas
      Så är endast de alternativ listan stöder tillgängliga

    Scenario: Lista med mellantider för namngivna kontroller
      Givet en kontroll namngiven "Varvning"
      När en lista med mellantider tas fram
      Så skrivs mellantiden vid "Varvning" ut

    Scenario: Resultat för en del av banan
      Givet en långdistansbana med en sprintdel
      När en lista tas fram från kontroll A till kontroll B
      Så visar listan resultatet för den delen av banan

    Scenario: Resultatlista vid radiokontroll
      Givet en radiokontroll på banan
      När en lista skapas från start till radiokontrollen
      Så används mellantiderna på samma sätt som i speakersystemet
      Och listan "Allmänna resultat" ger en lämplig formatering

    Scenario: Sträcka väljs för stafettresultat
      Givet en stafettävling
      När fältet "Sträcka" fylls i
      Så tas resultatet fram för den sträckan

    Scenario: Egen listrubrik kan anges
      Givet en lista som stöder egen rubrik
      När en rubrik skrivs in
      Så används den i stället för standardrubriken

  Regel: Alla listtyper nås systematiskt

    Scenario: Knappen Alla listor visar samtliga listtyper
      Givet sidan "Listor"
      När "Alla listor" väljs
      Så visas samtliga listtyper som finns i MeOS

    Scenario: Först-i-mål klassvis bortser från starttid
      Givet en klass med olika starttider
      När listan "Först-i-mål (klassvis)" visas
      Så vinner den som kom först i mål, oavsett starttid

    Scenario: Först-i-mål gemensam slår ihop alla klasser
      Givet en tävling med flera klasser
      När listan "Först-i-mål (gemensam)" visas
      Så visas en sammanslagen lista i målgångsordning

    Scenario: Prisutdelningslistan visar avgjorda placeringar
      Givet en pågående tävling
      När prisutdelningslistan visas
      Så framgår hur många placeringar som är avgjorda per klass
      Och när de återstående kommer att vara avgjorda

    Scenario: Bantilldelning visar vem som springer vilken bana
      Givet en tävling med banor tilldelade
      När listan "Bantilldelning" visas
      Så framgår vem som springer vilken bana

    Scenario: Resultat per bana sorterar banvis
      Givet en tävling med flera klasser på samma bana
      När listan "Resultat per bana" visas
      Så sorteras resultatet banvis i stället för klassvis

    Scenario: Resultat banvis per klass sorterar per gaffling
      Givet en klass med gafflade banvarianter
      När listan "Resultat banvis per klass" visas
      Så sorteras resultatet per gaffling inom klassen

    Scenario: Snabbknappar visar de mest relevanta listorna
      Givet en tävling av en viss typ
      När sidan "Listor" visas
      Så finns snabbknappar till de listor som är mest relevanta för tävlingstypen

  Regel: Sparade listval hanteras samlat

    Scenario: Kom ihåg listan sparar listvalet
      Givet en lista med gjorda inställningar
      När "Kom ihåg listan" väljs
      Så sparas listan under "Sparade listval" på sidan "Listor"

    Scenario: Sparade listor kan visas, döpas om och tas bort
      Givet en sparad lista
      När "Sparade listval" öppnas
      Så går listan att visa, döpa om och ta bort

    Scenario: Två listor slås ihop
      Givet två sparade listor
      När de slås ihop
      Så visas de efter varandra

    Scenario: Ihopslagen lista kan delas upp igen
      Givet en lista som är en ihopslagning av flera listor
      När "Dela upp" väljs
      Så delas listan upp i sina komponenter

  Regel: Egna listor kan skapas och hanteras

    Scenario: Listredigeraren startas
      Givet sidan "Listor"
      När "Redigera lista" väljs
      Så startas listredigeraren

    Scenario: Egna listor hanteras samlat
      Givet sidan "Listor"
      När "Hantera egna listor" väljs
      Så visas tävlingens egna listor
      Och listor som kan installeras
      Och det går att bläddra efter och importera listor definierade på fil
