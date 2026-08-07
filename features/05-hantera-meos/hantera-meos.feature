# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5424
Egenskap: Hantera MeOS
  Som arrangör med behov utöver de enklaste arrangemangen
  vill jag kunna anpassa MeOS, dess data och dess publicering
  så att programmet passar tävlingens och sekretariatets arbetssätt.

  # Avsnittet är en samlingssida. Beteendet dokumenteras i respektive
  # feature-fil i samma katalog, samt i meos-funktioner/ för funktionsvalet.

  Regel: Avancerade funktioner är valfria

    Scenario: Enkla arrangemang behöver inte avsnittets funktioner
      Givet ett enkelt arrangemang
      När tävlingen genomförs
      Så behövs ingen av avsnittets avancerade funktioner
