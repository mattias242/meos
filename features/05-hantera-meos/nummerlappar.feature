# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5441
# Kod: MeOSFeatures::Bib, oClass (BibMode), TabClass.cpp, compareBib i meos_util.cpp
Egenskap: Nummerlappar
  Som arrangör
  vill jag tilldela nummerlappar klassvis eller automatiskt över hela tävlingen
  så att numreringen blir sammanhängande och lagen får rätt nummer.

  Regel: Funktionen måste vara aktiverad

    Scenario: Nummerlappar kräver aktiverad funktion
      Givet en tävling där funktionen "Nummerlappar" är avaktiverad
      När nummerlappar efterfrågas
      Så är funktionen inte tillgänglig

  Regel: Nummerlappar kan tilldelas klassvis

    Scenario: Tilldelning i samband med lottning
      Givet en klass som lottas
      När första nummerlappsnummer 101 anges
      Så får deltagarna nummerlappar från och med 101

    Scenario: Vakanter kan uteslutas från numreringen
      Givet en klass med vakanser som lottas med nummerlappar
      När "Tilldela nummerlapp till vakanter" inte är markerat
      Så får vakanserna ingen nummerlapp

    Scenario: Antalet nummerlappar per klass kan begränsas
      Givet en klass med 30 deltagare
      När antalet nummerlappar begränsas till 10
      Så får endast de 10 första nummerlapp

    Scenario: Tilldelning utan lottning följer nuvarande startordning
      Givet en klass med befintlig startordning
      När "Nummerlappar" väljs direkt på sidan "Klasser"
      Så tilldelas nummerlappar i den nuvarande startordningen

  Regel: Automatisk hantering styrs per klass

    Scenario: Manuell betyder att nummerlappar inte ändras
      Givet en klass med nummerlappsläget "Manuell"
      När nummerlappar hanteras automatiskt
      Så ändras klassens nummerlappar inte

    Scenario: Ingen tar bort nummerlapparna
      Givet en klass med nummerlappsläget "Ingen"
      När nummerlappar hanteras automatiskt
      Så tas klassens nummerlappar bort

    Scenario: Löpande fortsätter efter föregående klass
      Givet en klass med nummerlappsläget "Löpande"
      Och att föregående klass slutar på nummer 150
      När nummerlappar hanteras automatiskt
      Så börjar klassen på nästa lediga nummer

    Scenario: Reserverade nummer skapar mellanrum mellan klasser
      Givet inställningen 10 reserverade nummer mellan klasser
      Och att föregående klass slutar på nummer 150
      När nästa klass numreras löpande
      Så börjar den på 161

    Scenario: Första nummer kan anges per klass
      Givet en klass
      När första nummer 200 skrivs in
      Så börjar klassens numrering på 200

    Scenario: Nummerlappar kan innehålla tecken utöver siffror
      Givet en klass med första nummer "A-100"
      När nummerlappar tilldelas
      Så blir numren "A-100", "A-101", "A-102" och så vidare

  Regel: Nummerlappar kan exporteras och importeras

    Scenario: Underlag exporteras för manuell ifyllnad
      Givet en tävling med deltagare
      När "Exportera underlag" väljs
      Så sparas en fil med tävlingens deltagare att fylla i nummerlappar i

    Scenario: Resterande deltagare tilldelas nummerlapp vid import
      Givet en importfil där vissa deltagare saknas
      När "Tilldela resterande deltagare nummerlapp" väljs
      Så får de saknade deltagarna nummerlappar löpande

    Scenario: Luckor fylls genom förskjutning
      Givet en importfil där lag 7 inte finns i tävlingen
      När "Förskjut för att fylla luckor" väljs
      Så får laget som i filen har nummer 8 i stället nummer 7
      Och laget med nummer 9 får nummer 8

  Regel: Lagmedlemmars nummer kan följa lagets

    Scenario: Samma nummer som laget
      Givet ett lag med nummer 100 och lagläget "Samma"
      När nummerlappar tilldelas
      Så har alla lagmedlemmar nummer 100

    Scenario: Nummer per sträcka
      Givet ett lag med nummer 100 och lagläget "Sträcka"
      När nummerlappar tilldelas
      Så får medlemmarna numren "100-1", "100-2" och "100-3"

    Scenario: Ökande nummer inom laget
      Givet ett lag med nummer 100 och lagläget "Ökande"
      När nummerlappar tilldelas
      Så får medlemmarna numren 100, 101 och 102

    Scenario: Oberoende nummer inom laget
      Givet ett lag med lagläget "Oberoende"
      När nummerlappar sätts på medlemmarna
      Så kan de sättas till vilka värden som helst
