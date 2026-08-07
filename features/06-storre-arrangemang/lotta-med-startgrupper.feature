# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5460
# Kod: oEventDraw.cpp (lottning med startgrupper)
Egenskap: Lotta med startgrupper
  Som lottningsansvarig
  vill jag lotta så att deltagarnas önskade startgrupper respekteras
  så att önskemålen uppfylls utan att banor och klasser krockar.

  Regel: Lottning per klass sker med eller utan startgrupper

    Scenario: Lotta med startgrupper tar hänsyn till grupperna
      Givet definierade startgrupper
      När "Lotta med startgrupper" väljs för en klass
      Så fördelas deltagarna i sina startgrupper
      Och fältet "Första start" används inte

    Scenario: Lotta klassen struntar i startgrupperna
      Givet definierade startgrupper
      När "Lotta klassen" väljs
      Så bortses från startgrupperna

  Regel: Flerklasslottning anpassas efter grupperna

    Scenario: Automatisk lottning uppskattar parallellt startande
      Givet definierade startgrupper
      När automatisk lottning körs
      Så uppskattar MeOS hur många parallellt startande som krävs för att deltagarna ska få plats i sina startgrupper

    Scenario: Manuell lottning ger mer kontroll
      Givet definierade startgrupper
      När manuell lottning används
      Så kan antalet parallellt startande styras
      Och hur lika banorna får vara för deltagare som startar samtidigt

  Regel: Överfulla grupper hanteras på två sätt

    Scenario: Sist anmälda flyttas till en annan grupp
      Givet en startgrupp där platserna tagit slut
      När löpare ska flyttas
      Så flyttas de sist anmälda i första hand

    Scenario: Gruppens intervall växer och knuffar efterföljande grupper
      Givet en överfull startgrupp
      När alternativet att låta gruppen växa väljs
      Så växer gruppens tidsintervall
      Och efterföljande grupper knuffas framåt

  Regel: Platser kan ta slut även i en grupp som inte är full

    Scenario: Klassens platser tar slut trots ledig grupp
      Givet en startgrupp med lediga platser
      När en viss klass redan fyllt sina möjliga starttider i gruppen
      Så kan ingen fler i den klassen placeras där

  Regel: Banläggningen påverkar hur bra fördelningen blir

    Scenario: Stora klasser bör inte dela bana
      Givet en tävling med startgrupper
      När banorna läggs
      Så bör endast klasser med färre än 2–3 procent av deltagarna dela bana

    Scenario: Många olika första kontroller behövs
      Givet en tävling med startgrupper
      När banorna läggs
      Så är det viktigt med ett stort antal olika första kontroller även när det inte är orienteringstekniskt motiverat för den enskilda banan
