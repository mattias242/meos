# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5447
# Kod: oClass.cpp, TabClass.cpp, generalresult.cpp (resultatmoduler)
Egenskap: Mer om klasser
  Som arrangör av ett större arrangemang
  vill jag styra klassernas typ, start, avgifter och resultatregler
  så att startlistor, fakturor och resultat följer tävlingens upplägg.

  # Kräver "Visa avancerade funktioner" på sidan Klasser.

  Regel: Klasstyp kan användas för att gruppera klasser

    Scenario: Klasstyp sätts fritt
      Givet en klass
      När typen "Elit" anges i fältet "Typ"
      Så har klassen den typen

    Scenario: Klasstyp används för att tilldela startavgifter
      Givet klasser med olika klasstyper
      När startavgifter sätts
      Så kan de tilldelas manuellt per klasstyp

  Regel: Startnamn och startblock styr startlistorna

    Scenario: Startnamnet skrivs ut i startlistan
      Givet en klass med startnamnet "Start 2"
      När startlistan skrivs ut
      Så framgår startnamnet

    Scenario: Startblock ger en minutstartlista per block
      Givet en start med två ingångar
      När klasserna vid första ingången får startblock 1
         och klasserna vid andra ingången startblock 2
      Så tas en minutstartlista fram per startblock

  Regel: Hela klasser kan strykas

    Scenario: Strykning utan återbetalning tar ut avgiften
      Givet en klass som stryks utan återbetalning
      När fakturorna skapas
      Så tas avgiften ut

    Scenario: Strykning med återbetalning tar inte ut avgiften
      Givet en klass som stryks med återbetalning
      När fakturorna skapas
      Så tas ingen avgift ut

  Regel: Fri starttid undantar klassen från lottning

    Scenario: Klassen lottas inte automatiskt
      Givet en klass med "Fri starttid"
      När automatisk lottning körs
      Så lottas klassen inte

    Scenario: Startstämpling används ändå vid målgång
      Givet en klass med "Fri starttid"
      När en deltagare startstämplat
      Så används startstämplingen vid målgång

  Regel: Ignorera startstämpling skyddar tilldelade starttider

    Scenario: Tilldelad starttid behålls trots startstämpling
      Givet en klass med "Ignorera startstämpling"
      Och en deltagare med starttid 10:05:00
      När deltagaren startstämplar 10:09:00
      Så behålls starttiden 10:05:00

    Scenario: Startstämpling används när starttid saknas
      Givet en klass med "Ignorera startstämpling"
      Och en deltagare utan starttid
      När deltagaren startstämplar 10:09:00
      Så används 10:09:00 som starttid

  Regel: Resultat vid målstämpling ger resultat utan avläsning

    Scenario: Deltagare utan bana godkänns vid målstämpling
      Givet en klass med "Resultat vid målstämpling"
      Och en deltagare utan tilldelad bana
      När deltagaren målstämplar
      Så godkänns deltagaren direkt

    Scenario: Radiokontroller används som kontroller när bana finns
      Givet en klass med "Resultat vid målstämpling"
      Och en deltagare med tilldelad bana
      När deltagaren målstämplar
      Så används inregistrerade radiokontroller som kontroller

    Scenario: Saknad kontroll ger felstämplad
      Givet en klass med "Resultat vid målstämpling" och en deltagare med bana
      När en av banans kontroller saknas bland radiostämplingarna
      Så är deltagarens status "Felstämplad"

    Scenario: Avläsning ersätter radiostämplingarna
      Givet en deltagare som fått resultat vid målstämpling
      När deltagarens bricka ändå läses av
      Så ersätts radiostämplingarna med faktisk brickdata

  Regel: Snabbinställningar ändrar många klasser samtidigt

    Scenario: Sorteringsordning styrs av index
      Givet snabbinställningarna
      När talet i rutan "Index" ändras för klasserna
      Så ordnas klasserna stigande efter det numret

    Scenario: Avgift och sen avgift sätts per klass
      Givet aktiverad ekonomi
      När avgift och sen avgift sätts i snabbinställningarna
      Så gäller de som ordinarie avgift och efteranmälningsavgift

    Scenario: Reducerad avgift gäller unga och gamla
      Givet aktiverad ekonomi och satta åldersgränser på sidan "Tävling"
      När reducerad avgift och reducerad sen avgift sätts
      Så gäller de för deltagare inom de åldersgrupperna

    Scenario: Redan anmälda kan få uppdaterad avgift
      Givet ändrade avgifter i snabbinställningarna
      När ändringen sparas
      Så frågar MeOS om avgiften ska uppdateras för redan anmälda i klassen

    Scenario: Nummerlappsinställningar görs per klass
      Givet aktiverad nummerlappshantering
      När nummerlappsinställningar görs i snabbinställningarna
      Så gäller de per klass

  Regel: Resultatmodul ger klassen egna resultatregler

    Scenario: Modul väljs i fältet Resultatuträkning
      Givet en klass och visade avancerade funktioner
      När en resultatmodul väljs i fältet "Resultatuträkning"
      Så tillämpas modulens regler

    Scenario: Reglerna gäller listor, export och speakerstöd
      Givet en klass med vald resultatmodul
      När resultat tas fram
      Så tillämpas reglerna i resultatlistor, resultatexport och speakerstöd

    Scenario: Sträcktider anpassas inte av regler som ändrar sluttiden
      Givet en resultatmodul som ändrar sluttiden
      När resultatet visas
      Så kan sluttiden se ut att inte passa ihop med sträcktiderna

    Scenario: Gruppera passar bättre än stafett för lag med individuella lopp
      Givet en lagtävling som inte ska genomföras som stafett
      När sträckornas egenskaper sätts
      Så är sträcktypen "Gruppera" ofta naturligare
      Och lagets deltagare kan springa individuella lopp, även i olika klasser

  Regel: Klassfunktioner

    Scenario: Nummerlappar tilldelas manuellt till en klass
      Givet en klass utan nummerlappar
      När funktionen "Nummerlappar" används med ett första nummer
      Så tilldelas klassen nummerlappar

    Scenario: Nummerlappar kan tas bort
      Givet en klass med nummerlappar
      När nummerlapparna tas bort
      Så saknar deltagarna nummerlapp

    Scenario: Direktanmäld får nästa lediga nummerlapp
      Givet en klass där löparna har nummerlappar upp till 130
      När en deltagare direktanmäls till klassen
      Så får deltagaren nummerlapp 131

    Scenario: Två klasser slås ihop
      Givet två klasser
      När den ena väljs och "Slå ihop" klickas och den andra väljs
      Så slås klasserna ihop till en

    Scenario: Omstart hanteras i stafettsammanhang
      Givet en stafettklass
      När funktionen "Omstart" används
      Så sätts klassens omstartsregler

    Scenario: Kvarvarande vakanser raderas i alla klasser
      Givet en tävling i slutskedet med kvarvarande vakanser
      När "Radera vakanser" väljs
      Så tas alla kvarvarande vakanser bort ur samtliga klasser
