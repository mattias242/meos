# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5442
Egenskap: Större arrangemang
  Som arrangör av en fullstor tävling med tusentals deltagare
  vill jag använda MeOS i nätverk med flera sekretariat och full ekonomi
  så att arrangemanget klarar volym, redundans och administration.

  # Avsnittet är en samlingssida och förutsätter kunskaperna i avsnitt 2.
  # Beteendet dokumenteras i respektive feature-fil i samma katalog.

  Regel: Större arrangemang bygger vidare på de mindre

    Scenario: Grundfunktionerna gäller även i stor skala
      Givet en tävling med tusentals deltagare
      När tävlingen genomförs
      Så gäller samma grundfunktioner som för mindre arrangemang
      Och avsnittets funktioner tillkommer som komplement
