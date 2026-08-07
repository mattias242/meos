# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5429
# Kod: TabList.cpp (fullskärmsläge), animationdata.cpp
Egenskap: Listor på helskärm
  Som arrangör
  vill jag visa listor på hela skärmen
  så att publiken kan följa resultaten utan pappersutskrifter.

  Regel: Helskärm väljs under Utseende

    Scenario: Sidvis fullskärm
      Givet en visad lista
      När "Fullskärm (sidvis)" väljs under "Utseende"
      Så visas listan sida för sida på hela skärmen

    Scenario: Rullande fullskärm
      Givet en visad lista
      När "Fullskärm (rullande)" väljs under "Utseende"
      Så rullar listan på hela skärmen

  Regel: Sidvis visning kan finjusteras

    Scenario: Visningstid per sida anges i millisekunder
      Givet sidvis fullskärm
      När visningstiden sätts till 8000 millisekunder
      Så visas varje sida i 8 sekunder

    Scenario: Flera sidor bredvid varandra
      Givet sidvis fullskärm
      När antalet sidor bredvid varandra sätts till 2
      Så visas två sidor på samma bild

    Scenario: Marginal runt texten
      Givet sidvis fullskärm
      När marginalen ändras
      Så ändras det vita området runt texten

    Scenario: Animerat sidbyte
      Givet sidvis fullskärm
      När animerat sidbyte väljs
      Så animeras övergången mellan sidorna
