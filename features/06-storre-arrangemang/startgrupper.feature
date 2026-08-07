# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5458
# Kod: TabClass.cpp (startgrupper), oRunner (startgrupp, familj), oClub
Egenskap: Startgrupper
  Som arrangör
  vill jag låta löpare önska eller tilldelas ett startintervall
  så att familjer och klubbkamrater kan starta ungefär samtidigt.

  Regel: Startgrupper definieras manuellt

    Scenario: Startgrupp får id och tidsintervall
      Givet sidan "Klasser"
      När "Startgrupper" väljs och en grupp med id 1 och ett tidsintervall läggs till
      Så finns startgruppen

    Scenario: Alla startgrupper måste vara lika långa
      Givet flera definierade startgrupper
      När längderna jämförs
      Så är de lika långa

    Scenario: Grupperna behöver inte hänga ihop
      Givet startgrupper på förmiddagen, eftermiddagen och kvällen
      När grupperna definieras
      Så accepteras det

    Scenario: Vanlig grupplängd är en halvtimme eller en timme
      Givet startgrupper som ska definieras
      När längden väljs
      Så är en halvtimme eller en timme vanligt

  Regel: Deltagaren kan önska startgrupp

    Scenario: Önskad startgrupp sätts i tabelläget
      Givet tabelläget för deltagare
      När fältet "Startgrupp" sätts till en startgrupps id
      Så önskar deltagaren den startgruppen

    Scenario: Familj ger samma men ospecificerad startgrupp
      Givet två deltagare som ska starta i samma grupp utan att gruppen anges
      När fältet "Familj" sätts till samma positiva heltal för båda
      Så önskar de samma startgrupp

    Scenario: Varje familj behöver ett eget nummer
      Givet flera familjer
      När familjenummer sätts
      Så måste varje familj ha ett unikt nummer

  Regel: Klubben kan ge en förvald startgrupp

    Scenario: Klubbens startgrupp gäller medlemmar utan eget önskemål
      Givet en klubb med en definierad startgrupp i tabelläget för klubbar
      När en medlem saknar eget önskemål
      Så används klubbens startgrupp

    Scenario: Eget önskemål går före klubbens
      Givet en klubb med en definierad startgrupp
      När en medlem uttryckligen angett en annan startgrupp
      Så gäller medlemmens önskemål

  Regel: Önskemål kan blandas med tilldelning

    Scenario: Vissa önskar, övriga tilldelas
      Givet en tävling med startgrupper
      När vissa löpare önskar startgrupp och övriga får en tilldelad via klubben
      Så accepteras blandningen
