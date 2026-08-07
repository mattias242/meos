# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5413
# Kod: oCard, oPunch (flagga för tillagd/ändrad stämpling), TabRunner.cpp
Egenskap: Redigera stämplingar
  Som sekretariat
  vill jag kunna ändra, ta bort och lägga till stämplingar i en inläst bricka
  så att verkliga avvikelser kan rättas — och så att ändringarna syns.

  Regel: En stämpling kan ändras eller tas bort

    Scenario: Tiden på en stämpling ändras
      Givet en deltagare med en inläst bricka
      När en stämpling markeras i listan "Stämplingar", tiden ändras och "Spara" väljs
      Så har stämplingen den nya tiden

    Scenario: En stämpling tas bort
      Givet en deltagare med en inläst bricka
      När en stämpling markeras och "Ta bort stämpling" väljs
      Så finns stämplingen inte kvar

    Scenario: Mål- och startstämpling kan också ändras och tas bort
      Givet en deltagare med start- och målstämpling
      När målstämplingen markeras och tas bort
      Så saknar deltagaren målstämpling

  Regel: Saknade stämplingar kan läggas till

    Scenario: En saknad stämpling läggs till från banmallen
      Givet en deltagare vars bricka saknar kontroll 56
      När kontroll 56 markeras i banmallen och "Lägg till stämpling" väljs
      Så finns en stämpling på kontroll 56 i brickan

    Scenario: Tiden på en tillagd stämpling kan sättas
      Givet en nyss tillagd stämpling
      När tiden ändras och sparas
      Så har den tillagda stämplingen den angivna tiden

    Scenario: Alla saknade stämplingar läggs till på en gång
      Givet en deltagare vars bricka saknar flera av banans kontroller
      När "Lägg till alla" väljs
      Så finns samtliga banans kontroller i brickan
      Och deltagaren kan godkännas

  Regel: Ändrad brickdata går att spåra

    Scenario: Tillagda och ändrade stämplingar registreras
      Givet en deltagare vars bricka fått en stämpling tillagd
      När rapporterna på sidan "Listor" visas
      Så finns deltagaren i listan över ändrad brickdata

    Scenario: Listan visas bara när den inte är tom
      Givet en tävling där ingen brickdata ändrats
      När rapporterna på sidan "Listor" visas
      Så visas ingen lista över ändrad brickdata
