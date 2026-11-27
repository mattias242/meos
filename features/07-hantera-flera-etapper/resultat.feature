# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5485
# Kod: oListInfo.cpp (totalresultat, slutresultat)
Egenskap: Resultat över flera etapper
  Som arrangör av en etapptävling
  vill jag presentera både etappställning och totalställning
  så att deltagarna ser sitt resultat i rätt sammanhang.

  Regel: Export fungerar som för en endagarstävling

    Scenario: Resultat och sträcktider exporteras som vanligt
      Givet en genomförd etapp
      När resultat och sträcktider exporteras
      Så sker det på samma sätt som för en endagarstävling

  Regel: Två listor är anpassade för flerdagarstävlingar

    Scenario: Totalresultat visar både total och etapp
      Givet en etapp med överförda resultat
      När listan "Totalresultat" visas
      Så presenteras totalställningen och etappresultatet i samma lista

    Scenario: Slutresultat visar enbart totalställningen
      Givet en etapp med överförda resultat
      När listan "Slutresultat" visas
      Så presenteras enbart totalställningen
