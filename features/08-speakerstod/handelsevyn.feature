# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5467
# Kod: speakermonitor.cpp (händelser och prioritering)
Egenskap: Händelsevyn
  Som speaker som bevakar många klasser
  vill jag få tävlingens händelser rapporterade kronologiskt i klartext
  så att jag ser vad som är värt att berätta.

  Regel: Händelser rapporteras löpande med de senaste överst

    Scenario: Senaste händelsen visas högst upp
      Givet en händelsevy med bevakade klasser
      När nya händelser inträffar
      Så visas de senaste överst

    Scenario: Flera klasser och kontroller i samma vy
      Givet en händelsevy
      När flera klasser och radiokontroller bevakas
      Så rapporteras alla i samma vy

  Regel: Händelsernas innehåll

    Scenario: Målgång visar bommade kontroller
      Givet en deltagare som gått i mål och fått brickan avläst
      När händelsen rapporteras
      Så visas samlad information om bommade kontroller

    Scenario: Passering visar tappad eller vunnen tid
      Givet en deltagare som passerar en radiokontroll
      När händelsen rapporteras
      Så visas tappad eller vunnen tid jämfört med täten sedan föregående passering
      Och aktuell tid efter

    Scenario: Växling visar in- och utgående löpare
      Givet en stafettväxling
      När händelsen rapporteras
      Så visas namn på inkommande och utgående löpare

    Scenario: Lagtävling visar sammanlagd tid och placering
      Givet en lagtävling
      När en händelse rapporteras
      Så visas lagets sammanlagda tid och placering

  Regel: Rapporteringen kan filtreras

    Scenario: Alla händelser rapporteras
      Givet en händelsevy med filtret "Alla händelser"
      När händelser inträffar
      Så rapporteras samtliga

    Scenario: Viktiga händelser avser de tio bästa
      Givet en händelsevy med filtret "Viktiga händelser"
      När händelser inträffar
      Så rapporteras händelser som rör de tio bästa i varje klass

    Scenario: Avgörande händelser avser topptrion
      Givet en händelsevy med filtret "Endast avgörande händelser"
      När händelser inträffar
      Så rapporteras händelser som påverkar topptrion i varje klass

    Scenario: Avgörande händelser passar vid många klasser
      Givet att många klasser ska bevakas samtidigt
      När filternivå väljs
      Så är "Endast avgörande händelser" lämpligt

    Scenario: Antalet historiska händelser kan begränsas
      Givet en händelsevy
      När antalet historiska händelser sätts
      Så visas så många samtidigt
