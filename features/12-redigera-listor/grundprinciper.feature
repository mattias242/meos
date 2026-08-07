# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5490
# Kod: metalist.cpp (MetaList: head, subhead, list, subList)
Egenskap: Listornas grundprinciper
  Som listkonstruktör
  vill jag förstå listans fyra delar och hur de hänger ihop
  så att jag kan bygga listor som blir rätt.

  Regel: En lista består av fyra delar

    Scenario: Rubrik är listans huvudrubrik
      Givet en lista
      När rubriken definieras
      Så är det listans huvudrubrik, till exempel "Resultatlista"

    Scenario: Underrubrik upprepas när innehållet ändras
      Givet en lista med klassnamn som underrubrik
      När listan skapas
      Så upprepas underrubriken varje gång dess innehåll förändras

    Scenario: Underrubriken bör passa listtyp och sorteringsordning
      Givet en lista med en global sorteringsordning
      När underrubriken definieras
      Så bör dess innehåll stämma överens med listtypen och sorteringsordningen

    Scenario: Huvudlistan innehåller en rad per objekt
      Givet en lista med listtypen "Deltagare"
      När listan skapas
      Så motsvarar varje rad i huvudlistan en person

    Scenario: Huvudlistan för lag har en rad per lag
      Givet en lista med listtypen "Lag"
      När listan skapas
      Så handlar varje rad om ett visst lag

    Scenario: Underlistan visar sekundärt innehåll
      Givet en lista med en sekundär listtyp
      När listan skapas
      Så kan underlistan visa till exempel mellantider för deltagare
         eller lagmedlemmar för lag

  Regel: Varje del innehåller rader av listposter

    Scenario: Rader byggs av listposter
      Givet en del av listan
      När rader läggs till
      Så består varje rad av noll eller flera listposter

    Scenario: Listposten har en typ
      Givet en listpost
      När typen väljs
      Så kan den vara till exempel "Klassnamn", "Lags nummerlapp"
         eller "Deltagares tid"

    Scenario: Listposten ersätts med text när listan skapas
      Givet en listpost av en viss typ
      När listan skapas
      Så ersätts posten med motsvarande text
