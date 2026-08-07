# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5401
Egenskap: Mindre arrangemang
  Som arrangör av ett litet arrangemang med en enda dator
  vill jag kunna välja mellan att förbereda tävlingen i förväg
  och att låta MeOS bygga upp tävlingen medan deltagarna går i mål
  så att arbetsinsatsen står i proportion till arrangemangets storlek.

  # Tumregel i dokumentationen: cirka 100 deltagare klaras med en dator, men
  # avgörande är hur tätt deltagarna går i mål och hur många anmälnings-
  # ändringar som måste hanteras under tävlingen.

  Regel: Förberett arbetssätt — deltagare, klasser och banor läggs in i förväg

    Scenario: Förberedd tävling ger startlista och kvar-i-skogen
      Givet en tävling med inlagda deltagare, klasser och banor
      Och att klasserna är lottade
      När arrangemanget genomförs
      Så finns en startlista med starttider
      Och kvar-i-skogen kan beräknas under tävlingen

  Regel: Uppbyggnad vid målgång — lämpligt för träningar

    Scenario: Okänd bricka knyts till deltagare via löpardatabasen
      Givet en tävling utan föranmälda deltagare
      Och en installerad löpardatabas som känner bricka 500123
      När bricka 500123 läses av
      Så anmäls löparen från löpardatabasen

    Scenario: Klass bestäms utifrån besökta kontroller
      Givet en tävling utan föranmälda deltagare
      Och två klasser med olika banor
      När en bricka läses av med stämplingar som matchar den ena banan
      Så placeras deltagaren i den klass som har den banan

  Regel: Tävlingen säkerhetskopieras automatiskt

    Scenario: Regelbunden säkerhetskopia tas utan att arrangören begär det
      Givet en pågående tävling
      När arbetet fortgår
      Så tas säkerhetskopior regelbundet av tävlingen
