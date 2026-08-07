# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5481
# Kod: Table.cpp, TableType.h
Egenskap: Tabelläge
  Som sekretariat
  vill jag arbeta med tävlingsdata som i ett kalkylblad
  så att många likartade ändringar kan göras snabbt.

  Regel: Celler redigeras direkt

    Scenario: Dubbelklick ändrar värdet
      Givet en tabell med tävlingsdata
      När en cell dubbelklickas
      Så kan värdet ändras

    Scenario: Vissa celler kan inte ändras
      Givet en cell med härlett värde
      När den dubbelklickas
      Så går den inte att ändra

    Scenario: Vissa celler kräver val ur en lista
      Givet en cell med begränsade värden
      När den redigeras
      Så måste värdet väljas ur en selektionslista

  Regel: Tabellverktygen är snabbknappar för vanliga funktioner

    Scenario: Verktygsfönstrets knappar
      Givet en öppen tabell
      När tabellverktygen visas
      Så finns knappar för att välja kolumner, skriva ut, uppdatera alla värden, återställa tabelldesignen, markera allt, markera inget, kopiera, klistra in, radera markerade rader och lägga till en ny rad

    Scenario: Kontextmeny på kolumnrubriken
      Givet en tabell
      När en kolumnrubrik högerklickas
      Så visas kolumnens meny

  Regel: Sortering och filtrering

    Scenario: Klick på kolumnrubrik sorterar
      Givet en tabell
      När en kolumnrubrik klickas
      Så sorteras tabellen på den kolumnen

    Scenario: Nytt klick vänder sorteringen
      Givet en sorterad tabell
      När kolumnrubriken klickas igen
      Så byter sorteringen riktning

    Scenario: Urval filtrerar medan man skriver
      Givet en tabell över deltagare
      När "Urval..." väljs på kolumnen "Klass" och ett klassnamn skrivs
      Så visas endast deltagarna i den klassen
      Och resultatet syns medan texten skrivs

  Regel: Kolumnerna kan väljas och flyttas

    Scenario: Kolumner väljs från verktygslådan
      Givet en tabell
      När "Välj kolumner" används och kolumner markeras
      Så visas de valda kolumnerna

    Scenario: Kolumner flyttas genom drag och släpp
      Givet en tabell
      När en kolumnrubrik dras till en ny plats
      Så ändras kolumnernas ordning

  Regel: Markering, kopiering och radering

    Scenario: Celler markeras genom att dra en rektangel
      Givet en tabell
      När musen dras över celler
      Så markeras en rektangel

    Scenario: Markeringen kopieras till urklipp
      Givet markerade celler
      När Ctrl+C trycks
      Så kopieras markeringen till urklipp

    Scenario: Kopierade data kan klistras in i kalkylprogram
      Givet kopierade celler i urklipp
      När de klistras in i ett kalkylbladsprogram
      Så hamnar de i kalkylbladet

    Scenario: Radering tar bort hela rader
      Givet markerade celler
      När Del trycks
      Så raderas alla rader som markeringen omfattar

  Regel: Inklistring beter sig olika beroende på markering

    Scenario: Utan markering läggs nya rader till
      Givet en tabell utan markerade celler
      När data klistras in med Ctrl+V
      Så läggs nya rader till

    Scenario: Färre kolumner ger standardvärden
      Givet urklippsdata med färre kolumner än tabellen
      När den klistras in
      Så får de resterande kolumnerna standardvärden

    Scenario: Med markering skrivs cellerna över
      Givet markerade celler i tabellen
      När data klistras in
      Så skrivs markeringen över med värdena från urklipp

  Regel: Tangentbordsgenvägar

    Scenario: Ctrl+P skriver ut tabellen
      Givet en öppen tabell
      När Ctrl+P trycks
      Så skrivs tabellen ut

    Scenario: Ctrl+I lägger till en rad
      Givet en öppen tabell
      När Ctrl+I trycks
      Så läggs en rad till

    Scenario: F5 uppdaterar tabellen
      Givet en öppen tabell
      När F5 trycks
      Så uppdateras tabellen med yttre ändringar

  Regel: Tabeller uppdateras inte automatiskt

    Scenario: Yttre ändringar syns först efter uppdatering
      Givet en öppen tabell
      När tävlingsdata ändras av någon annan
      Så uppdateras tabellen inte automatiskt eftersom det skulle störa arbetet med den
