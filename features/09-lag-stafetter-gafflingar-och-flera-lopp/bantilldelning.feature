# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5474
# Kod: oClass (bandefinition per sträcka, autoForking), oTeam (startnummer),
#      oCourse::getAdapetedCourse
Egenskap: Bantilldelning
  Som banläggare för en gafflad tävling
  vill jag styra vilka banor varje sträcka har och hur de fördelas
  så att gafflingen blir rättvis och lagen får olika kombinationer.

  Regel: Banorna tilldelas rullande efter startnummer

    Scenario: Tre banor fördelas cykliskt
      Givet en sträcka med banorna A, B och C i den ordningen
      När löparna tilldelas banor
      Så får löpare 1 bana A, löpare 2 bana B, löpare 3 bana C
      Och löpare 4 bana A igen

    Scenario: Gaffling av en stafett med tre sträckor
      Givet banorna ABC på sträcka 1, BCA på sträcka 2 och CAB på sträcka 3
      När lagen tilldelas banor
      Så springer varje lag alla tre banorna

    Scenario: Fler upprepningar ger fler ordningar
      Givet banorna ABCABC på sträcka 1, BCACAB på sträcka 2 och CABBCA på sträcka 3
      När lagen tilldelas banor
      Så finns sex möjliga ordningar: ABC, BCA, CAB, ACB, BAC och CBA

  Regel: Banpool låser gafflingen först vid målgång

    Scenario: Banan väljs efter stämplingarna
      Givet en sträcka med aktiverad banpool
      När en löpare gått i mål
      Så väljer MeOS den av sträckans banor som bäst matchar stämplingarna

    Scenario: Ingen kontroll görs av lagets samlade gaffling
      Givet en klass med banpool
      När lagets banor tilldelats
      Så görs bantilldelningen oberoende för varje sträcka
      Och ingen kontroll görs av att laget som helhet sprungit alla alternativ

  Regel: Oordnade parallella sträckor tillåter fri ordning inom laget

    Scenario: Löparna kan ta vilken av lagets gafflingar som helst
      Givet oordnade parallella sträckor med fyra banor och fyra löpare
      När löparna gått i mål
      Så spelar det ingen roll vilken löpare som tagit vilken bana

    Scenario: Samtliga lagets banor måste ändå ha löpts
      Givet oordnade parallella sträckor
      När lagets resultat bedöms
      Så kontrolleras att samtliga lagets banor löpts
      Och endast en annan ordning tillåts

  Regel: Gafflingsnycklar kan beräknas automatiskt

    Scenario: Banor kopplas till sträckor
      Givet funktionen "Definiera gaffling"
      När banalternativ och sträckor markeras
      Och "Använd valda banor på valda sträckor" väljs
      Så får de valda sträckorna de valda banorna

    Scenario: Proceduren upprepas för andra sträckor
      Givet att vissa sträckor ska ha en annan uppsättning banor
      När proceduren upprepas för dessa sträckor
      Så får alla sträckor rätt banor associerade

    Scenario: Optimal gaffling beräknas
      Givet sträckor med associerade banor
      När "Beräkna och tillämpa gaffling" väljs
      Så beräknar MeOS en optimal gaffling utifrån banorna

    Scenario: Gemensamma kontroller gör beräkningen effektivare
      Givet banor som är gafflade mot varandra med vissa gemensamma kontroller
      När gafflingen beräknas
      Så blir beräkningen särskilt effektiv

    Scenario: Antalet gafflingsvarianter kan begränsas
      Givet många möjliga gafflingsvarianter
      När "Max antal gafflingsvarianter" sätts i samma härad som förväntat antal lag
      Så väljer MeOS varianter med inbördes maximal spridning

    Scenario: Gafflingarna kan granskas
      Givet definierade gafflingar
      När "Visa gafflingar" väljs
      Så visas de fullständiga gafflingsalternativen för lagen som helheter
      Och närmare information om eventuella orättvisor

  Regel: Gafflingar kan låsas

    Scenario: Startnumret styr gafflingen
      Givet ett lag med ett startnummer
      När gafflingen bestäms
      Så styrs den av startnumret

    Scenario: Startnumret uppdateras normalt vid lottning
      Givet en klass som lottas eller får nummerlappar
      När åtgärden utförs
      Så uppdateras lagens startnummer

    Scenario: Lås gafflingar hindrar ändring
      Givet sidan "Klasser"
      När "Lås gafflingar" väljs
      Så låses startnummer och gaffling

    Scenario: Låsningen kan ångras
      Givet en klass med låsta gafflingar
      När "Tillåt gafflingsändringar" väljs
      Så kan gafflingarna ändras igen

  Regel: Bantilldelningen kan redovisas

    Scenario: Listan bantilldelning visar förväntad bana
      Givet en tävling med tilldelade banor
      När listan "Bantilldelning" visas på sidan "Listor"
      Så framgår vilken bana varje deltagare förväntas löpa

    Scenario: Kontroll inför tävlingen visar förväntade kontroller
      Givet en tävling med tilldelade banor
      När "Kör kontroll inför tävlingen" körs
      Så framgår vilka kontroller varje löpare förväntas besöka

    Scenario: Lagens banor kan kopieras som etikettunderlag
      Givet listan med lagens banor i tabellformat
      När listan kopieras och klistras in i ett ordbehandlingsprogram
      Så kan etiketter med lagnummer och sträcka skapas för kartorna

  Regel: Gafflingar kan utbytas med banläggningsprogram

    Scenario: Import kräver IOF-XML 3.0 och färdiga klasser
      Givet en gafflingsfil från ett banläggningsprogram
      När den ska importeras
      Så måste filformatet vara IOF-XML 3.0
      Och alla klasser vara skapade med rätt antal sträckor
      Och första nummerlappsnummer vara angivet för varje klass

    Scenario: Gafflingar exporteras från sidan Lag
      Givet en tävling med definierade gafflingar
      När "Exportera gafflingar" väljs på sidan "Lag"
      Så exporteras de i IOF-XML-format
