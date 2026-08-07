# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5406
# Kod: oEventDraw.cpp; oEvent::DrawMethod {Random, SOFT, MeOS, Clumped,
#      Simultaneous, Seeded, Pursuit, ReversePursuit}, DrawType {DrawAll,
#      RemainingBefore, RemainingAfter}, VacantPosition {Mixed, First, Last}
Egenskap: Lottning
  Som arrangör
  vill jag lotta starttider per klass eller för flera klasser samtidigt
  så att startfältet fördelas rättvist och utan krockar.

  # Seedad lottning beskrivs i avsnitt 06, jaktstart i avsnitt 07.

  Regel: Lottade klasser markeras i klasslistan

    Scenario: Klass med tilldelade starttider märks med [S]
      Givet en klass där alla deltagare har starttid
      När klasslistan visas
      Så visas symbolen "[S]" efter klassen

    Scenario: Gemensam starttid visas i stället för symbolen
      Givet en klass med gemensam starttid 11:00:00
      När klasslistan visas
      Så visas starttiden 11:00:00 efter klassen

  Regel: Startstämpling skriver över den lottade starttiden

    Scenario: Faktisk startstämpling ersätter lottad tid
      Givet en deltagare med lottad starttid 10:05:00
      När deltagaren startstämplar 10:07:30
      Så räknas tiden från 10:07:30

    Scenario: Klassinställningen ignorera startstämpling behåller lottad tid
      Givet en klass där "Ignorera startstämpling" är markerad
      Och en deltagare med lottad starttid 10:05:00
      När deltagaren startstämplar 10:07:30
      Så räknas tiden från 10:05:00

  Regel: Lottningsmetoden väljs per klass

    Scenario: Lottning (MeOS) sprider klubbkamrater
      Givet en klass med flera deltagare från samma klubb
      När klassen lottas med metoden "Lottning (MeOS)"
      Så separeras deltagare från samma klubb i startordningen
      Och varje deltagare har haft chans till varje starttid

    Scenario: Lottning ger en godtycklig permutation
      Givet en klass med anmälda deltagare
      När klassen lottas med metoden "Lottning"
      Så är startordningen helt slumpmässig

    Scenario: SOFT-lottning följer den äldre svenska regelmetoden
      Givet en klass med anmälda deltagare
      När klassen lottas med metoden "SOFT-lottning"
      Så tillämpas SOFT-metoden

    Scenario: Klungstart släpper fältet i klungor
      Givet en klass med anmälda deltagare och ett angivet startintervall
      När klassen lottas med metoden "Klungstart"
      Så startar deltagarna i klungor av varierande storlek
      Och samtliga startar inom det angivna intervallet

    Scenario: Gemensam start tilldelar samma tid till alla
      Givet en klass med anmälda deltagare
      När klassen får gemensam start 11:00:00
      Så har alla deltagare starttiden 11:00:00

    Scenario: Senare anmälda får den gemensamma starttiden
      Givet en klass med gemensam start 11:00:00
      När ytterligare en deltagare anmäls till klassen
      Så får deltagaren starttiden 11:00:00

    Scenario: Slumpen kommer från kosmisk bakgrundsstrålning
      Givet en klass som ska lottas
      När lottningen utförs
      Så baseras den på slumpdata genererad av kosmisk bakgrundsstrålning

  Regel: Startintervall styr avståndet mellan starttider

    Scenario: Startintervall används som startmellanrum vid vanlig lottning
      Givet en klass med startintervallet 2 minuter
      När klassen lottas
      Så är avståndet mellan två på varandra följande starttider 2 minuter

  Regel: Vakanser läggs till före lottningen

    Scenario: Angivet antal vakanser läggs till
      Givet en klass utan vakanser
      När klassen lottas med 3 vakanser
      Så läggs 3 vakanta startplatser till före lottningen

    Scenario: Överflödiga vakanser tas bort
      Givet en klass med 5 vakanser
      När klassen lottas med 2 vakanser
      Så finns 2 vakanser kvar i klassen

    Scenario: Vakansernas placering kan väljas
      Givet en klass som lottas med vakanser
      När placeringen "Först" väljs
      Så ligger vakanserna först i startordningen

  Regel: Delar av en klass kan lottas

    Scenario: Hela klassen lottas om
      Givet en klass med några redan lottade deltagare
      När "Lotta klassen" väljs
      Så lottas samtliga deltagare i klassen

    Scenario: Olottade placeras före de redan lottade
      Givet en klass med både lottade och olottade deltagare
      När "Ej lottade, före" väljs
      Så får de olottade starttider före de redan lottade
      Och de redan lottade behåller sina tider

    Scenario: Olottade placeras efter de redan lottade
      Givet en klass med både lottade och olottade deltagare
      När "Ej lottade, efter" väljs
      Så får de olottade starttider efter de redan lottade

    Scenario: Starttider kan nollställas
      Givet en lottad klass
      När "Radera starttider" väljs
      Så saknar alla deltagare i klassen starttid

  Regel: Sträcka och nummerlappar kan sättas vid lottningen

    Scenario: Sträckvalet visas bara när det finns sträckor
      Givet en tävling utan sträckor
      När lottningsdialogen visas
      Så visas ingen selektionslista för sträcka

    Scenario: Startordning lottas på en viss sträcka
      Givet en stafettklass med tre sträckor
      När sträcka 2 väljs och klassen lottas
      Så lottas startordningen för sträcka 2

    Scenario: Nummerlappar tilldelas i samband med lottningen
      Givet en klass som lottas med första nummerlapp 101
      När lottningen utförs
      Så får deltagarna nummerlappar från och med 101

  Regel: Parstart låter flera starta samtidigt

    Scenario: Ingen parstart ger individuell start
      Givet en klass som lottas utan parstart
      Så startar deltagarna en och en

    Scenario: Parstart två och två
      Givet en klass som lottas med parstart om två
      Så startar deltagarna två åt gången på varje starttid

  Regel: Flera klasser kan lottas från en översiktssida

    Scenario: Automatisk lottning lottar det som återstår
      Givet en översiktssida med första start, minsta startintervall och metod ifyllda
      När "Automatisk lottning" väljs
      Så lottas alla klasser som saknar starttider enligt inställningarna

    Scenario: Andel vakanser anges i procent
      Givet en översiktssida där andel vakanser är 5 procent
      När den automatiska lottningen körs
      Så läggs vakanser till i den andelen

    Scenario: Löpare med samma baninledning startar inte samtidigt
      Givet två klasser vars banor har samma inledande kontroller
      När den automatiska lottningen körs med banorna inlagda
      Så startar inte två deltagare med samma baninledning på samma tid

    Scenario: Efteranmälda kan placeras före de ordinarie
      Givet en klass där vissa starttider redan är tilldelade
      När "Efteranmälda före ordinarie" är markerad och lottningen körs
      Så placeras de efteranmälda före de redan lottade

    Scenario: Gemensam start sätts för flera klasser samtidigt
      Givet översiktssidan för lottning
      När gemensam start 11:00:00 sätts för tre klasser
      Så har alla deltagare i de tre klasserna starttiden 11:00:00
