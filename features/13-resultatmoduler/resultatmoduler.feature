# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5497
# Kod: generalresult.cpp, methodeditor.cpp, parser.cpp (MRL)
Egenskap: Resultatmoduler
  Som arrangör med egna tävlingsregler
  vill jag beskriva resultatuträkningen i en egen modul
  så att listor, export och speakerstöd följer tävlingens regler.

  Regel: Modulen används för regler MeOS inte har inbyggda

    Scenario: Tidstillägg vid felaktig stämpling
      Givet en resultatmodul med regeln tidstillägg för stämpling vid fel kontroll
      När resultatet räknas ut
      Så läggs tillägget på i stället för diskning

    Scenario: Lagtävling där antal medlemmar i mål avgör
      Givet en resultatmodul för en lagtävling
      När första laget med ett visst antal medlemmar går i mål
      Så vinner det laget

    Scenario: Tidsbonus för sträcksegrar
      Givet en resultatmodul med tidsbonus
      När en löpare vinner en sträcka
      Så dras bonusen från lagets tid

    Scenario: Straffrundor vid uppfyllt kriterium
      Givet en resultatmodul med straffrundor
      När kriteriet är uppfyllt
      Så krävs extra kontroller

  Regel: Modulen består av resultatregler i MRL

    Scenario: Moduler skapas och ändras från sidan Listor
      Givet sidan "Listor"
      När funktionen "Resultatmoduler" väljs
      Så kan resultatmoduler skapas och ändras

  Regel: Modulen kopplas in via listan

    Scenario: Listan pekar ut modulen
      Givet en resultatmodul
      När "Resultatuträkning" sätts till modulen i listans egenskaper
      Så används modulen för listans resultat

    Scenario: Egen sortering följer modulen
      Givet en lista med en resultatmodul
      När "Global sorteringsordning" sätts till "Egen sortering"
      Så sorteras listan enligt resultatuträkningen

    Scenario: Varje listpost måste markeras för att använda modulens data
      Givet en listpost för deltagarens tid
      När "Data från resultatmodul" markeras
      Så hämtas tiden från modulen

    Scenario: Både justerad och faktisk tid kan visas
      Givet en lista med en resultatmodul
      När en listpost använder modulens data och en annan inte gör det
      Så kan den justerade tiden visas tillsammans med den faktiska inom parentes
