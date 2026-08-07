# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5472
# Kod: oClass (multiklass, sträckindelning), TabClass.cpp (ändra sträckindelning),
#      MeOSFeatures::Relay/Patrol/ForkedIndividual/MultipleRaces
Egenskap: Lag, stafetter, gafflingar och flera lopp
  Som arrangör
  vill jag definiera klasser med flera banor eller sträckor
  så att stafetter, patruller, gafflingar och flerloppsklasser kan köras.

  # Alla klasser med mer än en bana eller mer än en sträcka kallas multiklasser.

  Regel: Multiklasser och vanliga klasser kan blandas

    Scenario: Blandad tävling accepteras
      Givet en tävling med både multiklasser och vanliga klasser
      När tävlingen körs
      Så fungerar båda slagen

  Regel: Rätt MeOS-funktioner måste vara aktiverade

    Scenario: Endast gafflade banor utan lagfunktioner
      Givet en tävling utan aktiverade funktioner för stafett eller lagtävling
      När klassinställningarna visas
      Så finns endast knappen "Gafflade banor"

    Scenario: Lagfunktioner ger guiden för sträckindelning
      Givet en tävling med aktiverad lagfunktion
      När klassinställningarna visas
      Så finns knappen "Flera banor/stafett"

  Regel: Individuella gafflade banor ställs in för sig

    Scenario: Gemensam starttid anges
      Givet inställningarna för gafflade banor
      När en gemensam starttid anges
      Så startar klassens deltagare samtidigt

    Scenario: Banpool knyter bana vid målgång
      Givet inställningen "Använd banpool"
      När en löpare går i mål
      Så knyts den av sträckans banor som löparen sprungit till löparen

    Scenario: Banalternativ förs över till sträckans banor
      Givet listan "Banor"
      När banor markeras och "Lägg till" väljs
      Så förs de över till sträckans banor

  Regel: Importerade gafflingar kräver första nummerlappsnummer

    Scenario: Nummerlappsnummer måste sättas före import
      Givet gafflingar som ska importeras via IOF-XML 3.0
      Och att lag och deltagare ännu inte lagts in
      När importen ska göras
      Så måste första nummerlappsnummer anges i varje klass eftersom filens koppling specificeras genom nummerlappsnummer

    Scenario: Numret anges i klassernas snabbinställningar
      Givet snabbinställningarna på sidan "Klasser"
      När ett nummer skrivs i kolumnen "Nummerlapp"
      Så används det som klassens första nummerlappsnummer

  Regel: Guiden ändra sträckindelning erbjuder fördefinierade tävlingsformer

    Scenario: Endast en bana tar bort multiklassen
      Givet en multiklass
      När formen "Endast en bana" väljs
      Så tas alla stafettinställningar bort
      Och klassen är inte längre en multiklass

    Scenario: Utan inställningar skapar en tom multiklass
      Givet en klass
      När formen "Utan inställningar" väljs med ett antal sträckor
      Så skapas en multiklass utan automatiska inställningar

    Scenario: Banpool med gemensam start
      Givet en klass
      När formen "Banpool, gemensam start" väljs
      Så skapas en sträcka med banpool och gemensam start
      Och deltagare och bana knyts ihop först vid målgång

    Scenario: Banpool kan stängas av för förhandstilldelning
      Givet formen "Banpool, gemensam start"
      När "Använd banpool" avmarkeras i nästa steg
      Så tilldelas banorna i förväg efter startnummer

    Scenario: Banpool med lottad startlista
      Givet en klass
      När formen "Banpool, lottad startlista" väljs
      Så skapas samma inställningar men med lottad startlista

    Scenario: Prolog och jaktstart
      Givet en klass
      När formen "Prolog + jaktstart" väljs
      Så skapas två sträckor för en löpare
      Och sträcka 1 ska lottas
      Och sträcka 2:s startlista bestäms av resultatet på sträcka 1

    Scenario: Patrull med två SI-pinnar
      Givet en klass
      När formen "Patrull, 2 SI-pinnar" väljs
      Så avgör sist i mål lagets tid
      Och varje patrulldeltagare ska ha en egen SI-pinne

    Scenario: Patrull med en SI-pinne
      Givet en klass
      När formen "Patrull, 1 SI-pinne" väljs
      Så har laget endast en SI-pinne

    Scenario: Par- eller singelklass
      Givet en klass
      När formen "Par- eller singelklass" väljs
      Så tillåts patruller med en eller två deltagare

    Scenario: Stafett med angivet antal sträckor
      Givet en klass
      När formen "Stafett" väljs med fyra sträckor
      Så skapas en vanlig stafett med fyra sträckor

    Scenario: Tvåmannastafett låter två löpare springa varannan sträcka
      Givet en klass
      När formen "Tvåmannastafett" väljs med fyra sträckor
      Så springer löpare A sträcka 1 och 3
      Och löpare B sträcka 2 och 4

    Scenario: Extralöparstafett tillåter tre löpare på mittsträckan
      Givet en klass
      När formen "Extralöparstafett" väljs
      Så tillåts upp till tre löpare springa mittsträckan
      Och den som är först i mål växlar över till nästa löpare

    Scenario: Endast den växlande löparen måste vara godkänd
      Givet en extralöparstafett
      När en löpare som inte växlar ut någon är felstämplad
      Så påverkas inte lagets godkännande

  Regel: Sträckindelningen bör inte ändras när lag redan finns

    Scenario: Ändring i klass med anmälda lag är olämplig
      Givet en klass med redan anmälda lag eller deltagare
      När sträckindelningen ändras
      Så är det i allmänhet olämpligt
      Och MeOS försöker skapa eller omforma lag av de redan anmälda

    Scenario: Vissa konverteringar fungerar
      Givet en individuell klass med anmälda
      När den konverteras till par- eller singelklass eller till prolog och jaktstart
      Så fungerar konverteringen

  Regel: Inställningen verkställs och visar sträcktabellen

    Scenario: Verkställ visar sträckornas egenskaper
      Givet en vald tävlingsform
      När "Verkställ" klickas
      Så visas en tabell med inställningar för alla sträckor
      Och de är förinställda enligt den valda tävlingsformen
