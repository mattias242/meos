# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5466
# Kod: oFreePunch.cpp, Table.cpp
Egenskap: Redigera passertider
  Som speakerfunktionär
  vill jag kunna rätta felaktiga radiostämplingar
  så att liveinformationen blir korrekt.

  Regel: Radiostämplingar visas i en tabell

    Scenario: Tabellen med stämplingar öppnas
      Givet ett speakerfönster
      När "Stämplingar" väljs
      Så visas en tabell över alla registrerade stämplingar

    Scenario: Stämplingar kan ändras eller tas bort
      Givet tabellen med stämplingar
      När en stämpling ändras eller tas bort
      Så uppdateras registreringen

  Regel: Endast radiostämplingar finns i tabellen

    Scenario: Brickavlästa stämplingar saknas i tabellen
      Givet en deltagare vars bricka lästs av
      När stämplingstabellen visas
      Så saknas brickans stämplingar i tabellen

    Scenario: Brickdata har tolkningsföreträde
      Givet både radiostämplingar och en avläst bricka för en deltagare
      När resultatet bestäms
      Så har brickdata företräde

    Scenario: Inlästa brickor ändras på deltagaren
      Givet en avläst bricka som behöver rättas
      När ändringen ska göras
      Så görs den på deltagaren på sidan "Deltagare"
