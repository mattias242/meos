# language: sv
Egenskap: Val av funktioner för en tävling
  Som arrangör
  vill jag slå på och av funktionsmoduler per tävling
  så att MeOS bara visar det tävlingen behöver, utan att beroenden bryts.

  # Källa: MeOSFeatures::useFeature / isRequired / serialize / loadDefaults
  #        samt guiden i newcompetition.cpp (steg 2)

  Regel: Beroenden aktiveras automatiskt

    Scenario: Ekonomi aktiverar klubbfunktionerna
      Givet en tävling där varken "Klubbar" eller "Redigera klubbar" är aktiva
      När funktionen "Ekonomi och avgifter" aktiveras
      Så är även "Klubbar" och "Redigera klubbar" aktiva

    Scenario: Flera lopp för en löpare aktiverar stafett
      Givet en tävling utan stafettfunktion
      När funktionen "Flera lopp för en löpare" aktiveras
      Så är även "Stafetter och lagtävlingar" aktiv

  Regel: En funktion som krävs av en annan kan inte slås av

    Scenario: Klubbar kan inte slås av medan Ekonomi och avgifter är aktiv
      Givet en tävling med funktionen "Ekonomi och avgifter" aktiv
      När funktionen "Klubbar" försöker slås av
      Så förblir "Klubbar" aktiv

    Scenario: Rogaining kan inte slås av när tävlingen har rogaining-klasser
      Givet en tävling med en rogaining-klass och funktionen "Rogaining" aktiv
      När funktionen "Rogaining" försöker slås av
      Så förblir "Rogaining" aktiv

  Regel: Att slå av en funktion raderar aldrig tävlingsdata
    # "Att stänga av en funktion påverkar aldrig tävlingen på annat sätt än
    #  att funktionen inte är aktiv." — melin.nu, MeOS funktioner

    Scenario: Inmatade avgifter finns kvar när Ekonomi slås av och på igen
      Givet en tävling med funktionen "Ekonomi och avgifter" aktiv
      Och en löpare med avgiften 150
      När funktionen "Ekonomi och avgifter" slås av
      Och funktionen "Ekonomi och avgifter" slås på igen
      Så är löparens avgift fortfarande 150

  Regel: Standardval härleds från tävlingens innehåll

    Scenario: Ny tävling får basfunktionerna som standard
      Givet en ny tävling utan särskilda inställningar
      När standardfunktionerna läses in
      Så är "Klubbar", "Flera MeOS-klienter i nätverk", "Gafflade individuella banor", "Vakanser och återbud", "Beräkna kvar-i-skogen", "Förbereda startlistor" och "Nummerlappar" aktiva

    Scenario: Ekonomi ingår i standardvalet när tävlingen använder avgifter
      Givet en tävling där tävlingsinställningen "använd ekonomi" är påslagen
      När standardfunktionerna läses in
      Så är "Ekonomi och avgifter" och "Redigera klubbar" aktiva

    Scenario: Löpardatabasen ingår i standardvalet om den inte valts bort
      Givet en tävling där tävlingsinställningen "hoppa över löpardatabasen" är avslagen
      När standardfunktionerna läses in
      Så är "Klubb- och löpardatabas" aktiv

    Scenario: Tävling med stafettklass får stafettfunktionen
      Givet en tävling vars klasser innehåller en stafettklass
      När standardfunktionerna läses in
      Så är "Stafetter och lagtävlingar" aktiv

  Regel: Funktionsvalet lagras med tävlingen och överlever omläsning

    Scenario: Serialisering är en rundresa
      Givet en tävling med funktionerna "Nummerlappar", "Klubbar" och "Förbereda startlistor"
      När funktionsvalet sparas och läses in igen
      Så är exakt samma funktioner aktiva

    Scenario: Inga funktioner lagras som "NONE"
      Givet en tävling utan aktiva funktioner
      När funktionsvalet sparas
      Så lagras värdet "NONE"

    Scenario: Okända koder ignoreras och beroenden fylls i vid inläsning
      Givet ett lagrat funktionsval med en okänd kod och "Ekonomi och avgifter" utan sina beroenden
      När funktionsvalet läses in
      Så ignoreras den okända koden
      Och "Klubbar" och "Redigera klubbar" är aktiva

    Scenario: Tomt lagrat funktionsval ger standardvalet
      Givet en tävling vars lagrade funktionsval är tomt
      När funktionsvalet läses in
      Så är standardfunktionerna aktiva

  Regel: "Använd alla" aktiverar allt utom Utan banor

    Scenario: Använd alla
      Givet en tävling
      När "Alla funktioner" väljs
      Så är alla funktioner utom "Utan banor" aktiva

  Regel: Guiden "Ny tävling" erbjuder färdiga funktionsprofiler
    # newcompetition.cpp, newCompetitionGuide steg 2

    Scenario: Profilen "Individuell tävling" ger en komplett individuell tävling
      Givet en ny tävling utan lag
      När profilen "Individuell tävling" väljs
      Så är "Använd speakerstöd", "Ekonomi och avgifter", "Redigera klubbar", "Flera MeOS-klienter i nätverk", "Vakanser och återbud", "Beräkna kvar-i-skogen", "Förbereda startlistor", "Nummerlappar" och "Klubb- och löpardatabas" aktiva
      Och "Klubbar" är aktiv eftersom "Redigera klubbar" kräver den
      Och "Stafetter och lagtävlingar" är inte aktiv

    Scenario: Profilen "Individuellt, gafflat" lägger till gafflade banor
      Givet en ny tävling utan lag
      När profilen "Individuellt, gafflat" väljs
      Så är samma funktioner som i "Individuell tävling" aktiva
      Och "Gafflade individuella banor" är aktiv

    Scenario: Profilen "Endast grundläggande" nollställer och behåller bara klubbfunktionerna
      Givet en ny tävling med funktioner redan aktiva
      När profilen "Endast grundläggande" väljs
      Så är endast "Klubbar" och "Klubb- och löpardatabas" aktiva

    Scenario: Profilen "Endast tidtagning (utan banor)" slår på Utan banor
      Givet en ny tävling utan lag
      När profilen "Endast tidtagning (utan banor)" väljs
      Så är "Utan banor" aktiv
      Och "Beräkna kvar-i-skogen" är inte aktiv

    Scenario: Profilen "Tävling med lag" slår på stafett
      Givet en ny tävling
      När profilen "Tävling med lag" väljs
      Så är "Stafetter och lagtävlingar" aktiv

    Scenario: Profilen "Tävling med lag" slår på flera lopp när tävlingen har flerloppslöpare
      Givet en ny tävling där minst en löpare springer flera lopp
      När profilen "Tävling med lag" väljs
      Så är "Flera lopp för en löpare" aktiv

    Scenario: Individuella profiler är inte valbara för en tävling med lag
      Givet en tävling som redan innehåller lag
      När funktionsprofilerna visas
      Så går det inte att välja "Individuell tävling", "Individuellt, gafflat", "Endast grundläggande" eller "Endast tidtagning (utan banor)"
