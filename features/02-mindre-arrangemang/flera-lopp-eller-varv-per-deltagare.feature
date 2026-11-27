# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5420
# Kod: TabSI.cpp (flera starter per deltagare)
Egenskap: Flera lopp eller varv per deltagare
  Som arrangör av träning eller motionslopp
  vill jag låta en deltagare springa valfritt antal lopp med samma bricka
  så att varje varv registreras utan ny anmälan.

  # Sammanlagda resultat över flera lopp hanteras i avsnitt 09.

  Regel: Funktionen slås på på sidan SportIdent

    Scenario: Flera starter per deltagare aktiveras
      Givet sidan "SportIdent"
      När funktionen "Flera starter per deltagare" väljs
      Så tillåts samma bricka läsas av flera gånger

  Regel: Återkommande bricka ger automatisk om-anmälan

    Scenario: Andra avläsningen skapar ett nytt lopp
      Givet en deltagare "Anna Ek" som redan läst av bricka 500123
      När bricka 500123 läses av igen
      Så anmäls "Anna Ek" på nytt med ett nummer efter namnet

    Scenario: Klassen väljs utifrån banan i brickan
      Givet en deltagare som läser av sin bricka för andra gången
      När brickans stämplingar matchar en annan bana än förra loppet
      Så väljs den klass som har den banan

    Scenario: Klassen för första loppet bestäms vid anmälan
      Givet en deltagare som anmäls inför sitt första lopp
      När anmälan görs
      Så bestäms klassen vid anmälan

  Regel: En ny vanlig anmälan tar över brickan

    Scenario: Brickan övertas av den nyanmälde
      Givet en bricka som använts av "Anna Ek"
      När en vanlig anmälan görs med samma bricka för "Bo Lind"
      Så tillhör brickan från och med nu "Bo Lind"
      Och "Bo Lind" kan springa valfritt antal varv med den

  Regel: Loppen redovisas var för sig

    Scenario: Resultatlistan visar loppen som oberoende individuella lopp
      Givet en deltagare med tre genomförda lopp
      När resultatlistan visas
      Så redovisas de tre loppen var för sig
