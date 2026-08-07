# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5463
# Kod: TabSpeaker.cpp, speakermonitor.cpp, oEventSpeaker.cpp,
#      MeOSFeatures::Speaker
Egenskap: Speakerstöd
  Som speaker
  vill jag bevaka valda klasser och kontroller i ett eller flera fönster
  så att jag kan rapportera tävlingen medan den pågår.

  Regel: Funktionen måste vara aktiverad

    Scenario: Speakersidan kräver aktiverad funktion
      Givet en tävling där "Använd speakerstöd" inte är markerat
      När sidan "Speaker" söks upp
      Så är den inte tillgänglig

  Regel: Klasser och kontroller väljs per fönster

    Scenario: Klasser väljs direkt under fliken
      Givet sidan "Speaker" som öppnas första gången
      När klasser väljs under fliken
      Så bevakas dessa klasser

    Scenario: Senaste passeringar vid en kontroll visas
      Givet valda klasser
      När listan med senaste kontrollpasseringar väljs för en kontroll eller mål
      Så visas de senaste passeringarna

    Scenario: Samma lista finns med fler inställningar på sidan Listor
      Givet sidan "Listor"
      När listan med kontrollpasseringar väljs
      Så finns fler inställningar än på speakersidan

    Scenario: Nytt fönster används för att bevaka många klasser
      Givet gjorda klass- och kontrollval
      När "Skapa nytt fönster" väljs i stället för "Spara"
      Så används inställningarna i ett nyöppnat fönster

    Scenario: Radiokontroller kan namnges
      Givet sidan "Kontroller"
      När en radiokontroll namnges
      Så används namnet i speakerstödet

  Regel: Tre vyer kan väljas för valet

    Scenario: Resultatlista vid varje passering
      Givet ett speakerfönster
      När vyn med resultatlista vid varje passering väljs
      Så visas en lista per passering

    Scenario: Totalresultatlista samlar alla passeringar
      Givet ett speakerfönster
      När totalresultatlistan väljs
      Så samlas alla passeringar i en lista

    Scenario: Händelsevyn rapporterar kronologiskt i klartext
      Givet ett speakerfönster
      När vyn "Händelser" väljs
      Så rapporteras intressanta passeringar kronologiskt i klartext

    Scenario: Händelsevyn passar när få bevakar många klasser
      Givet många klasser och få speakrar
      När vy väljs
      Så är händelsevyn särskilt användbar

  Regel: Visningsytan kan optimeras

    Scenario: Initial i förnamn sparar plats
      Givet ett speakerfönster
      När "Använd initial i namn" väljs
      Så visas bara initialen i förnamnet

    Scenario: Antal per klass kan begränsas
      Givet ett speakerfönster
      När antalet per klass begränsas
      Så visas endast så många deltagare

    Scenario: Vyn kan låsas
      Givet ett nyöppnat speakerfönster
      När knappen med hänglåset väljs
      Så låses vyn
      Och extra information och inställningsknappar tas bort
      Och informationen flyttar till fönstertiteln

  Regel: Speakerstödets funktioner

    Scenario: Textstorleken ändras
      Givet ett speakerfönster
      När "+" eller "–" väljs
      Så ökar eller minskar textstorleken

    Scenario: Grundinställningar ändras
      Givet ett speakerfönster
      När "Inställningar" väljs
      Så kan fönstrets grundinställningar ändras

    Scenario: Prioritering väljer deltagare i förväg
      Givet ett speakerfönster
      När "Prioritering" väljs
      Så kan deltagare väljas ut för prioriterad bevakning i händelsevyn

    Scenario: Nytt fönster öppnas för parallell bevakning
      Givet ett speakerfönster
      När "Nytt fönster" väljs
      Så öppnas ytterligare ett speakerfönster

    Scenario: Tidigare inställningar återskapas
      Givet sparade fönster- och klassinställningar på datorn
      När "Återskapa" väljs
      Så återskapas fönstren och inställningarna

    Scenario: Spara som ersätter Återskapa vid manuellt skapade fönster
      Givet flera manuellt skapade fönster
      När knappraden visas
      Så finns "Spara som" i stället för "Återskapa"

    Scenario: Tidsinmatning öppnas
      Givet ett speakerfönster
      När "Tidsinmatning" väljs
      Så kan passertider matas in manuellt

    Scenario: Stämplingstabellen öppnas
      Givet ett speakerfönster
      När "Stämplingar" väljs
      Så öppnas en tabell med alla stämplingar

    Scenario: Rapportläget visar en detaljerad rapport
      Givet ett speakerfönster
      När "Rapportläge" väljs och en deltagare pekas ut
      Så visas en detaljerad rapport

    Scenario: Direkt tidtagning visar rullande stoppur
      Givet ett speakerfönster
      När "Direkt tidtagning" väljs
      Så visas en specialvy för storbildskärm där deltagare som startar
         samtidigt tävlar mot varandra med rullande tidtagning
