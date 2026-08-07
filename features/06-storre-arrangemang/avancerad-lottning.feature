# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5450
# Kod: oEventDraw.cpp (DrawOptimAlgo, checkDrawSettings), TabClass.cpp
Egenskap: Avancerad lottning
  Som lottningsansvarig
  vill jag styra alla lottningsparametrar manuellt med stöd av MeOS algoritmer
  så att startfältet får jämnt flöde utan att lika banor startar samtidigt.

  Regel: Manuell lottning nås via Lotta flera klasser

    Scenario: Manuell lottning väljs
      Givet sidan "Klasser"
      När "Lotta flera klasser" och sedan "Manuell lottning" väljs
      Så visas lottningens parametrar

  Regel: Max antal parallellt startande sätter taket

    Scenario: Taket gäller de klasser lottningen omfattar
      Givet manuell lottning med max 6 parallellt startande
      När lottningen utförs
      Så startar högst 6 deltagare samtidigt i de omfattade klasserna

    Scenario: En start i taget är ofta lämpligt
      Givet en tävling med flera starter
      När lottningen planeras
      Så är det ofta bra att lotta en start i taget

  Regel: Banorna används för att undvika samtidig start med lika banor

    Scenario: Inlagda banor tas med i beräkningen
      Givet inlagda banor
      När lottningen utförs
      Så undviks att deltagare i olika klasser med liknande bana startar samtidigt

    Scenario: Inga gemensamma kontroller kräver olika första kontroll
      Givet inställningen "Inga" för max antal gemensamma kontroller
      När lottningen utförs
      Så har alla som startar på samma minut olika första kontroll

    Scenario: Få första kontroller kan ge för stort startdjup
      Givet en tävling med få olika första kontroller
      När inställningen "Inga" används
      Så kan startdjupet bli för stort

    Scenario: Första kontrollen tillåter en gemensam kontroll
      Givet inställningen "Första kontrollen"
      När lottningen utförs
      Så tillåts första kontrollen vara densamma men inte dessutom den andra

    Scenario: Ett större tal tillåter fler gemensamma kontroller
      Givet ett angivet tal för max antal gemensamma kontroller
      När lottningen utförs
      Så tillåts så många inledande gemensamma kontroller

  Regel: Klasser med samma bana kan saxas eller lottas ihop

    Scenario: Saxade banor startar omlott
      Givet två klasser med samma bana
      När "Tillåt samma bana inom basintervall (saxa banor)" markeras
      Så startar den ena klassen på jämna minuter och den andra på udda

    Scenario: Klasser med samma bana lottas som en klass
      Givet två klasser med samma bana
      När "Lotta klasser med samma bana gemensamt" markeras
      Så blir tidsintervallet konstant inom banan
      Och variabelt inom klasserna

  Regel: Basintervall och klassintervall styr startdjupet

    Scenario: Basintervallet är avståndet mellan startpipen
      Givet ett basintervall på en minut
      När lottningen utförs
      Så ligger startpipen en minut isär

    Scenario: Samma intervall i alla klasser
      Givet minsta och största intervall i klass båda satta till två minuter
      När lottningen utförs
      Så har alla klasser två minuters startintervall

  Regel: Vakanser anges i andel och absoluta gränser

    Scenario: Andel vakanser i procent av antal anmälda
      Givet andel vakanser satt till 5 procent
      När lottningen utförs
      Så lottas vakanser in i den andelen

    Scenario: Minsta och största antal vakanser per klass
      Givet minsta antal vakanser 1 och största 5
      När lottningen utförs
      Så får varje klass mellan 1 och 5 vakanser

    Scenario: Åtminstone en vakans per klass underlättar problemhantering
      Givet en tävling där felanmälningar kan förekomma
      När lottningen planeras
      Så är det praktiskt att lotta in minst en vakans per klass

    Scenario: Antalet vakanser kan justeras manuellt senare
      Givet en lottad tävling
      När antalet vakanser ska ändras i en klass
      Så går det att justera manuellt

  Regel: Utrymme kan reserveras för efteranmälda

    Scenario: Förväntad andel efteranmälda avsätter utrymme
      Givet en förväntad andel efteranmälda
      När lottningen utförs
      Så avsätts utrymme före eller efter klassen

    Scenario: Gränsen är inte hård
      Givet ett avsatt utrymme för efteranmälda
      När fler efteranmäls än väntat
      Så finns ingen garanti att löpare med samma bana slipper starta samtidigt

    Scenario: Noll ger ett kompakt startfält
      Givet att efteranmälda ska lottas tillsammans med ordinarie
      När andelen efteranmälda sätts till 0
      Så blir startfältet mer kompakt

  Regel: Fördelningen av starttider kan föreslås och granskas

    Scenario: Förslag tas fram för jämnt flöde
      Givet inställda lottningsparametrar
      När "Fördela starttider" väljs
      Så tas ett förslag fram för ett så jämnt flöde av startande som möjligt

    Scenario: Statistiken visar startdjup per minut
      Givet ett framtaget förslag
      När listan visas
      Så framgår per minut hur många som startar, det faktiska startdjupet
         och det teoretiskt kortast möjliga startdjupet

    Scenario: Startfältet kan visualiseras grafiskt
      Givet ett framtaget förslag
      När "Visualisera startfältet" väljs
      Så öppnas ett fönster med en grafisk sammanställning över vilken klass
         som startar vilken minut

  Regel: Förslaget kan justeras för hand

    Scenario: Fält kan ändras per klass
      Givet ett framtaget förslag
      När första starttid, startintervall, antal vakanser eller antal
         reserverade platser ändras för en klass
      Så används de värdena

    Scenario: Egna ändringar färgkodas
      Givet ett förslag med egna ändringar
      När tabellen visas
      Så färgkodar MeOS vad som matats in och vad MeOS föreslagit

    Scenario: Klassen kan önska tidig eller sen start
      Givet en klass i fördelningen
      När önskemålet "Tidigt" anges
      Så placeras klassen tidigt i startfältet efter uppdaterad fördelning

    Scenario: Snabba och långsamma klasser får starta samtidigt
      Givet två klasser med samma första kontroll märkta "Snabba" respektive "Långsamma"
      När fördelningen uppdateras
      Så tillåts de starta samtidigt oavsett max antal gemensamma kontroller

    Scenario: Ändringar kräver uppdaterad fördelning för att få effekt
      Givet ändrade önskemål om tidig eller sen start
      När fördelningen inte uppdaterats
      Så har ändringarna ingen effekt

    Scenario: MeOS varnar för problem i den egna fördelningen
      Givet egna ändringar som gör att två deltagare med samma bana startar samtidigt
      När fördelningen granskas
      Så varnar MeOS

    Scenario: Uppdatering rör inte låsta fält
      Givet en fördelning med egna, specifikt satta värden
      När "Uppdatera fördelning" väljs
      Så ändras inte de fälten
      Och andra klasser kan flyttas för att optimera fördelningen

    Scenario: Grundinställningarna kan göras om
      Givet en framtagen fördelning
      När "Ändra grundinställningar" väljs
      Så kan fördelningen göras om med nya grundparametrar

    Scenario: Lottningen utförs med de valda värdena
      Givet en granskad fördelning
      När "Utför lottning" väljs
      Så lottas klasserna med vald metod och de värden som står i tabellen

  Regel: Inställningar kan sparas och återanvändas

    Scenario: Starttider sparas för senare fortsättning
      Givet en pågående fördelning
      När "Spara starttider" väljs
      Så sparas aktuella starttider och intervall per klass

    Scenario: Inställningar sparas automatiskt vid lottning
      Givet en utförd lottning
      När lottningen är klar
      Så har inställningarna sparats automatiskt

    Scenario: Tidigare inställningar hämtas tillbaka
      Givet sparade inställningar från en tidigare lottning
      När "Hämta inställningar från föregående lottning" väljs
      Så återställs de inställningarna

  Regel: Efteranmälda kan lottas in i efterhand

    Scenario: Efteranmälda placeras före de ordinarie
      Givet valda klasser där alla anmälda har starttider
      När "Efteranmälda (före ordinarie)" väljs
      Så lottas de efteranmälda in före de ordinarie

    Scenario: Efteranmälda placeras efter de ordinarie
      Givet valda klasser där alla anmälda har starttider
      När "Efteranmälda (efter ordinarie)" väljs
      Så lottas de efteranmälda in efter de ordinarie

    Scenario: Funktionen kräver att klasserna redan är lottade
      Givet en vald klass där ingen har starttid
      När efteranmälda ska lottas in
      Så fungerar inte funktionen
