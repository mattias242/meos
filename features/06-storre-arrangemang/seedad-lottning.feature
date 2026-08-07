# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5456
# Kod: oEventDraw.cpp (DrawMethod::Seeded), oRunner (InputPlace/InputTime/InputPoints)
Egenskap: Seedad lottning
  Som arrangör av en tävling med elitklasser
  vill jag låta ranking eller tidigare resultat styra startordningen
  så att de bäst rankade startar sist.

  Regel: Seedningskällan väljs

    Scenario: Resultat från tidigare etapp används
      Givet en klass med resultat från en tidigare etapp
      När metoden "Seedad" väljs med källan "Resultat"
      Så styr resultatet startordningen

    Scenario: Tid från tidigare etapp används
      Givet en klass med tider från en tidigare etapp
      När källan "Tid" väljs
      Så styr löptiden startordningen

    Scenario: Poäng från tidigare etapp används
      Givet en klass med poäng från en tidigare etapp
      När källan "Poäng" väljs
      Så styr poängen startordningen

    Scenario: Seedningsdata matas in manuellt
      Givet tabelläget på sidan "Deltagare"
      När värden skrivs eller klistras in i kolumnerna "Placering in", "Tid in" eller "Poäng in"
      Så kan de användas som seedningskälla

    Scenario: Ranking används som källa
      Givet importerad rankingdata
      När källan "Ranking" väljs
      Så styr rankingen startordningen

    Scenario: Orankade löpare placeras efter de rankade
      Givet en klass med både rankade och orankade löpare
      När klassen seedas på ranking
      Så placeras de orankade efter alla rankade

  Regel: Seedningsgrupperna definierar hur mycket som lottas

    Scenario: Ett tal delar klassen i lika stora grupper
      Givet en klass med 40 deltagare
      När seedningsgrupperna anges som 10
      Så delas klassen in i fyra grupper om tio

    Scenario: Gruppstorlek 1 tar bort lottningsmomentet
      Givet en klass som seedas med gruppstorleken 1
      När lottningen utförs
      Så hamnar varje deltagare i sin egen seedningsgrupp
      Och lottning sker endast där seedningsdata sammanfaller

    Scenario: Gruppstorlekarna kan listas
      Givet en klass som seedas med grupperna "15, 1000"
      När lottningen utförs
      Så seedas de 15 bästa
      Och resten lottas som vanligt

  Regel: Klubbkamrater kan hindras från angränsande starttider

    Scenario: Sämst seedad flyttas neråt vid krock
      Givet att kryssrutan för att undvika angränsande klubbkamrater är markerad
      Och två deltagare från samma klubb som hamnar på angränsande starttider
      När lottningen utförs
      Så flyttas den sämst seedade neråt tills krocken är löst

    Scenario: Villkoret kan inte alltid uppfyllas
      Givet en klass med extremt många deltagare från samma klubb
      När lottningen utförs
      Så skapas en startordning ändå

  Regel: Ordningen mellan grupperna kan vändas

    Scenario: De bäst seedade startar sist som standard
      Givet en seedad klass
      När lottningen utförs
      Så startar de bäst seedade sist

    Scenario: De bästa kan starta först
      Givet en seedad klass
      När "Låt de bästa starta först" markeras
      Så startar de bäst seedade först

  Regel: Parstart och nummerlappar kan kombineras med seedning

    Scenario: Parstart om två
      Givet en seedad klass
      När "Tillämpa parstart" väljs
      Så startar deltagarna två och två

    Scenario: Nummerlappar tilldelas vid seedad lottning
      Givet en seedad klass
      När "Tilldela nummerlappar" markeras med första nummer 101
      Så får deltagarna nummerlappar från och med 101
