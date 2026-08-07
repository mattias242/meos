# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5452
# Kod: MeOSFeatures::Economy, TabClub.cpp (fakturor), oRunner (avgiftsfält)
Egenskap: Ekonomi och fakturor
  Som ekonomiansvarig
  vill jag att avgifter räknas ut automatiskt och fakturor skapas per klubb
  så att tävlingens ekonomi kan hanteras utan handpåläggning per deltagare.

  Regel: Fakturan bygger på deltagarnas avgiftsfält

    Scenario: Fakturan sammanställs från deltagarnas fält
      Givet deltagare med brickhyra, anmälningsavgift och betalat ifyllda
      När en faktura skapas
      Så bygger den på dessa fält

    Scenario: Kryssrutan hyrbricka sätter hyravgiften
      Givet en inställd avgift för brickhyra i tävlingsinställningarna
      När kryssrutan "Hyrbricka" markeras för en deltagare
      Så sätts hyravgiften till den inställda avgiften

  Regel: Avgifter styrs på tre nivåer

    Scenario: Tävlingen definierar standardavgifter
      Givet sidan "Tävling"
      När ordinarie avgift matas in för ungdomsklasser, vanliga klasser och elitklasser
      Så gäller de som standard

    Scenario: Sista datum och höjning i procent styr efteranmälan
      Givet ett sista datum för ordinarie anmälan och en avgiftshöjning i procent
      När en deltagare anmäls efter datumet
      Så tas den förhöjda avgiften ut

    Scenario: Ett andra stoppdatum ger ytterligare höjning
      Givet ett andra stoppdatum satt till tävlingsdagen med en höjning
      När en deltagare direktanmäls på tävlingsdagen
      Så tas den högre avgiften ut

    Scenario: Ny klass får avgifter från tävlingsinställningarna
      Givet inställda avgifter på tävlingen
      När en ny klass skapas
      Så får fälten anmälningsavgift och efteranmälningsavgift värden enligt inställningarna och klasstypen

    Scenario: Reducerad avgift gäller unga och gamla
      Givet inställda åldersgränser i tävlingsinställningarna
      När en deltagare inom en åldersgräns anmäls
      Så används den reducerade avgiften

    Scenario: Avgifter från Eventor går före
      Givet klasser importerade från Eventor med avgiftsinformation
      När avgifterna bestäms
      Så används informationen från importen

    Scenario: Deltagarens avgift räknas ut vid anmälan
      Givet en klass med inställda avgifter
      När en deltagare anmäls
      Så tilldelas avgiften utifrån klassens inställningar, anmälningsdatum och deltagarens ålder

    Scenario: Åldersberoende avgift kräver uppmärksamhet vid direktanmälan
      Givet en klass där avgiften beror på deltagarens ålder
      När en deltagare direktanmäls
      Så måste operatören kontrollera att rätt avgift används

    Scenario: Ändrad tävlingsavgift kan slå igenom på befintliga
      Givet ändrade avgifter i tävlingsinställningarna
      När ändringen sparas
      Så frågar MeOS om avgiften ska uppdateras för alla deltagare och klasser

    Scenario: Ändrad klassavgift kan slå igenom på klassens deltagare
      Givet en ändrad avgift i snabbinställningarna på sidan "Klasser"
      När ändringen sparas
      Så frågar MeOS om avgiften ska uppdateras för klassens deltagare

  Regel: Oväntade avgifter kan kontrolleras

    Scenario: Rapporten jämför uträknad och faktisk avgift
      Givet en deltagare vars avgift avviker från den uträknade
      När rapporten "Oväntade anmälningsavgifter" visas på sidan "Listor"
      Så visas deltagarens namn, klubb, klass, ålder, förväntad avgift och faktisk avgift

  Regel: Betalning kan krävas före godkänt resultat

    Scenario: Resultat godkänns inte utan registrerad betalning
      Givet en deltagare där "Kräv betalning innan resultatet godkänns" är markerad
      När deltagaren går i mål utan registrerad betalning
      Så godkänns inte resultatet

    Scenario: Påminnelse vid brickavläsning
      Givet en deltagare med krav på betalning
      När deltagarens bricka läses av
      Så påminns operatören om att betalning ska ske

  Regel: Avgifter kan tilldelas i efterhand

    Scenario: Verktyget filtrerar deltagare
      Givet sidan "Klubbar"
      När "Avgifter" väljs och klasstyp, datumgränser och åldersgränser anges
      Så pekas en delmängd av deltagarna ut

    Scenario: Endast deltagare utan avgift kan väljas
      Givet avgiftsverktyget
      När valet att endast tilldela avgift till deltagare som saknar avgift görs
      Så påverkas endast dessa

    Scenario: Urvalet kan granskas
      Givet ett satt filter i avgiftsverktyget
      När "Visa valda deltagare" väljs
      Så listas de deltagare filtret pekar ut

    Scenario: Avgifter tilldelas de valda
      Givet ett satt filter
      När "Tilldela avgifter" väljs
      Så får de valda deltagarna avgiften

    Scenario: Avgifter kan nollställas
      Givet deltagare med avgifter
      När "Nollställ avgifter" väljs
      Så raderas avgifterna

  Regel: Fakturor skapas per klubb eller samlat

    Scenario: Faktura för en klubb
      Givet en markerad klubb på sidan "Klubbar"
      När "Faktura" väljs
      Så skapas klubbens faktura

    Scenario: Alla fakturor skrivs ut
      Givet en tävling med flera klubbar
      När "Skriv ut alla" väljs under "Skapa fakturor"
      Så skapas ett utskriftsjobb med alla fakturor
      Och en sammanställning med fakturanummer och belopp fogas till slutet

    Scenario: Alla fakturor exporteras till HTML
      Givet en tävling med flera klubbar
      När "Exportera alla till HTML" väljs och en mapp anges
      Så skapas ett HTML-dokument per klubb

    Scenario: Alla fakturor exporteras till PDF
      Givet en tävling med flera klubbar
      När "Exportera alla till PDF" väljs och en mapp anges
      Så skapas en PDF per klubb

    Scenario: Sammanställningen kan tas fram separat
      Givet en tävling med avgifter
      När "Sammanställning" väljs
      Så tas sammanställningen fram utan att fakturorna skapas

  Regel: Fakturainställningar styr numrering och innehåll

    Scenario: Fakturanummer löper från ett angivet startnummer
      Givet fakturainställningarna med första fakturanummer 1001
      När fakturor skapas
      Så numreras de löpande från 1001

    Scenario: Organisatör och betalningsinformation krävs
      Givet fakturainställningarna
      När fakturor ska skapas
      Så behövs organisatör och betalningsinformation

    Scenario: Adressfältets koordinater kan anges
      Givet fakturainställningarna
      När exakta koordinater för adressfältet anges
      Så placeras adressen där, till exempel för att passa i ett fönsterkuvert

    Scenario: Egna textrader skrivs ut på varje faktura
      Givet fakturainställningarna med egna textrader
      När fakturor skapas
      Så skrivs raderna ut på varje faktura

  Regel: Lag och flera etapper har egna rekommendationer

    Scenario: Lagavgift som summan av deltagarnas avgifter
      Givet en stafett där varje deltagare har en avgift
      När lagets avgift beräknas
      Så är den summan av deltagarnas avgifter

    Scenario: Kombinationslag får proportionell fördelning
      Givet ett kombinationslag med deltagare från olika klubbar
      När avgifterna fördelas per deltagare
      Så blir fördelningen proportionell mellan klubbarna

    Scenario: Avgift kan sättas per lag
      Givet sidan "Lag"
      När en lagavgift matas in
      Så används den för laget

    Scenario: Flera etapper faktureras från sista etappen
      Givet en tävling med flera etapper
      När varje deltagare tilldelas den totala avgiften
      Så skapas fakturor endast från den sista etappen

    Scenario: Direktanmälda förs över med status deltar ej
      Givet deltagare som direktanmält sig till en etapp
      När resultat överförs till nästa etapp
      Så kan de föras över med status "Deltar ej"
      Och kommer med i den slutgiltiga ekonomiska sammanställningen
