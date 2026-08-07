# language: sv
Egenskap: Placeringsberäkning i klass
  Som arrangör
  vill jag att placeringar beräknas korrekt, även vid delade tider
  så att resultatlistan alltid är rättvis och konsekvent.

  Bakgrund:
    Givet en klass "H21" med individuell tidtagning

  Scenario: Placering efter tid
    Givet godkända löpare med tiderna 35:30, 34:10 och 36:00
    När resultatet beräknas
    Så är placeringarna 2, 1 och 3 i motsvarande ordning

  Scenario: Delad tid ger delad placering
    Givet godkända löpare A, B och C med tiderna 34:10, 34:10 och 36:00
    När resultatet beräknas
    Så får A och B placering 1
    Och C får placering 3

  Scenario: Felstämplad löpare får ingen placering
    Givet en godkänd löpare med tiden 35:30
    Och en felstämplad löpare med tiden 33:00
    När resultatet beräknas
    Så får den godkända löparen placering 1
    Och den felstämplade löparen ingen placering

  Scenario: Ej start påverkar inte placeringar
    Givet en godkänd löpare med tiden 35:30
    Och en löpare med status "Ej start"
    När resultatet beräknas
    Så får den godkända löparen placering 1
