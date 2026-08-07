# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5451
# Kod: csvparser.cpp, oEventDraw.cpp (import/export av lottningsunderlag)
Egenskap: Exportera och importera lottningsunderlag
  Som lottningsansvarig
  vill jag kunna lämna över startfördelningen som en CSV-fil
  så att någon utan MeOS kan göra fördelningen i ett kalkylprogram.

  Regel: Filen har sju kolumner och en rad per klass

    Scenario: Exportens kolumner
      Givet en tävling med klasser
      När lottningsunderlaget exporteras
      Så innehåller filen en rubrikrad följd av en rad per klass
      Och kolumnerna klassens id, klassens namn, antal anmälda, banans namn, första kontrollens nummer, klassens första start, startintervall och antal vakanser

    Scenario: Exempelrad
      Givet en klass "H21E" med 35 anmälda på bana "A1"
      När lottningsunderlaget exporteras
      Så innehåller filen en rad i stil med "1; H21E; 35; A1;  79; 07:01:00; 2:00; 1"

  Regel: Vid import används bara vissa kolumner

    Scenario: Namn, antal anmälda och banans namn ignoreras
      Givet en importfil med samtliga sju kolumner
      När filen importeras
      Så ignoreras kolumn 2, 3 och 4

    Scenario: Starttid, intervall och vakanser importeras
      Givet en importfil
      När filen importeras
      Så importeras klassens första start, startintervall och antal vakanser

    Scenario: Klassens id matchas i första hand
      Givet en importfil med klassens id
      När filen importeras
      Så används id:t för att hitta rätt klass

    Scenario: Klassnamnet matchas när id inte hittas
      Givet en importfil vars klass-id inte finns i tävlingen
      När filen importeras
      Så matchas klassen på namn i stället

    Scenario: Minst sju kolumner krävs
      Givet en importfil med färre än sju kolumner
      När filen importeras
      Så accepteras den inte

    Scenario: Extra kolumner ignoreras
      Givet en importfil med fler än sju kolumner
      När filen importeras
      Så ignoreras de överskjutande kolumnerna

  Regel: Fältet reserverat exporteras inte

    Scenario: Reserverade platser saknas i filen
      Givet en tävling med reserverade platser för efteranmälda
      När lottningsunderlaget exporteras
      Så saknas fältet i filen eftersom det inte påverkar lottningen när övriga parametrar är fixerade

  Regel: MeOS förslag kan användas som utgångspunkt

    Scenario: Föreslagen fördelning exporteras
      Givet en fördelning framtagen med "Fördela starttider"
      När underlaget exporteras
      Så innehåller filen MeOS föreslagna fördelning

    Scenario: Import- och exportfunktionerna ligger under Lotta flera klasser
      Givet sidan "Klasser"
      När "Lotta flera klasser" väljs
      Så finns funktionerna "Importera" och "Exportera"
