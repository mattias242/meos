# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5503
# Kod: qualification_final.cpp (getPrelFinalFromPlace, computeFinals),
#      MeOSFeatures::MultipleRaces, TabClass.cpp (lås startlista)
Egenskap: Kval och final – knockout sprint
  Som arrangör av ett mästerskap med kval, semifinaler och final
  vill jag köra alla lopp i en och samma tävling
  så att nästa startlista är klar i samma stund som kvalet avgörs.

  Regel: Upplägget har fördelar och nackdelar mot separata etapper

    Scenario: Nästa startlista tas fram utan särskilda åtgärder
      Givet ett kval-final-schema i en tävling
      När sista deltagaren går i mål i de kvalificerande klasserna
      Så är nästa startlista klar

    Scenario: Alla lopp kan redovisas i en lista
      Givet en tävling med kval och finaler
      När en lista eller rapport tas fram
      Så kan alla lopp redovisas tillsammans

    Scenario: Kontroller och banor delas mellan loppen
      Givet en tävling med kval och finaler
      När kontroller flyttas under tävlingen
      Så betyder samma kontroll olika punkter i olika lopp

    Scenario: Trasig kontroll kan inte gälla bara ett lopp
      Givet en tävling med kval och finaler
      När en kontroll sätts som trasig
      Så gäller det alla lopp

    Scenario: Tidigare lopp är inte helt låsta
      Givet ett avgjort kvallopp
      När en ändring av misstag görs i kvalet
      Så kan förutsättningarna framåt förändras

  Regel: Uppsättningen görs steg för steg

    Scenario: Flera lopp per löpare måste aktiveras
      Givet sidan "Tävling"
      När "Flera lopp för en löpare" aktiveras under "MeOS funktioner"
      Så kan kval-final-scheman användas

    Scenario: Schemat kopplas till en grundklass
      Givet en grundklass "Damer"
      När "Kval/final-schema" väljs på sidan "Klasser"
      Så startas schemaredigeraren

    Scenario: Härledda klasser skapas när schemat används
      Givet ett färdigt schema
      När "Använd i klassnamn" klickas för klassen "Damer"
      Så skapas härledda klasser som "Damer–Kval", "Damer–Semi A", "Damer–Semi B" och "Damer–Final"

    Scenario: Härledda klasser kan döpas om
      Givet skapade härledda klasser
      När en klass döps om
      Så behålls kopplingen till schemat

  Regel: Anmälan sker till grundklassen

    Scenario: Deltagare anmäls till grundklassen
      Givet en grundklass med ett kval-final-schema
      När en deltagare anmäls
      Så ska anmälan göras till grundklassen, inte till kval- eller finalklasserna

    Scenario: Ett enpersonslag skapas per deltagare
      Givet en anmälan till grundklassen
      När deltagaren registreras
      Så skapas ett enpersonslag med så många lopp som deltagaren kan springa

    Scenario: Kvalets startlista fylls med första loppen
      Givet anmälda deltagare i grundklassen
      När kvalets startlista visas
      Så innehåller den deltagarnas första lopp

  Regel: Fördelningen mellan kvalheat kan styras

    Scenario: Jämn fördelning som standard
      Givet flera kvalklasser
      När deltagarna fördelas
      Så gör MeOS en jämn fördelning

    Scenario: Klassdelning styr fördelningen
      Givet grundklassen "Damer"
      När den avancerade funktionen "Dela klassen" används
      Så kan deltagarna fördelas till heaten, till exempel jämnt efter ranking

  Regel: Kvalklasserna hanteras som vanliga individuella klasser

    Scenario: Lottning, banor och listor fungerar som vanligt
      Givet en kvalklass
      När starttider lottas, banor väljs och listor skrivs ut
      Så fungerar det som för vilken individuell klass som helst

  Regel: Nästa nivå fylls på automatiskt

    Scenario: Nästa nivå uppdateras vartefter löparna går i mål
      Givet ett pågående kvallopp
      När löparna går i mål
      Så fylls klasserna på nästa nivå på baserat på resultatet

    Scenario: Delad placering låter båda gå vidare
      Givet en delad placering där bara en skulle gå vidare
      När nästa nivå bestäms
      Så går båda vidare
      Och nästa klass kan få fler deltagare än planerat

  Regel: Startlistan bör låsas när nivån är fastställd

    Scenario: Lås startlista hindrar automatisk omfördelning
      Givet en fastställd startlista för en nivå
      När "Lås startlista" väljs på sidan "Klasser"
      Så ändrar MeOS inte klasstilldelningen även om kvalresultatet ändras

    Scenario: Manuella justeringar blir möjliga efter låsning
      Givet en låst startlista
      När klasstilldelningen justeras manuellt
      Så ändrar MeOS inte tillbaka

    Scenario: Proceduren upprepas till finalen
      Givet en genomförd nivå
      När förberedelser görs och nästa nivå genomförs
      Så upprepas proceduren tills finalen är avgjord
