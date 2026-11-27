# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5438
# Kod: oRunner (rankingdata), csvparser.cpp, iof30interface.cpp (Score-attribut)
Egenskap: Ranking
  Som arrangör
  vill jag kunna lagra rankingdata för deltagarna
  så att klasser kan delas, lottning seedas och kval-finalscheman fyllas.

  Regel: Ranking används på flera ställen

    Scenario: Ranking används för att dela klasser
      Givet deltagare med rankingdata
      När en klass delas
      Så kan rankingen ligga till grund för delningen

    Scenario: Ranking används vid seedad lottning
      Givet deltagare med rankingdata
      När en klass lottas med metoden "Seedad lottning"
      Så används rankingen

    Scenario: Ranking används vid klasstilldelning i kval-final-scheman
      Givet ett kval-final-schema
      När deltagarna fördelas på kvalheat
      Så kan rankingen användas

    Scenario: Ranking kan visas i startlistan
      Givet deltagare med rankingdata
      När en startlista tas fram
      Så kan rankingen tas med

  Regel: Ordningsbaserad ranking anges som positivt heltal

    Scenario: Lägre ordningstal betyder högre ranking
      Givet en löpare med ranking 1 och en med ranking 2
      När rankingen tolkas
      Så är löparen med ranking 1 högst rankad

    Scenario: Ordningsbaserad ranking läses in från CSV
      Givet en CSV-fil med kolumnerna Id, Förnamn, Efternamn, Nationalitet, Ordningsranking och Poäng
      När filen importeras
      Så får löparna sin ordningsbaserade ranking

    Scenario: Gammalt IOF-XML v2-format med RankList stöds
      Givet en rankingfil i IOF-XML version 2 med RankList
      När filen importeras
      Så får löparna sin ranking

  Regel: Poängbaserad ranking anges som decimaltal

    Scenario: Decimalpunkt skiljer poäng från ordningstal
      Givet en löpare med rankingpoängen 1323
      När rankingen matas in
      Så ska den skrivas som "1323.0" och inte som "1323"

    Scenario: Högre poäng är bättre
      Givet en löpare med 1323.0 poäng och en med 980.0 poäng
      När rankingen tolkas
      Så är löparen med 1323.0 poäng högst rankad

    Scenario: Poängbaserad ranking läses från Score-attributet
      Givet en fil i IOF-XML version 3 med Score-attribut
      När filen importeras
      Så får löparna sin poängbaserade ranking
