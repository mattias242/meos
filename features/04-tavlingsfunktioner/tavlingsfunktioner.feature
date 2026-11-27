# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5508
Egenskap: Tävlingsfunktioner
  Som arrangör
  vill jag kunna utforma tävlingen efter dess särskilda behov
  så att MeOS passar allt från barnfamiljsstart till tävlingar över flera dygn.

  # Avsnittet är en samlingssida. Beteendet dokumenteras i respektive
  # feature-fil i samma katalog:
  #   boka-starttid, starta-klass-pa-signal, vakanser-klassbyte-och-aterbud,
  #   oparade-brickor, knyta-brickor-till-deltagare, kontroller,
  #   tabellage-och-statistik, avkortade-banor, tidtagning-med-tiondelar,
  #   langa-tavlingstider, tidsjustering-av-start-och-mal, kartor,
  #   lokalisera-kartan

  Regel: Tävlingsfunktionerna är valfria tillägg

    Scenario: Funktioner som inte används döljs
      Givet en tävling som inte använder en viss tävlingsfunktion
      När gränssnittet visas
      Så visas inte funktionens sidor och inställningar
