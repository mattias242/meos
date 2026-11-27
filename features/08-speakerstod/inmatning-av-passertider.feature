# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5464
# Kod: TabSpeaker.cpp (tidsinmatning), oFreePunch
Egenskap: Inmatning av passertider
  Som funktionär vid en radiokontroll utan uppkoppling
  vill jag mata in passertider för hand
  så att speakern ändå får underlag.

  Regel: Kontrollen anges med stämplingskod

    Scenario: Kontroll pekas ut
      Givet sidan för tidsinmatning
      När en stämplingskod matas in
      Så gäller passeringen den kontrollen

  Regel: Löparen anges med nummerlapp eller bricknummer

    Scenario: Nummerlapp pekar ut löparen
      Givet sidan för tidsinmatning
      När ett nummerlappsnummer matas in
      Så registreras passeringen för den löparen

    Scenario: Bricknummer fungerar också
      Givet sidan för tidsinmatning
      När ett bricknummer matas in
      Så registreras passeringen för den löparen

  Regel: Passertiden kan skrivas in eller tas från klockan

    Scenario: Passertid i formatet HH:MM:SS
      Givet en utpekad löpare och kontroll
      När passertiden "11:14:20" matas in
      Så registreras passeringen 11:14:20

    Scenario: Tomt fält ger datorns aktuella tid
      Givet en utpekad löpare och kontroll
      När passertidsfältet lämnas blankt
      Så blir passertiden datorns aktuella tid
