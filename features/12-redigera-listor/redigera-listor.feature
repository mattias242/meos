# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5489
# Kod: listeditor.cpp, metalist.cpp, oListInfo.cpp
Egenskap: Redigera listor
  Som arrangör med särskilda presentationsbehov
  vill jag kunna designa egna listor
  så att innehåll, typsnitt och layout blir precis som tävlingen kräver.

  Regel: Listredigeraren nås från sidan Listor

    Scenario: Redigeraren startas
      Givet sidan "Listor"
      När "Redigera lista" väljs
      Så startas listredigeraren

  Regel: Inbyggda listor kan användas som förlaga

    Scenario: Inbyggda listor öppnas för granskning
      Givet listredigeraren
      När "Öppna från aktuell tävling" väljs
      Så visas de inbyggda listor som är tillgängliga
      Och deras konstruktion kan studeras
