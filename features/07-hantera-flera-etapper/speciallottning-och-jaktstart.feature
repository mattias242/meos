# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5488
# Kod: oEvent::DrawMethod::Pursuit och ReversePursuit, oEventDraw.cpp
Egenskap: Speciallottning och jaktstart
  Som arrangör av en etapptävling
  vill jag lotta jaktstart utifrån den sammanlagda ställningen
  så att den som leder startar först och först i mål vinner.

  Regel: Flerdagarsfunktionerna aktiveras i lottningsdialogen

    Scenario: Jaktstartsmetoderna tillkommer
      Givet lottningen av etapp 2 på sidan "Klasser"
      När "Använd funktioner för flerdagarsklass" markeras
      Så tillkommer metoderna "Jaktstart" och "Omvänd jaktstart"

    Scenario: Vakanser, nummerlappar och efteranmälda försvinner
      Givet att flerdagarsfunktionerna är markerade
      När lottningsdialogen visas
      Så går det inte att tillsätta vakanser, tilldela nummerlappar eller lotta efteranmälda

  Regel: Jaktstart startar ledaren först

    Scenario: Ledaren startar på första start
      Givet en jaktstart med första start 10:00:00
      När lottningen utförs
      Så startar ledaren 10:00:00

    Scenario: Övriga startar den tid de är efter
      Givet en jaktstart med första start 10:00:00
      Och en deltagare som är 3:30 efter totalt
      När lottningen utförs
      Så startar deltagaren 10:03:30

    Scenario: Tidsskalning halverar tidsavstånden
      Givet en jaktstart med tidsskalningen 0.5
      Och en deltagare som är en minut efter
      När lottningen utförs
      Så startar deltagaren 30 sekunder efter ledaren

    Scenario: Maxtid efter avgör vem som får jaktstart
      Givet en jaktstart med maxtid efter 15:00
      Och en deltagare som är 20:00 efter med tidsskalningen medräknad
      När lottningen utförs
      Så deltar deltagaren inte i jaktstarten

    Scenario: De som är för långt efter får intervallstart
      Givet deltagare som är mer efter än maxtiden
      När lottningen utförs
      Så startar de med intervallstart ordnad efter resultat
      Och från och med första omstartstid med angivet startintervall

  Regel: Maxtid efter 0:00 ger seedad minutstart

    Scenario: Bäst startar först i en seedad minutstart
      Givet en jaktstart med maxtid efter 0:00
      När lottningen utförs
      Så skapas en seedad minutstart där bäst startar först

    Scenario: Första start och tidsskalning saknar effekt
      Givet en jaktstart med maxtid efter 0:00
      När lottningen utförs
      Så har fälten "Första start" och "Tidsskalning" ingen effekt
      Och första start inträffar vid första omstartstid

    Scenario: Parstart kan tillämpas
      Givet en jaktstart med "Tillämpa parstart"
      När lottningen utförs
      Så startar deltagarna två och två

  Regel: Omvänd jaktstart vänder ordningen

    Scenario: Den som är längst efter startar först
      Givet en omvänd jaktstart med första start 10:00:00
      När lottningen utförs
      Så startar den som är längst efter ledaren 10:00:00
      Och ledaren startar sist

    Scenario: För långt efter eller ej godkänd får intervallstart
      Givet deltagare som inte är godkända sedan tidigare eller är längre efter än maxtiden
      När lottningen utförs
      Så startar de med intervallstart från och med första omstartstid

    Scenario: Första omstartstid kan ligga före eller efter första start
      Givet en omvänd jaktstart
      När första omstartstid sätts före första start
      Så accepteras det

    Scenario: Ej godkända startar alltid sist i omstarten
      Givet deltagare som inte är godkända sedan tidigare
      När intervallstarten lottas
      Så startar de sist i omstarten

    Scenario: Maxtid efter 0:00 ger omvänd seedad startordning
      Givet en omvänd jaktstart med maxtid efter 0:00
      När lottningen utförs
      Så startar bäst sist
