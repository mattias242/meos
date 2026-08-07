# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5504
# Kod: qualification_final.cpp (init/encode, importXML/exportXML,
#      getPrelFinalFromPlace, computeFinals), qf_editor.cpp
Egenskap: Redigera kval/final-scheman
  Som arrangör
  vill jag definiera hur många som går vidare från vilket heat till vilken final
  så att uppflyttningen alltid följer det fastställda schemat.

  Regel: Schemaredigeraren startas från klassen

    Scenario: Redigeraren öppnas
      Givet en klass på sidan "Klasser"
      När ett kval/final-schema läggs till eller uppdateras
      Så startas schemaredigeraren

    Scenario: Befintligt schema kan laddas in
      Givet schemaredigeraren
      När ett befintligt schema laddas från fil
      Så visas dess nivåer och klasser

  Regel: Nivåer motsvarar antalet lopp från kval till final

    Scenario: Antal nivåer väljs
      Givet schemaredigeraren
      När antalet nivåer sätts till 3
      Så deltar en löpare i högst tre lopp

    Scenario: Alla startar på nivå 1
      Givet ett schema med flera nivåer
      När deltagarna fördelas
      Så startar samtliga på nivå 1

    Scenario: Kvalificering sker uppåt mellan nivåerna
      Givet ett schema med tre nivåer
      När resultatet på nivå 1 är klart
      Så kvalificerar sig vissa till nivå 2
      Och från nivå 2 kvalificerar man sig till nivå 3

    Scenario: Direktkvalificering hoppar över en nivå
      Givet ett schema där segrarna i kvalet går direkt till finalen
      När kvalet är avgjort
      Så placeras segrarna i finalen
      Och övriga kan springa ett andra kvallopp som andra chans

    Scenario: Flera klasser eller heat per nivå
      Givet en nivå i schemat
      När klasser läggs till
      Så kan de heta till exempel "Kval A", "Kval B", "Semi A" och "Final B"

  Regel: Kvalificeringsregeln klass och placering

    Scenario: Placeringar från ett kvalheat pekas ut
      Givet en klass på nivå 2
      När regeln "Klass/placering" väljs med kvalklassen och placeringarna
         1, 3, 5 och 7
      Och "Lägg till" väljs
      Så kvalificerar sig de placeringarna till klassen

    Scenario: Kvalificering kan ske från tidigare nivåer
      Givet en klass på nivå 3
      När en kvalificeringsregel pekar ut en klass på nivå 1
      Så sker direktkvalificering från den nivån

  Regel: Kvalificeringsregeln bästa tid

    Scenario: Bäst tid bland ännu okvalificerade
      Givet en klass med regeln "Bästa tid"
      När kvalificeringen beräknas
      Så kvalificeras den deltagare som ännu inte är kvalificerad
         och har bäst tid oavsett heat

    Scenario: Flera deltagare kan kvalificeras på tid
      Givet regeln "Bästa tid"
      När den läggs till flera gånger
      Så kvalificeras så många deltagare

  Regel: Kvalificeringsregeln övriga okvalificerade

    Scenario: Alla ger en B-final
      Givet en klass med regeln "Övriga okvalificerade" och valet "Alla"
      När kvalificeringen beräknas
      Så placeras alla ännu okvalificerade från föregående nivå i klassen

    Scenario: N bästa ger B-, C- och D-finaler
      Givet klasser med regeln "Övriga okvalificerade" och valet "N bästa"
      När antalet anges per klass
      Så fördelas de okvalificerade på finalerna

    Scenario: Tidskval ger ett antal beroende på tiden
      Givet en klass med regeln "Övriga okvalificerade" och valet "Tidskval"
      När en kvalificeringstid anges
      Så beror antalet kvalificerade på hur många som klarar tiden

  Regel: Uppflyttningen följer schemat

    Bakgrund:
      Givet ett kvalschema med två kvalheat där de 2 främsta i varje heat
         går till A-final
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
      Så går båda vidare till A-finalen
      Och ingen löpare lämnas utan finalklass

    Scenario: Löpare utan godkänt kvalresultat
      Givet att en löpare är felstämplad i kvalheat 1
      När finalerna beräknas
      Så placeras löparen enligt schemats regel för icke kvalificerade

  Regel: Schemat kan sparas och läsas in

    Scenario: Schema överlever export och import
      Givet ett definierat kvalschema
      När schemat exporteras till XML och importeras igen
      Så är det importerade schemat identiskt med originalet
