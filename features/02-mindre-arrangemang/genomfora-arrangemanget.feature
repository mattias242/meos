# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5410
Egenskap: Genomföra arrangemanget
  Som sekretariat under tävlingsdagen
  vill jag att MeOS visar de funktioner som tävlingen faktiskt kan använda
  så att jag inte söker efter något som inte går att göra.

  Regel: Funktioner som förutsätter förberedelse döljs i en oförberedd tävling

    Scenario: Startlistor är inte tillgängliga utan förberedd tävling
      Givet en tävling som byggs upp först vid målgång
      När sidan för listor visas
      Så är startlistor inte tillgängliga

    Scenario: Kvar-i-skogen är inte tillgängligt utan förberedd tävling
      Givet en tävling som byggs upp först vid målgång
      När kvar-i-skogen efterfrågas
      Så är funktionen inte tillgänglig
