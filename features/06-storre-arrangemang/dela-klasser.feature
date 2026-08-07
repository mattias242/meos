# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5448
# Kod: TabClass.cpp (dela klass), oEvent (rankingdata, tidigare etapp)
Egenskap: Dela klasser
  Som arrangör av en stor klass
  vill jag dela den i flera klasser efter en vald metod
  så att startfältet blir hanterbart och rättvist fördelat.

  Regel: Delningen görs med en vald metod

    Scenario: Klubbvis delning håller ihop klubbkamrater
      Givet en stor klass
      När klassen delas med metoden "Klubbvis"
      Så placeras deltagare från samma klubb i samma klass

    Scenario: Slumpmässig delning
      Givet en stor klass
      När klassen delas med metoden "Slumpmässigt"
      Så fördelas deltagarna slumpmässigt

    Scenario: Ranking samlar de bäst rankade
      Givet en stor klass med rankingdata
      När klassen delas med metoden "Ranking"
      Så samlas de bäst rankade i en klass

    Scenario: Placering samlar de bäst placerade från tidigare etapp
      Givet en stor klass i en tävling med tidigare etapp
      När klassen delas med metoden "Placering"
      Så samlas de bäst placerade från tidigare etapp i en klass

    Scenario: Tid samlar de snabbaste från tidigare etapp
      Givet en stor klass i en tävling med tidigare etapp
      När klassen delas med metoden "Tid"
      Så samlas de med kortast löptid från tidigare etapp i en klass

    Scenario: Jämna klasser efter ranking
      Givet en stor klass med rankingdata
      När klassen delas med metoden "Jämna klasser, ranking"
      Så blir klasserna jämngoda

    Scenario: Jämna klasser efter placering
      Givet en stor klass i en tävling med tidigare etapp
      När klassen delas med metoden "Jämna klasser, placering"
      Så blir klasserna jämngoda

    Scenario: Jämna klasser efter tid
      Givet en stor klass i en tävling med tidigare etapp
      När klassen delas med metoden "Jämna klasser, tid"
      Så blir klasserna jämngoda

  Regel: Metoden kräver att underlaget finns

    Scenario: Saknad rankingdata ger felmeddelande
      Givet en klass utan rankingdata
      När klassen ska delas med metoden "Ranking"
      Så visas ett felmeddelande

    Scenario: Saknat resultat från tidigare etapp ger felmeddelande
      Givet en tävling utan tidigare etapp
      När en klass ska delas med metoden "Placering"
      Så visas ett felmeddelande

  Regel: Antalet per klass är ett riktvärde

    Scenario: Antal per klass kan anges
      Givet en delning i tre klasser
      När antalet deltagare per klass anges
      Så fördelas deltagarna ungefär enligt de talen

    Scenario: Deltagare som inte kan särskiljas hålls ihop
      Givet en klubbvis delning där en klubb är större än det angivna antalet
      När delningen genomförs
      Så hålls klubbens deltagare ihop i samma klass även om klassen därmed blir för stor

  Regel: Fördelningen kan justeras i efterhand

    Scenario: Deltagare flyttas mellan de nya klasserna
      Givet en genomförd delning
      När en deltagare flyttas till en annan av de nya klasserna
      Så justeras fördelningen
