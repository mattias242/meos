# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5501
# Kod: methodeditor.cpp (kompilering, testkörning), generalresult.cpp
Egenskap: Testkörning och avlusning
  Som skribent av en resultatmodul
  vill jag kompilera och provköra modulen mot riktiga resultat
  så att den fungerar när tävlingen är igång.

  Regel: Testet kräver resultat av rätt slag

    Scenario: Individuell modul kräver individuella resultat
      Givet en resultatmodul för individuella klasser
      När den ska testas
      Så behövs individuella resultat att testa med

    Scenario: Lagmodul kräver lagresultat
      Givet en resultatmodul för lagklasser
      När den ska testas
      Så behövs resultat för den sortens klass

    Scenario: Stämplingstestet kan skapa en testtävling
      Givet sidan "Automater"
      När "Stämplingstest" används
      Så kan en testtävling skapas

  Regel: Koden kompileras när ändringarna sparas

    Scenario: Spara ändringar kompilerar koden
      Givet skriven källkod för en regel
      När "Spara ändringar" klickas
      Så kompileras koden

    Scenario: Syntaxfel måste åtgärdas
      Givet källkod med ett syntaxfel
      När den kompileras
      Så visas ett felmeddelande
      Och felet måste åtgärdas

    Scenario: Vanlig orsak är saknat semikolon
      Givet ett kompileringsfel
      När koden granskas
      Så bör varje sats avslutas med semikolon

  Regel: Modulen kan provköras på tävlingens data

    Scenario: Testkörning över alla deltagare och lag
      Givet en kompilerad resultatmodul
      När "Testa resultatmodul" klickas
      Så körs koden på alla deltagare och lag som har resultat

    Scenario: Resultatet visas i en tabell
      Givet en lyckad testkörning
      När resultatet visas
      Så visas uträknad status, tid, poäng och placeringspoäng för deltagarna och lagen

  Regel: Fel under körning kan spåras

    Scenario: Error visas för raden som fallerar
      Givet en testkörning där ett fel inträffar
      När resultatet visas
      Så visas texten "Error" för den raden

    Scenario: Mer information visas vid muspekaren
      Givet en rad märkt "Error"
      När musen förs över texten
      Så visas mer information om felet

    Scenario: Vanliga orsaker till körfel
      Givet ett körfel i en resultatmodul
      När orsaken söks
      Så är en vanlig orsak att koden läser en symbol eller variabel som inte finns eller att en vektor indexeras utanför sin definitionsmängd

    Scenario: Testkör visar alla symboler och variabler
      Givet en rad med ett problem
      När "Testkör" väljs på den raden
      Så öppnas ett fönster med alla definierade symboler och deras värden
      Och alla variabler som metoderna definierar
      Och eventuella felmeddelanden

  Regel: Modulen ska testas noggrant före en viktig tävling

    Scenario: Kantfall måste provas
      Givet en resultatmodul som ska användas i en viktig tävling
      När den testas
      Så ska den prövas mot ofullständiga lag, trasiga kontrollenheter, saknade stämplingar och statuskoder som inte är StatusOK
