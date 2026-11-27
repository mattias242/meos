# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5510
# Kod: oCard (oparade brickor), TabRunner.cpp ("Hantera brickor")
Egenskap: Oparade brickor
  Som sekretariat
  vill jag kunna se och para ihop brickor som lästs in utan känd deltagare
  så att inga resultat blir hängande i luften.

  Regel: En oparad bricka är inläst men saknar deltagare

    Scenario: Inläst bricka utan deltagare blir oparad
      Givet att interaktiv inläsning inte används
      När en bricka utan känd deltagare läses in
      Så sparas brickan som oparad

  Regel: Brickan knyts automatiskt när bricknumret sätts på en deltagare

    Scenario: Ändrat bricknummer plockar upp den oparade brickan
      Givet en oparad bricka med nummer 500123
      När en deltagares bricknummer ändras till 500123
      Så knyts brickan automatiskt till deltagaren

  Regel: Brickorna hanteras i en tabell

    Scenario: Tabellen med alla inlästa brickor öppnas
      Givet sidan "Deltagare"
      När "Hantera brickor" väljs
      Så visas en tabell med alla inlästa brickor

    Scenario: Tabellen sorteras på bricknummer
      Givet tabellen med inlästa brickor
      När tabellrubriken "Bricka" klickas
      Så sorteras tabellen på bricknummer

    Scenario: Tabellen sorteras på deltagare
      Givet tabellen med inlästa brickor
      När tabellrubriken "Deltagare" klickas
      Så sorteras tabellen på deltagare

    Scenario: Urval söker och filtrerar
      Givet tabellen med inlästa brickor
      När funktionen "Urval" används
      Så visas endast de brickor som matchar

  Regel: Bricka och deltagare paras ihop manuellt

    Scenario: Vald deltagare paras ihop med brickan
      Givet en oparad bricka
      När bricknumret klickas, en deltagare markeras och "Para ihop" väljs
      Så knyts brickan till deltagaren

    Scenario: Bricka sätts tillbaka som oparad
      Givet en bricka som är knuten till en deltagare
      När "Sätt som oparad" väljs
      Så sparas brickan som oparad

  Regel: Oparade brickor kan tas bort

    Scenario: Testinläsning tas bort
      Givet en oparad bricka som lästs in som test
      När brickan tas bort
      Så finns den inte kvar i tävlingen
