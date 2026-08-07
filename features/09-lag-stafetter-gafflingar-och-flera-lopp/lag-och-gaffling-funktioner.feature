# language: sv
Egenskap: Lag och gaffling
  Funktioner för gafflade individuella banor, patruller, stafetter
  och löpare med flera lopp.

  Regel: Gafflad individuell (FO)

    Scenario: Löpare får banor ur klassens banpool
      Givet en klass med en banpool med tre gafflingsvarianter
      När löparna tilldelas banor
      Så får varje löpare exakt en bana ur poolen
      Och avläsningen bedöms mot löparens tilldelade bana

  Regel: Patrull (PT)

    Scenario: Patrullens resultat räknas gemensamt
      Givet en patrullklass med en patrull om två löpare
      När båda löparnas brickor är avlästa och godkända
      Så får patrullen ett gemensamt resultat baserat på reglerna för klassen

    Scenario: Felstämpling i patrullen påverkar patrullens status
      Givet en patrull där en löpare är felstämplad
      När patrullens resultat beräknas
      Så är patrullens status inte "Godkänd"

  Regel: Stafett (RL)

    Scenario: Sträcktider räknas från växling till växling
      Givet ett stafettlag där sträcka 1 går i mål 10:35:00
      När sträcka 2 går i mål 11:12:00
      Så är sträcka 2-löparens sträcktid 37:00

    Scenario: Felstämpling på en sträcka slår igenom på laget
      Givet ett lag där sträcka 2 är felstämplad
      När lagets resultat beräknas
      Så är lagets status "Felstämplat"
      Och efterföljande sträckor kan fortfarande särredovisas

    Scenario: Omstart efter rep
      Givet en stafettklass med omstartstid 12:00:00
      Och ett lag vars sträcka 2 inte växlat före repet
      När sträcka 3 startar i omstarten
      Så räknas sträcka 3:s tid från omstartstiden
      Och laget markeras som omstartat

  Regel: Flera lopp per löpare (MR)
    # Kräver Stafett

    Scenario: Samma löpare springer flera lopp med separata resultat
      Givet en klass där varje löpare springer två lopp
      När löparens båda brickor är avlästa
      Så har löparen två separata lopresultat
      Och totalresultatet följer klassens regler
