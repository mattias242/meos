# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5491
# Kod: metalist.cpp (listtyper, sorteringsordningar, filter), oListInfo.cpp
Egenskap: Egenskaper för listan
  Som listkonstruktör
  vill jag ställa in listtyp, resultatberäkning, sortering och filtrering
  så att listan hämtar och ordnar rätt data.

  Regel: Listnamnet är intern referens

    Scenario: Namnet syns inte i listan
      Givet en lista med listnamnet "Medaljörer"
      När listan visas
      Så syns namnet inte i själva listan
      Men används för att referera till listan från MeOS

  Regel: Listtypen bestämmer vad varje rad refererar till

    Scenario: Tillgängliga listtyper
      Givet listans egenskaper
      När listtypen väljs
      Så finns Bana, Deltagare, Deltagare (klasser gemensamt), Deltagare (per stafettsträcka), Klubb (deltagare), Klubb (lag), Kontroll, Lag och Lag (klasser gemensamt)

    Scenario: Klubbtyperna grupperar listan klubbvis
      Givet listtypen "Klubb (deltagare)"
      När listan skapas
      Så grupperas den klubbvis
      Och underrubriken bör vara definierad per klubb

    Scenario: Lista över klubbar byggs med tom huvudlista
      Givet listtypen "Klubb (deltagare)"
      När huvudlistan lämnas tom och underrubriken används som lista
      Så blir resultatet en lista över klubbar

    Scenario: Klasser gemensamt slår ihop klasser i uträkningen
      Givet listtypen "Deltagare (klasser gemensamt)" och en resultatmodul
      När resultatet räknas ut
      Så slås deltagarnas klasser samman
      Och de klasser som valts för listan ingår i uträkningen

    Scenario: Gemensam lista för Herrar och Damer
      Givet en resultatmodul med standardregler
      När en lista av typen "Deltagare (klasser gemensamt)" skapas med modulen
      Och listan sparas och klasserna väljs under "Alla listor"
      Så visas en gemensam resultatlista för klasserna

    Scenario: Per stafettsträcka behandlar varje sträcka som en klass
      Givet listtypen "Deltagare (per stafettsträcka)"
      När resultatet räknas ut
      Så hanteras varje sträcka som en egen klass med en egen segrare

    Scenario: Bana och Kontroll ger sammanställningar
      Givet listtypen "Bana" eller "Kontroll"
      När listan skapas
      Så löper den över banor respektive kontroller

  Regel: Resultatberäkningen kan bytas ut

    Scenario: Standard väljer beräkning efter innehåll och klass
      Givet resultatberäkningen "Standard"
      När resultatet räknas ut
      Så används individuella resultat, lagresultat, totalresultat eller rogainingresultat beroende på listans innehåll och klassens definition

    Scenario: Egen resultatmodul kan väljas
      Givet listans egenskaper
      När en egen resultatmodul väljs
      Så används den för att räkna ut resultaten

  Regel: Global sorteringsordning styr radernas ordning

    Scenario: Sorteringen bör passa underrubriken
      Givet en sortering som börjar med klass
      När underrubriken definieras
      Så är det lämpligt att den baseras på klasstyper som klassnamn eller banlängd för klass

    Scenario: Klass, starttid, namn för startlistor
      Givet en startlista
      När sorteringen väljs
      Så används "Klass, starttid, namn"

    Scenario: Klass, resultat för resultatlistor
      Givet en resultatlista
      När sorteringen väljs
      Så används "Klass, resultat"
      Och "totalresultat" avser sammanställningen efter alla etapper

    Scenario: Starttid, namn för minutstartlistor
      Givet en minutstartlista
      När sorteringen väljs
      Så används "Starttid, namn"

    Scenario: Egen sortering följer resultatmodulen
      Givet en lista med egen resultatmodul
      När sorteringen "Egen sortering" väljs
      Så används den sortering modulen definierar

    Scenario: Omvänd målgångstid visar de senaste först
      Givet sorteringen "Omvänd målgångstid" och 30 visade rader
      När listan visas
      Så visas de senaste resultaten först
      Och listan lämpar sig för en skärm vid målet

    Scenario: Alla sorteringar gäller inte lag
      Givet en lista över lag
      När sorteringen väljs
      Så är inte alla sorteringsordningar tillämpliga

  Regel: Sekundär typ skapar en underlista

    Scenario: Underlista per rad
      Givet en lista med en sekundär typ
      När listan skapas
      Så skapas en underlista för varje rad, till exempel sträcktider eller lagets deltagare

  Regel: Tidtagning från och till kontroll kan stödjas

    Scenario: Valet blir möjligt när stödet är påslaget
      Givet en lista med "Stöd tidtagning till viss kontroll"
      När listan ska visas
      Så går det att välja resultat till exempelvis kontroll 50

    Scenario: Resultatmodulen måste ta hänsyn till valet
      Givet en lista med stöd för tidtagning från eller till kontroll
      När resultatet räknas ut
      Så måste den valda resultatmodulen ta hänsyn till detta

    Scenario: Inbyggda moduler som stöder valet
      Givet en lista med stöd för tidtagning vid kontroll
      När en resultatmodul väljs
      Så kan "Resultat vid kontroll" eller "Lag- och totalresultat vid kontroll" användas

  Regel: Filtrering väljer vilka rader som tas med

    Scenario: Med resultat tar med dem som läst ut brickan
      Givet filtret "Med resultat"
      När listan skapas
      Så tas de deltagare med som läst ut brickan

    Scenario: Preliminärt resultat tar även med målstämplade
      Givet filtret "Preliminärt resultat"
      När listan skapas
      Så tas även de med som målstämplat, under antagandet att de är godkända

    Scenario: Resultatmodulens data används vid filtrering
      Givet en lista med egen resultatmodul
      När filtret tillämpas
      Så används data från modulen

    Scenario: Endast vakanta listar lediga starttider
      Givet filtret "Endast vakanta"
      När listan skapas
      Så listas de vakanta starttiderna

    Scenario: Inte vakant utesluter vakanser
      Givet filtret "Inte vakant"
      När listan skapas
      Så saknas vakanserna

    Scenario: Filter på bricka
      Givet ett filter på deltagare med eller utan bricka eller med hyrd bricka
      När listan skapas
      Så tas endast dessa deltagare med

    Scenario: Har startat utesluter ej start
      Givet filtret "Har startat"
      När listan skapas
      Så utesluts deltagare med status "Ej start"

  Regel: Underfilter gäller sekundära listor av typen Deltagare

    Scenario: Samlade parallella sträckor grupperar sträckorna
      Givet underfiltret "Samlade parallella sträckor"
      När en parallell sträcka valts
      Så visas en rad för varje deltagare i den parallella gruppen

    Scenario: Parallella efterföljande sträckor utelämnar den första
      Givet underfiltret "Parallella efterföljande sträckor"
      När underlistan skapas
      Så listas inte gruppens första sträcka

  Regel: Typsnitt och radavstånd kan ställas in

    Scenario: Typsnitt per del av listan
      Givet listans egenskaper
      När typsnitt väljs för en del av listan
      Så används det för den delen

    Scenario: Storleken skalas relativt MeOS fördefinierade storlek
      Givet ett valt typsnitt
      När storleken skalas
      Så sker det relativt MeOS fördefinierade storlek

    Scenario: Typsnittet måste finnas på visande dator
      Givet en lista med ett valt typsnitt
      När listan visas på en dator utan typsnittet
      Så används något annat typsnitt

    Scenario: Typsnittet används även vid HTML-export
      Givet en lista med ett valt typsnitt
      När listan exporteras till HTML
      Så används typsnittet
      Och det bör finnas på de datorer som visar listan

    Scenario: Radavståndet kan justeras åt båda hållen
      Givet fältet "Avstånd"
      När ett positivt eller negativt värde anges
      Så justeras avståndet mellan rader
