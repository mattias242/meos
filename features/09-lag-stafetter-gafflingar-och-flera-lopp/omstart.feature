# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5473
# Kod: oClass (rep- och omstartstid per sträcka), oTeam (antal omstarter),
#      oRunner (Ej omstart)
Egenskap: Omstart
  Som arrangör av en stafett
  vill jag kunna dra rep och släppa en omstart
  så att kvarvarande sträckor kan genomföras inom rimlig tid.

  Regel: Rep och omstart anges som klocktider per sträcka

    Scenario: Växlingstid efter repet ersätts av omstartstiden
      Givet en sträcka med reptid 13:00:00 och omstartstid 13:10:00
      När föregående sträcka växlar 13:04:00
      Så används 13:10:00 som starttid

    Scenario: Växlingstid före repet används som vanligt
      Givet en sträcka med reptid 13:00:00
      När föregående sträcka växlar 12:52:00
      Så används 12:52:00 som starttid

    Scenario: Olika omstartstider kan användas på olika sträckor
      Givet en stafett med flera sträckor
      När rep- och omstartstider sätts per sträcka
      Så kan de skilja sig åt mellan sträckorna

  Regel: Vid jaktstart syftar reptiden på starttiden i jakten

    Scenario: Jaktstartare efter reptiden flyttas till omstarten
      Givet en jaktstart med reptid
      När en deltagares jaktstartstid ligger efter reptiden
      Så startar deltagaren i stället i omstarten

    Scenario: Omstarten kan ligga före jaktstartens första start
      Givet en jaktstart
      När omstartstiden sätts före första start i jakten
      Så accepteras det

  Regel: Deltagande i omstarten kan förhindras

    Scenario: Lag hindras från omstart
      Givet ett lag på sidan "Lag"
      När "Förhindra omstart" markeras
      Så deltar laget inte i omstarten

    Scenario: Enskild löpare hindras från omstart
      Givet tabelläget för deltagare
      När kolumnen "Ej omstart" markeras för en löpare
      Så deltar löparen inte i omstarten

  Regel: Omstartade lag placeras efter icke omstartade

    Scenario: Fler omstarter ger sämre placering
      Givet två godkända lag där det ena har fler omstarter
      När resultatlistan visas
      Så placeras laget med fler omstarter efter det med färre Oberoende av lagens totaltid

  Regel: Rep och omstart kan sättas för flera klasser samtidigt

    Scenario: Funktionen omstart sätter tider för flera klasser
      Givet sidan "Klasser" under rubriken "Funktioner"
      När "Omstart" väljs och rep- och omstartstid anges
      Så sätts tiderna för de valda klasserna
