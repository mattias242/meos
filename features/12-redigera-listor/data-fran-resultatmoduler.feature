# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5493
# Kod: generalresult.cpp (OutputTimes, OutputNumbers), metalist.cpp
Egenskap: Data från resultatmoduler
  Som listkonstruktör
  vill jag skriva ut värden som resultatmodulen räknat fram
  så att listan kan visa egna tider, tal och texter.

  Regel: Endast vissa posttyper kan ta data från modulen

    Scenario: Modulen beräknar tid, status och poäng
      Givet en resultatmodul
      När den körs
      Så beräknar den en tid, en status och en poäng

    Scenario: Endast relaterade typer kan använda modulens data
      Givet en listpost
      När "Data från resultatmodul" ska markeras
      Så är det möjligt endast för typer relaterade till tid, status och poäng
      Samt härledda kvantiteter som placering och tid efter

  Regel: OutputTimes och OutputNumbers ger fria värden

    Scenario: Modulen tilldelar OutputTimes
      Givet en resultatmodul
      När ett värde tilldelas OutputTimes[index]
      Så kan det plockas upp med posttypen "Resultatmodul: tid"

    Scenario: Modulen tilldelar OutputNumbers
      Givet en resultatmodul
      När ett värde tilldelas OutputNumbers[index]
      Så kan det plockas upp med posttypen "Resultatmodul: tal"

    Scenario: Tid formateras från sekunder
      Givet posttypen "Resultatmodul: tid" med ett index
      När listan skapas
      Så formateras talet i OutputTimes[index], angivet i sekunder, som en tid

  Regel: Tal kan tolkas som poäng eller heltal

    Scenario: Rogaining med fixa decimaler tolkar talet som poäng
      Givet aktiverad rogaining med ett angivet fixt antal decimaler
      När posttypen "Resultatmodul: tal" används
      Så tolkas talet som en poäng med det antalet decimaler

    Scenario: Ledande & tvingar heltalstolkning
      Givet posttypen "Resultatmodul: tal"
      När "Egen text" börjar med "&"
      Så tolkas talet som ett heltal oavsett decimalinställningen

    Scenario: &X visar endast talet
      Givet posttypen "Resultatmodul: tal"
      När "Egen text" sätts till "&X"
      Så visas endast talet

  Regel: Talet kan välja en textsträng ur en lista

    Scenario: Semikolonseparerad lista efter @
      Givet posttypen "Resultatmodul: tal"
      När "Egen text" sätts till "@Guld;Silver;Brons"
      Så används OutputNumbers[index] som nollbaserat index i listan

    Scenario: Guld, silver och brons ur placeringen
      Givet en resultatmodul som sätter OutputNumbers[0] till Place - 1
      Och en listpost med index 0 och egen text "@Guld;Silver;Brons"
      När listan skapas
      Så får segrarna "Guld", tvåorna "Silver" och treorna "Brons"
      Och övriga får ingenting

    Scenario: X i en sträng ersätts av talet
      Givet en textlista där en sträng innehåller "X"
      När strängen väljs
      Så ersätts X av själva talet

    Scenario: Sista strängen med X gäller alla odefinierade tal
      Givet egen text "@Guld;Silver;Brons;X"
      När en deltagare har placering utanför pallen
      Så skrivs talet ut för den deltagaren

    Scenario: Tom första sträng döljer nollan
      Givet egen text ";X"
      När talet är 0
      Så blir utskriften tom
      Och annars skrivs talet ut

    Scenario: Sista strängen med @ gäller alla odefinierade värden
      Givet egen text "@Segrare;@Klant"
      När en deltagare inte vann
      Så används strängen "Klant" för alla odefinierade värden
