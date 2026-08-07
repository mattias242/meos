# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5505
# Kod: qualification_final.cpp (importXML: QualificationRules, Level, Class,
#      Qualification, attributet distribution)
Egenskap: Exempelscheman för kval och final
  Som arrangör
  vill jag kunna definiera kval/final-schemat i en XML-fil
  så att beprövade scheman kan återanvändas mellan tävlingar.

  Regel: Schemat beskrivs som QualificationRules med nivåer och klasser

    Scenario: XML-filen laddas in i MeOS
      Givet en fil "schema.xml" med ett QualificationRules-element
      När filen laddas in i schemaredigeraren
      Så används schemat

    Scenario: Schemat kan lika gärna skapas i redigeraren
      Givet schemaredigeraren
      När schemat definieras direkt
      Så behövs ingen XML-fil

  Regel: Exempel 1 — ett kvalheat, två semifinaler och en final

    Scenario: Udda placeringar går till Semi A
      Givet ett schema där Semi A tar placering 1, 3, 5 och 7 från kvalheatet
      När kvalet är avgjort
      Så placeras dessa löpare i Semi A

    Scenario: Jämna placeringar går till Semi B
      Givet ett schema där Semi B tar placering 2, 4, 6 och 8 från kvalheatet
      När kvalet är avgjort
      Så placeras dessa löpare i Semi B

    Scenario: Ettor och tvåor från semifinalerna går till finalen
      Givet ett schema där finalen tar placering 1 och 2 från båda semifinalerna
      När semifinalerna är avgjorda
      Så placeras fyra löpare i finalen

    Scenario: Delad andraplats i en semifinal ger fler finalister
      Givet ett schema där finalen tar placering 1 och 2 från varje semifinal
      När andraplatsen är delad i en semifinal
      Så går tre eller fler löpare vidare från den semifinalen

  Regel: Exempel 2 — två kvalheat med rankingbaserad fördelning

    Scenario: Ranking fördelar löparna mellan kvalheaten
      Givet ett schema med attributet distribution="Ranking" på kvalnivån
      Och att rankingdata finns när schemat laddas
      När schemat tillämpas
      Så fördelas löparna jämnt mellan de två kvalloppen

    Scenario: Utan rankingdata används klassdelning
      Givet ett schema med rankingbaserad fördelning
      Och att rankingdata saknas
      När löparna ska fördelas
      Så används funktionen "Dela klass" i stället

    Scenario: Rankingfördelning på semifinalnivån bortser från kvalplacering
      Givet ett schema med distribution="Ranking" på semifinalnivån
      När semifinalerna sätts upp
      Så baseras fördelningen mellan semifinalerna på ranking
      Och kvalet används endast för att välja ut vilka som går vidare
