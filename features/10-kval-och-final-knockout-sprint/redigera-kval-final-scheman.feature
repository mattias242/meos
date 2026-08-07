# language: sv
Egenskap: Kvalificering från heat till final
  Som arrangör av tävling med kval- och finalheat
  vill jag att löpare placeras i rätt final utifrån placering i kvalet
  så att uppflyttningen alltid följer det definierade kvalschemat.

  Bakgrund:
    Givet ett kvalschema med två kvalheat där de 2 främsta i varje heat går till A-final
    Och övriga går till B-final

  Scenario: De främsta går till A-final
    Givet att en löpare slutar på placering 2 i kvalheat 1
    När finalerna beräknas
    Så placeras löparen i A-finalen

  Scenario: Övriga går till B-final
    Givet att en löpare slutar på placering 3 i kvalheat 1
    När finalerna beräknas
    Så placeras löparen i B-finalen

  Scenario: Delad placering på kvalgränsen
    Givet att två löpare delar placering 2 i kvalheat 1
    När finalerna beräknas
    Så hanteras båda enligt schemats regel för delad placering
    Och ingen löpare lämnas utan finalklass

  Scenario: Löpare utan godkänt kvalresultat
    Givet att en löpare är felstämplad i kvalheat 1
    När finalerna beräknas
    Så placeras löparen enligt schemats regel för icke kvalificerade

  Scenario: Schema överlever export och import
    Givet ett definierat kvalschema
    När schemat exporteras till XML och importeras igen
    Så är det importerade schemat identiskt med originalet
