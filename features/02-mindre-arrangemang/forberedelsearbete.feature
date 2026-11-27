# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5402
Egenskap: Förberedelsearbete
  Som arrangör med föranmälda deltagare
  vill jag kunna kontrollera tävlingen innan den startar
  så att problem upptäcks i sekretariatet och inte i skogen.

  Regel: Kontroll inför tävlingen rapporterar problem och förväntade banor

    Scenario: Kontrollrapporten listar deltagare utan starttid
      Givet en tävling där en deltagare saknar starttid
      När "Kör kontroll inför tävlingen" körs på sidan "Listor"
      Så rapporteras deltagaren som saknande starttid

    Scenario: Kontrollrapporten listar deltagare utan bricka
      Givet en tävling där en deltagare saknar bricknummer
      När kontrollen inför tävlingen körs
      Så rapporteras deltagaren som saknande bricka

    Scenario: Bricka som inte rymmer banans stämplingar rapporteras
      Givet en deltagare med en bricka som rymmer färre stämplingar än banan har kontroller
      När kontrollen inför tävlingen körs
      Så rapporteras deltagarens bricka som för liten för banan

    Scenario: Lottningsproblem rapporteras
      Givet två deltagare med samma bana och samma starttid
      När kontrollen inför tävlingen körs
      Så rapporteras krocken som ett lottningsproblem

    Scenario: Rapporten visar varje deltagares förväntade bana
      Givet en tävling med klasser och banor upplagda
      När kontrollen inför tävlingen körs
      Så visas för varje deltagare vilken bana deltagaren förväntas springa
