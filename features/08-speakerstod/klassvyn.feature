# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5468
# Kod: TabSpeaker.cpp (klassvy, bevaka, flytta till övriga)
Egenskap: Klassvyn
  Som speaker som följer en klass
  vill jag se ställningen vid en vald kontroll med inkommande löpare
  så att jag kan förbereda vad som ska sägas.

  Regel: Kontroll och sträcka väljs för klassen

    Scenario: Bevakade kontroller visas som en knapprad
      Givet en vald klass i speakerstödet
      När klassen öppnas
      Så visas en knapprad med de bevakade kontroller som förekommer i klassen

    Scenario: Sträcka väljs i en klass med flera sträckor
      Givet en stafettklass
      När klassen öppnas
      Så går det att välja vilken sträcka som ska bevakas

    Scenario: Alla visar en gemensam lista
      Givet en vald klass
      När "Alla" väljs i stället för en enskild kontroll
      Så visas alla resultat i en gemensam lista

  Regel: Deltagarna fördelas på tre rubriker

    Scenario: Resultat innehåller de som passerat kontrollen
      Givet en vald kontroll i en klass
      När vyn visas
      Så innehåller listan "Resultat" de löpare som passerat kontrollen

    Scenario: Inkommande sorteras efter löptid
      Givet en vald kontroll i en klass
      När vyn visas
      Så finns de väntade löparna under "Inkommande" sorterade efter löptid

  Regel: Enskilda löpare kan lyftas fram eller döljas

    Scenario: Bevakad inkommande löpare visas med rullande tid
      Givet en löpare under "Inkommande"
      När "Bevaka" väljs för löparen
      Så sorteras löparen in i listan "Resultat" utan placering
      Och med rullande tid

    Scenario: Rullande tid ersätts av placering vid passering
      Givet en bevakad löpare med rullande tid
      När löparen passerar kontrollen
      Så slutar tiden rulla
      Och aktuell placering visas

    Scenario: Ointressanta löpare flyttas till övriga
      Givet en lång resultatlista
      När en löpare flyttas ner
      Så sorteras löparen in under "Övriga" längst ner

    Scenario: Flyttad löpare kan återställas
      Givet en löpare under "Övriga"
      När "Återställ" väljs för löparen
      Så flyttas löparen tillbaka
