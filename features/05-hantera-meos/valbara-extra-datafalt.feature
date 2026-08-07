# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5439
# Kod: oDataContainer.cpp, datadefiners.h
Egenskap: Valbara extra datafält
  Som arrangör med särskilda datebehov
  vill jag lägga till extra fält på deltagare, lag och klasser
  så att tävlingen kan hantera uppgifter utöver MeOS fasta fält.

  Regel: Extra datafält kan läggas till på fyra ställen

    Scenario: Fält stöds på deltagare, lag, klasser och direktanmälan
      Givet en tävling
      När extra datafält aktiveras
      Så kan de visas på sidorna "Deltagare", "Lag" och "Klasser" samt i dialogen för direktanmälan

  Regel: Inbyggda extra datafält aktiveras med kryssruta

    Scenario: Telefonnummer aktiveras
      Givet tävlingsinställningarna på sidan "Tävling"
      När kryssrutan för telefonnummer markeras
      Så visas fältet telefonnummer i formulären

    Scenario: Födelsedatum och nationalitet kan aktiveras
      Givet tävlingsinställningarna
      När kryssrutorna för födelsedatum och nationalitet markeras
      Så visas fälten i formulären

  Regel: Fria datafält definieras av arrangören

    Scenario: Fritt datafält får en egen beskrivning
      Givet tävlingsinställningarna
      När ett fritt datafält aktiveras och beskrivningen "Distrikt" matas in
      Så heter fältet "Distrikt" i formulären

    Scenario: Fritt textfält kan visas i listor
      Givet ett fritt textfält med värden ifyllda
      När en lista redigeras
      Så kan textfältet visas i listan

    Scenario: Fritt datafält kan användas i resultatberäkningar
      Givet ett fritt datafält med numeriska värden
      När en resultatmodul skrivs
      Så kan fältet användas i beräkningen

  Regel: Kommentarer och anteckningar kan läggas på deltagare och lag

    Scenario: Kommentar sparas på en deltagare
      Givet en deltagare i formulärläget
      När "Kommentarer" väljs, en text skrivs in och sparas
      Så finns kommentaren på deltagaren

    Scenario: Kommentar sparas på ett lag
      Givet ett lag i formulärläget
      När en kommentar skrivs in och sparas
      Så finns kommentaren på laget
