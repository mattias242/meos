# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5479
# Kod: TabTeam.cpp (direktanmälan till sträcka)
Egenskap: Direktanmälan till en lagsträcka
  Som sekretariat vid växlingen
  vill jag kunna anmäla en ny löpare direkt till en sträcka
  så att en sen ersättare kan sättas in utan omvägar.

  Regel: Direktanmälan görs från lagets sträcka

    Scenario: Ny löpare anmäls till en sträcka
      Givet ett valt eller nyskapat lag på sidan "Lag"
      När en sträcka väljs, "<>" (Knyt löpare till sträckan) klickas och "Direktanmälan" väljs
      Så kan en ny löpare anmälas direkt till sträckan

    Scenario: SI-enhet fyller i bricknumret
      Givet direktanmälan till en sträcka med ansluten SI-enhet
      När en bricka placeras i enheten
      Så fylls bricknumret i

    Scenario: Namnet slås upp från tävlingsdatabasen
      Givet direktanmälan till en sträcka
      När ett bricknummer som finns i tävlingsdatabasen anges
      Så slås namnet upp
