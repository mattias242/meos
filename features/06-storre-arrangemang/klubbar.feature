# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5449
# Kod: oClub.cpp, TabClub.cpp, RunnerDB.cpp (klubbregister)
Egenskap: Klubbar
  Som sekretariat
  vill jag kunna städa och uppdatera klubbregistret i tävlingen
  så att felstavade klubbar inte splittrar deltagare och fakturor.

  Regel: Sidan kräver att klubb- och ekonomihantering är aktiverad

    Scenario: Sidan Klubbar är tillgänglig när funktionen är på
      Givet en tävling där hantering av klubbar och ekonomi är markerat
      När sidan "Klubbar" söks upp
      Så är den tillgänglig

  Regel: Klubbar kan slås ihop

    Scenario: Felstavad klubb slås ihop med den rätta
      Givet klubbarna "IF Thor" och den felstavade "IF Tohr"
      När "IF Tohr" markeras och "Ta bort / slå ihop" väljs
      Och "IF Thor" markeras och "Slå ihop" väljs
      Så flyttas deltagarna till "IF Thor"
      Och "IF Tohr" tas bort

    Scenario: Kontrollista visar berörda deltagare
      Givet en förestående hopslagning av två klubbar
      När hopslagningen ska bekräftas
      Så visas en kontrollista över de deltagare som påverkas

  Regel: Klubbuppgifter kan uppdateras från registret

    Scenario: En klubb uppdateras
      Givet en klubb som finns korrekt stavad i klubb- och löparregistret
      När "Uppdatera" väljs
      Så hämtas klubbens uppgifter från registret

    Scenario: Felstavad klubb kan inte uppdateras
      Givet en klubb som inte finns i registret
      När "Uppdatera" väljs
      Så hämtas inga uppgifter

    Scenario: Alla klubbar uppdateras
      Givet en tävling med flera klubbar
      När "Uppdatera alla" väljs
      Så uppdateras samtliga klubbar från registret

    Scenario: Klubbar och löpare uppdateras tillsammans
      Givet en tävling med klubbar och deltagare
      När "Uppdatera klubbar & löpare" väljs
      Så uppdateras både klubbarnas och löparnas uppgifter

    Scenario: Uppgifterna hämtas normalt automatiskt vid skapandet
      Givet en klubb som skapas vid import
      När klubben finns i registret
      Så hämtas uppgifterna automatiskt

  Regel: Klubbnamn rättas mot registret vid anmälan

    Scenario: Felstavat klubbnamn ersätts av registrets
      Givet ett klubbregister med "OK Linné" och "Linköpings OK"
      När en löpare anmäls med klubben "Linne OK"
      Så ändras klubbnamnet till "OK Linné"
      Och övriga kontaktuppgifter hämtas från registret

    Scenario: Klubb utanför registret kan skapas medvetet
      Givet att en klubb verkligen ska heta "Linne OK"
      När klubben skapas på sidan "Klubbar"
      Så accepteras namnet

  Regel: Alla klubbar kan raderas

    Scenario: Radering lämnar deltagarna klubblösa
      Givet en tävling med klubbar, lag och deltagare
      När "Radera alla klubbar" väljs
      Så tas alla klubbar bort
      Och lag och deltagare finns kvar men blir klubblösa
