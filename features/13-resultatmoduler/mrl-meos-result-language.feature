# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5498
# Kod: parser.cpp (Parser::test finns som enda befintliga enhetstest),
#      generalresult.cpp (symboldeklarationer)
Egenskap: MRL – MeOS Result Language
  Som skribent av en resultatmodul
  vill jag veta språkets syntax och semantik
  så att mina regler räknar rätt.

  Regel: En rutin är en följd av satser som returnerar ett heltal

    Scenario: Satser separeras med semikolon
      Givet en MRL-rutin
      När koden skrivs
      Så separeras satserna med semikolon
      Och semikolonet kan uteslutas för den sista satsen

    Scenario: Kommentarer inleds med dubbla snedstreck
      Givet en rad med "//"
      När koden tolkas
      Så ignoreras resten av raden

    Scenario: Sist beräknade uttrycket blir returvärdet
      Givet en MRL-rutin utan return-sats
      När rutinen körs
      Så blir det sist beräknade uttrycket returvärdet

    Scenario: return returnerar ett specifikt värde
      Givet en MRL-rutin med en return-sats
      När satsen nås
      Så returneras det angivna värdet

    Scenario: Returvärdet tolkas som tid, poäng eller status
      Givet en MRL-rutin
      När den körs
      Så tolkas det returnerade heltalet som en tid i sekunder, en poäng eller en löparstatus

  Regel: Symboler ger tillgång till aktuell data

    Scenario: Skalära symboler
      Givet symbolen "Time"
      När rutinen körs
      Så innehåller den deltagarens eller lagets tid

    Scenario: Vektorsymboler indexeras från noll
      Givet symbolen "Course"
      När "Course[2]" används
      Så avses den tredje kontrollen

    Scenario: Matrissymboler indexeras med två hakparenteser
      Givet symbolen "RunnerCourse"
      När "RunnerCourse[2][0]" används
      Så avses den första kontrollen för den tredje deltagaren i laget

    Scenario: Storleken hämtas med size
      Givet en vektorsymbol
      När "Course.size()" används
      Så returneras antalet element

    Scenario: Storleken på en rad i en matris
      Givet en matrissymbol
      När "RunnerCourse[2].size()" används
      Så returneras antalet kontroller för den tredje deltagaren

    Scenario: Diskning vid för lång sträcktid
      Givet en statusregel som går igenom SplitTimes
      När någon sträcktid överstiger 180 sekunder
      Så returneras StatusDQ

  Regel: Variabler är heltal eller vektorer av heltal

    Scenario: Variabel definieras genom tilldelning
      Givet en MRL-rutin
      När ett värde tilldelas ett nytt namn
      Så skapas en variabel

    Scenario: Vektorvariabel växer automatiskt
      Givet en odefinierad variabel "var"
      När "var[3] = 4" skrivs
      Så blir var vektorn [0,0,0,4]

    Scenario: Vektor kan tilldelas i ett svep
      Givet symbolen RunnerCourse
      När "var = RunnerCourse[0]" skrivs
      Så får var hela banan för den första lagmedlemmen

    Scenario: Vektor kan sorteras
      Givet en vektorvariabel "times"
      När "times.sort()" anropas
      Så sorteras vektorn

    Scenario: Snabbaste lagmedlemmens tid
      Givet rutinen som tilldelar times = RunnerTimes, sorterar och returnerar times[0]
      När rutinen körs
      Så returneras tiden för den snabbaste lagmedlemmen

  Regel: Aritmetiska operatorer

    Scenario: Binära aritmetiska operatorer
      Givet ett MRL-uttryck
      När operatorerna används
      Så finns +, -, *, /, %, max och min

    Scenario: Division är heltalsdivision
      Givet uttrycket "a / b"
      När det evalueras
      Så utförs heltalsdivision
      Och "a % b" ger resten

  Regel: Logiska operatorer evalueras till 1 eller 0

    Scenario: Sant ger 1 och falskt ger 0
      Givet ett logiskt uttryck
      När det evalueras
      Så blir värdet 1 om det är sant och 0 om det är falskt

    Scenario: Allt som inte är noll är sant
      Givet ett uttryck med värdet 5
      När det används som villkor
      Så är det sant

    Scenario: Binära logiska operatorer
      Givet ett MRL-uttryck
      När operatorerna används
      Så finns ==, !=, <, >, <=, >=, && och ||

    Scenario: Unära operatorer
      Givet ett MRL-uttryck
      När operatorerna används
      Så finns !, unärt minus samt ++ och --

  Regel: Pre- och postfix skiljer sig i evaluering

    Scenario: Prefix ger värdet efter förändringen
      Givet "a = 0" och därefter "b = ++a"
      När uttrycken evalueras
      Så är b lika med 1

    Scenario: Postfix ger värdet före förändringen
      Givet "a = 1" och därefter "c = a++"
      När uttrycken evalueras
      Så är c lika med 1
      Och a lika med 2

    Scenario: Blandade sidoeffekter bör undvikas
      Givet uttrycket "b = ++a + a++"
      När koden skrivs
      Så bör konstruktionen undvikas

  Regel: Flödeskontroll

    Scenario: if utan else
      Givet en if-sats utan else-del
      När villkoret är falskt
      Så körs ingen kod

    Scenario: if med else if och else
      Givet en kedja av if, else if och else
      När inget villkor är sant
      Så körs else-delen

    Scenario: for-loop med start, villkor och uppdatering
      Givet en for-loop
      När den körs
      Så utförs startuttrycket först
      Och loopen körs så länge villkoret är sant
      Och uppdateringsuttrycket körs efter varje varv

    Scenario: Godkänt lag kräver att alla är godkända
      Givet en for-loop över RunnerStatus
      När någon lagmedlem inte har StatusOK
      Så returneras den medlemmens status

    Scenario: while-loop saknar start och uppdatering
      Givet en while-loop
      När den körs
      Så körs den så länge villkoret är sant

    Scenario: break avbryter loopen
      Givet en loop med en break-sats
      När satsen nås
      Så avbryts loopen oavsett villkoret
