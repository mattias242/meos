# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5409
# Kod: TabCourse.cpp (lotta starttider per bana), oEventDraw.cpp
Egenskap: Lotta samma bana gemensamt
  Som arrangör där flera klasser delar bana
  vill jag lotta alla som springer en viss bana tillsammans
  så att startintervallet på banan blir jämnt.

  Regel: Lottning kan utgå från banan i stället för klassen

    Scenario: Bana lottas med jämnt startintervall
      Givet tre klasser som delar banan "Kort"
      När banan "Kort" lottas med första starttid, metod och intervall angivna
      Så är startintervallet jämnt för alla som springer banan

    Scenario: Intervallet inom en enskild klass blir oregelbundet
      Givet tre klasser som delar banan "Kort"
      När banan lottas gemensamt
      Så är startmellanrummen inom varje enskild klass oregelbundna

    Scenario: Antal vakanser räknas per klass
      Givet tre klasser som delar banan "Kort"
      När banan lottas med 2 vakanser
      Så läggs 2 vakanser till i var och en av de tre klasserna

  Regel: Samma resultat nås från den manuella flerklasslottningen

    Scenario: Klasser med samma bana lottas gemensamt vid manuell lottning
      Givet flera klasser som lottas samtidigt
      När "Lotta klasser med samma bana gemensamt" markeras under manuell lottning
      Så lottas klasser som delar bana tillsammans
