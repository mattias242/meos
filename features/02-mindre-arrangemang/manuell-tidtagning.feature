# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5419
# Kod: TabSI.cpp (isManualInput), convertAbsoluteTimeHMS i meos_util.cpp
Egenskap: Manuell tidtagning
  Som sekretariat utan elektronisk målstämpling
  vill jag kunna peka ut en deltagare och skriva in måltiden
  så att resultat kan registreras för hand.

  Regel: Deltagaren pekas ut med nummerlapp, bricknummer eller namn

    Scenario: Manuell inmatning öppnas från sidan SportIdent
      Givet sidan "SportIdent"
      När rutan "Manuell inmatning" kryssas för
      Så visas ett formulär för nummerlapp, bricknummer eller namn

    Scenario: Namnsökning föreslår matchande deltagare
      Givet formuläret för manuell inmatning
      När början av ett namn skrivs in och inmatningen pausas
      Så visas matchande deltagare i tävlingen under fältet

  Regel: Måltiden kan skrivas in eller tas från datorns klocka

    Scenario: Måltid i formatet HH:MM:SS
      Givet en utpekad deltagare i manuell inmatning
      När måltiden "11:42:07" matas in och "OK" väljs
      Så får deltagaren måltiden 11:42:07

    Scenario: Måltid i formatet HHMMSS
      Givet en utpekad deltagare i manuell inmatning
      När måltiden "114207" matas in och "OK" väljs
      Så får deltagaren måltiden 11:42:07

    Scenario: Tomt måltidsfält använder datorns tid
      Givet en utpekad deltagare i manuell inmatning
      När måltidsfältet lämnas blankt och "OK" väljs
      Så får deltagaren datorns aktuella tid som måltid

  Regel: Godkänd eller utgått anges vid inmatningen

    Scenario: Deltagaren registreras som godkänd
      Givet en utpekad deltagare i manuell inmatning
      När "Godkänd" kryssas för och "OK" väljs
      Så är deltagarens status "Godkänd"

    Scenario: Deltagaren registreras som utgången
      Givet en utpekad deltagare i manuell inmatning
      När "Utgått" kryssas för och "OK" väljs
      Så är deltagarens status "Utgått"
