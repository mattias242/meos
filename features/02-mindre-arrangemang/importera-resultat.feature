# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5423
# Kod: iof30interface.cpp (import av resultat)
Egenskap: Importera resultat
  Som arrangör
  vill jag kunna importera en genomförd tävling med resultat
  så att resultat från andra system kan användas i MeOS.

  Regel: Genomförd tävling importeras i IOF-XML 3.0

    Scenario: Tävling med resultat importeras
      Givet en fil med en genomförd tävling i formatet IOF-XML 3.0
      När filen importeras
      Så finns tävlingens deltagare och resultat i MeOS

  Regel: Importerade resultat kan bearbetas vidare

    Scenario: Resultat redigeras och kompletteras efter import
      Givet en importerad tävling med resultat
      När resultaten redigeras
      Så sparas ändringarna

    Scenario: Resultatlista tas fram ur importerade resultat
      Givet en importerad tävling med resultat
      När en resultatlista visas
      Så bygger den på de importerade resultaten

    Scenario: Importerade resultat används som underlag för jaktstart
      Givet en importerad tävling med resultat
      När en jaktstartslista skapas
      Så baseras starttiderna på de importerade resultaten

  Regel: Användningsområden

    Scenario: Resultat skapade från GPS-spår
      Givet en exportfil från LiveLox med resultat skapade ur GPS-spår
      När filen importeras
      Så finns de ungefärliga resultaten i MeOS

    Scenario: Etapp som inte genomförts med MeOS
      Givet en flerdagarstävling där etapp 1 körts i ett annat system
      När etapp 1 importeras som resultat
      Så kan totalresultat räknas fram över etapperna
