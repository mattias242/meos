# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5476
# Kod: oTeam.cpp, TabTeam.cpp (knyt löpare till sträckan, ändra lagets gaffling)
Egenskap: Hantera lag
  Som sekretariat
  vill jag kunna redigera lag och laguppställningar snabbt
  så att sena ändringar kan göras utan att skriva om uppgifter.

  Regel: Lagets uppgifter redigeras direkt på sidan Lag

    Scenario: Sidan Lag dyker upp när en lagklass finns
      Givet en tävling där en lagklass definierats
      När sidorna visas
      Så finns sidan "Lag"

    Scenario: Lagets grunduppgifter anges direkt
      Givet ett lag på sidan "Lag"
      När lagnamn, nummerlapp, klass och status anges
      Så sparas uppgifterna

    Scenario: Lagmedlemmar skrivs in direkt
      Givet ett lag på sidan "Lag"
      När namn eller bricknummer skrivs in för en lagmedlem
      Så sparas uppgiften

    Scenario: Löpare tas bort genom att sudda namnet
      Givet en lagmedlem på en sträcka
      När namnet suddas ut
      Så tas löparen bort från sträckan

  Regel: Befintliga deltagare kan flyttas mellan sträckor och lag

    Scenario: Förslagslista visas för sträckan
      Givet en sträcka i ett lag
      När "<>" (Knyt löpare till sträckan) klickas
      Så visas en lista med förslag på deltagare

    Scenario: Två redan placerade deltagare byter plats
      Givet en sträcka som redan har en löpare
      När en deltagare som redan är tilldelad en annan sträcka väljs
      Så byter deltagarna plats

    Scenario: Deltagaren öppnas för redigering
      Givet en lagmedlem
      När "..." (Redigera deltagaren) klickas
      Så visas sidan "Deltagare" med lagmedlemmen vald

  Regel: Nummerlappar tilldelas enklast när alla lag är anmälda

    Scenario: Alfabetisk ordning som standard
      Givet en klass där alla lag är anmälda
      När nummerlappar tilldelas med standardinställningarna
      Så tilldelas de i alfabetisk ordning

    Scenario: Klubbkamrater får olika gafflingar
      Givet nummerlappar tilldelade i alfabetisk ordning
      När gafflingarna bestäms
      Så får lag från samma klubb vanligtvis olika gafflingar

    Scenario: Lag som läggs till senare får nästa lediga nummer
      Givet en klass med tilldelade nummerlappar
      När ett nytt lag läggs till
      Så får laget nästa tillgängliga nummer i klassen

    Scenario: Seedade lag ordnas med kolumnen Sortering
      Givet seedade lag baserade på tidigare års resultat
      När ett tal skrivs i kolumnen "Sortering" i tabelläget
      Så styr talet ordningen före namnet

  Regel: Gafflingen styrs av startnumret

    Scenario: Ny nummerlapp ger ny gaffling
      Givet ett lag med en gaffling
      När laget får en ny nummerlapp
      Så får laget en ny gaffling

    Scenario: Gafflingen ändras genom en gafflingsnyckel
      Givet ett lag vars gaffling ska ändras
      När "Ändra lagets gaffling" väljs och en gafflingsnyckel väljs ur listan
      Så byter MeOS startnummer till ett som ger den önskade gafflingen
      Och lagets nummerlapp ändras inte
