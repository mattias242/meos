# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5453
# Kod: TabSI.cpp (anmälningsläget), oEvent (betalningsmetoder i tävlingsinställningar)
Egenskap: Kontant betalning
  Som direktanmälningsfunktionär
  vill jag kunna bokföra betalningar som sker på plats
  så att de inte hamnar på klubbfakturan.

  Regel: Kontant betalning markeras vid direktanmälan

    Scenario: Avgiften bokförs men faktureras inte
      Givet anmälningsläget på sidan "SportIdent"
      När "Kontant betalning" markeras för en anmälan
      Så bokförs avgiften
      Och den faktureras inte

    Scenario: Även hyrbricksavgiften bokförs
      Givet en direktanmälan med hyrbricka och kontant betalning
      När anmälan sparas
      Så bokförs även avgiften för hyrbrickan

  Regel: Flera betalningsmetoder kan definieras

    Scenario: Metoder definieras i tävlingsinställningarna
      Givet sidan "Tävling"
      När betalningsmetoderna "Kontanter" och "Swish" definieras under tävlingsinställningar
      Så kan de väljas vid direktanmälan

    Scenario: Bokföring per metod
      Givet definierade betalningsmetoder
      När betalningar registreras med olika metoder
      Så bokför MeOS hur mycket som betalats med respektive metod
