# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5487
# Kod: oevent_transfer.cpp (Överför resultat till nästa etapp),
#      oRunner (InputStatus/InputTime/InputPlace/InputPoints)
Egenskap: Genomföra etappen
  Som arrangör
  vill jag genomföra varje etapp som en vanlig tävling och sedan överföra resultat
  så att nästa etapp får rätt ingående ställning.

  Regel: Etappen genomförs som vilken tävling som helst

    Scenario: Särskilda handgrepp krävs bara före och efter
      Givet en uppsatt etapp
      När etappen genomförs
      Så krävs särskilda handgrepp endast för att sätta upp etappen och för att överföra resultat efteråt

    Scenario: Etappen flyttas till och från servern som fil
      Givet en etapp förberedd lokalt
      När "Spara tävling som fil" väljs och filen importeras på servern
      Så kan tävlingen genomföras där
      Och sparas som fil igen med resultat och importeras lokalt

  Regel: Resultat överförs från den version som har resultat

    Scenario: Överföringen startas från etapp 1
      Givet den version av etapp 1 som har resultat
      När "Hantera flera etapper" väljs och etapp 2 står som nästa etapp
      Och "Överför resultat till nästa etapp" väljs
      Så överförs resultaten

  Regel: Klassbyten mellan etapper hanteras enligt ett valt alternativ

    Scenario: Byt till vakansplats i rätt klass
      Givet en deltagare som bytt klass och en ledig vakansplats i rätt klass i nästa etapp
      När alternativet "Byt till vakansplats i rätt klass (om möjligt)" väljs
      Så byter deltagaren klass i nästa etapp och tar vakansplatsen

    Scenario: Ingen ledig vakansplats behåller klassen utan totalresultat
      Givet en deltagare som bytt klass men ingen ledig vakansplats
      När alternativet "Byt till vakansplats i rätt klass (om möjligt)" väljs
      Så behålls klassen i nästa etapp
      Och deltagaren får inget totalresultat

    Scenario: Byt till rätt klass utan hänsyn till starttid
      Givet en nästa etapp som inte är lottad
      När alternativet "Byt till rätt klass (behåll eventuell starttid)" väljs
      Så byter deltagaren klass utan hänsyn till starttid

    Scenario: Tillåt ny klass utan totalresultat
      Givet en deltagare med annan klass i nästa etapp
      När alternativet "Tillåt ny klass, inget totalresultat" väljs
      Så behålls den nya klassen
      Och deltagaren får inget totalresultat

    Scenario: Tillåt ny klass och behåll resultat från annan klass
      Givet en deltagare med annan klass i nästa etapp
      När alternativet "Tillåt ny klass, behåll resultat från annan klass" väljs
      Så behålls både klassen och totalresultatet även om resultaten kommer från olika klasser

  Regel: Nyanmälda under en etapp kan föras över

    Scenario: Klasser med nya anmälningar väljs
      Givet nyanmälda deltagare i vissa klasser under etapp 1
      När "Välj klasser med nya anmälningar" väljs
      Så visas en lista där klasserna kan väljas

    Scenario: Övriga nya deltagare förs över utan att delta
      Givet nyanmälda i klasser som inte valts
      När "Överför nya deltagare i övriga klasser med status" markeras
      Så överförs de utan att delta i nästa etapp
      Och de kan tas med i en samlad faktura

  Regel: Överförda resultat syns på deltagaren

    Scenario: Rutan Resultat från tidigare etapper
      Givet en deltagare i etapp 2
      När deltagaren visas på sidan "Deltagare"
      Så finns rutan "Resultat från tidigare etapper" med fälten Status, Tid, Placering och Poäng

    Scenario: Värdena kan ändras manuellt
      Givet överförda resultat på en deltagare
      När värdena ändras manuellt
      Så används de ändrade värdena

    Scenario: Överföringen kan göras om
      Givet ändringar gjorda i föregående etapp
      När resultaten överförs på nytt
      Så uppdateras värdena

    Scenario: Tabelläget visar samma värden
      Givet tabelläget på sidan "Deltagare"
      När kolumnerna visas
      Så innehåller "Tid in", "Status in", "Poäng in" och "Placering in" det överförda totalresultatet

  Regel: Etappresultat och slutresultat inkluderar överförda resultat

    Scenario: Listorna använder de överförda resultaten
      Givet en etapp med överförda resultat
      När listorna "Etappresultat" och "Slutresultat" visas
      Så ingår de överförda resultaten
