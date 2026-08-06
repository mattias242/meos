# language: sv
Egenskap: Val av funktioner för en tävling
  Som arrangör
  vill jag slå på och av funktionsmoduler per tävling
  så att MeOS bara visar det tävlingen behöver, utan att beroenden bryts.

  # Källa: MeOSFeatures::useFeature / isRequired / serialize / loadDefaults

  Regel: Beroenden aktiveras automatiskt

    Scenario: Ekonomi aktiverar klubbfunktionerna
      Givet en tävling där varken "Klubbar" eller "Redigera klubbar" är aktiva
      När funktionen "Ekonomi" aktiveras
      Så är även "Klubbar" och "Redigera klubbar" aktiva

    Scenario: Flera lopp per löpare aktiverar stafett
      Givet en tävling utan stafettfunktion
      När funktionen "Flera lopp per löpare" aktiveras
      Så är även "Stafett" aktiv

  Regel: En funktion som krävs av en annan kan inte slås av

    Scenario: Klubbar kan inte slås av medan Ekonomi är aktiv
      Givet en tävling med funktionen "Ekonomi" aktiv
      När funktionen "Klubbar" försöker slås av
      Så förblir "Klubbar" aktiv

    Scenario: Rogaining kan inte slås av när tävlingen har rogaining-klasser
      Givet en tävling med en rogaining-klass och funktionen "Rogaining" aktiv
      När funktionen "Rogaining" försöker slås av
      Så förblir "Rogaining" aktiv

  Regel: Standardval härleds från tävlingens innehåll

    Scenario: Ny tävling får basfunktionerna som standard
      Givet en ny tävling utan särskilda inställningar
      När standardfunktionerna läses in
      Så är "Klubbar", "Nätverk", "Gafflad individuell", "Vakanser",
         "Kvar-i-skogen", "Lotta startlistor" och "Nummerlappar" aktiva

    Scenario: Tävling med stafettklass får stafettfunktionen
      Givet en tävling vars klasser innehåller en stafettklass
      När standardfunktionerna läses in
      Så är "Stafett" aktiv

  Regel: Funktionsvalet lagras med tävlingen och överlever omläsning

    Scenario: Serialisering är en rundresa
      Givet en tävling med funktionerna "Nummerlappar", "Klubbar" och "Lotta startlistor"
      När funktionsvalet sparas och läses in igen
      Så är exakt samma funktioner aktiva

    Scenario: Inga funktioner lagras som "NONE"
      Givet en tävling utan aktiva funktioner
      När funktionsvalet sparas
      Så lagras värdet "NONE"

    Scenario: Okända koder ignoreras och beroenden fylls i vid inläsning
      Givet ett lagrat funktionsval med en okänd kod och "Ekonomi" utan sina beroenden
      När funktionsvalet läses in
      Så ignoreras den okända koden
      Och "Klubbar" och "Redigera klubbar" är aktiva

  Regel: "Använd alla" aktiverar allt utom Utan banor

    Scenario: Använd alla
      Givet en tävling
      När "Använd alla funktioner" väljs
      Så är alla funktioner utom "Utan banor" aktiva
