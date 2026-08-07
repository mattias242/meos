# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5403
# Kod: oRunner (namn), oFreeImport.cpp (fri import), iof30interface.cpp,
#      csvparser.cpp (strukturerad import)
Egenskap: Anmäla deltagare
  Som sekretariat
  vill jag kunna få in deltagare på flera sätt — filimport, fri text,
  tabellklistring, Eventor, direktanmälan eller manuellt —
  så att jag kan använda den väg som passar arrangemangets underlag.

  Regel: Namn kan matas in i två former

    Scenario: Namn på formen "Förnamn Efternamn"
      När en deltagare anmäls med namnet "Alice Burman Björk"
      Så tolkas "Alice" som förnamn
      Och "Burman Björk" som efternamn

    Scenario: Kommaseparerat namn krävs för mer än ett förnamn
      När en deltagare anmäls med namnet "Burman Björk, Alice Beda"
      Så tolkas "Alice Beda" som förnamn
      Och "Burman Björk" som efternamn

    Scenario: Listor visar namn som "Förnamn Efternamn" oavsett inmatningsform
      Givet en deltagare inmatad som "Burman Björk, Alice"
      När en lista visas
      Så visas namnet som "Alice Burman Björk"

    Scenario: NameMode 1 visar och matar in namn som "Efternamn, Förnamn"
      Givet att "NameMode" är satt till 1 under lokala inställningar
      När en lista visas
      Så visas namnet som "Burman Björk, Alice"

    Scenario: Strukturerad import använder internt den kommaseparerade formen
      Givet en importfil som separerar för- och efternamn
      När deltagarna importeras
      Så lagras namnen internt på kommaseparerad form

  Regel: Strukturerad import är det rekommenderade sättet

    Scenario: Anmälningar importeras från IOF-XML 3.0
      Givet en anmälningsfil i formatet IOF-XML 3.0
      När "Anmälningar" importeras under "Importera tävlingsdata" på sidan "Tävling"
      Så anmäls deltagarna i filen

    Scenario: Klasser och klubbar som saknas skapas automatiskt
      Givet en anmälningsfil med en klass och en klubb som inte finns i tävlingen
      När anmälningarna importeras
      Så skapas klassen
      Och klubben skapas med uppgifter från klubbregistret

    Scenario: Äldre format stöds också
      Givet en anmälningsfil i formatet OE2003 CSV
      När anmälningarna importeras
      Så anmäls deltagarna i filen

    Scenario: Rankingdata kan importeras
      Givet en fil med rankingdata
      När rankingdata importeras
      Så får deltagarna sina rankingvärden

  Regel: Fri anmälningsimport tolkar oformaterad text

    Scenario: Kommaseparerade rader med namn, klubb, klass och bricka tolkas
      Givet den fria anmälningsimportens inmatningsruta
      När följande text matas in:
        """
        Johan Svensson, OK Linné, H21, 800605
        Johanna Andersson, IF Thor, D70, 390101
        Sven Johansson, IF Liten, H10, 37371
        """
      Och inmatningen granskas
      Så tolkas tre deltagare med namn, klubb, klass och bricknummer

    Scenario: Klubb angiven på egen rad gäller de följande deltagarna
      Givet den fria anmälningsimportens inmatningsruta
      När följande text matas in:
        """
        OK Linné
        Johan Svensson, Lång, 800605
        Sven Johansson, Kort, 37371
        Johanna Andersson, Mellan, 390101
        """
      Och inmatningen granskas
      Så tolkas tre deltagare med klubben "OK Linné"

    Scenario: Anmälningarna sparas först efter granskning
      Givet en granskad fri anmälningsimport
      När "Spara anmälningar" väljs
      Så läggs deltagarna in i tävlingen

    Scenario: Lag- och patrullklasser måste finnas i förväg vid fri import
      Givet en stafettklass som inte är upplagd i tävlingen
      När deltagare till klassen matas in i den fria anmälningsimporten
      Så kan MeOS inte avgöra hur många deltagare varje lag har

    Scenario: Löpardatabasen kompletterar den fria importen
      Givet en installerad klubb- och löpardatabas
      När en deltagare importeras med fri anmälningsimport
      Så matchas deltagaren och klubben mot databasen
      Och anmälan kompletteras med nationellt löpar-id och klubbens kontaktuppgifter

  Regel: Manuell inmatning kräver att klasser finns

    Scenario: Ny deltagare läggs in på sidan Deltagare
      Givet en tävling med minst en klass
      När "Ny deltagare" väljs på sidan "Deltagare" och uppgifterna fylls i
      Så anmäls deltagaren

    Scenario: Sidan Deltagare är inte tillgänglig utan klasser
      Givet en tävling utan klasser
      När sidan "Deltagare" söks upp
      Så är sidan inte tillgänglig

  Regel: Anmälningar kan klistras in från kalkylprogram

    Scenario: Tabelldata klistras in i tabelläget
      Givet en tävling med klasser upplagda
      När anmälningsdata klistras in i tabelläget på sidan "Deltagare"
      Så anmäls deltagarna i tabellen

  Regel: Direktanmälan är ett förenklat anmälningsformulär

    Scenario: Direktanmälan kräver att klassen tillåter det
      Givet en klass där "Tillåt direktanmälan" inte är markerad
      När anmälningsläget på sidan "SportIdent" används
      Så går det inte att anmäla till klassen

    Scenario: SI-enhet läser in bricknummer vid direktanmälan
      Givet anmälningsläget med en ansluten SI-enhet
      När en bricka placeras i enheten
      Så fylls bricknumret i automatiskt

    Scenario: Löparregistret identifierar deltagaren vid direktanmälan
      Givet anmälningsläget med installerat löparregister
      När ett bricknummer som finns i registret matas in
      Så föreslås deltagarens namn och klubb

    Scenario: Varning när kartorna i en klass tagit slut
      Givet en klass med 2 tillgängliga startplatser och 2 direktanmälda deltagare
      När ytterligare en deltagare försöker anmälas till klassen
      Så varnas operatören om att platserna tagit slut

    Scenario: Startbevis skrivs ut för direktanmäld deltagare
      Givet att kryssrutan "Startbevis" är markerad
      När en deltagare direktanmäls
      Så skrivs ett startbevis ut
      Och de egna textraderna finns med på beviset

    Scenario: Låst funktion skyddar mot att anmälningsläget ändras av misstag
      Givet anmälningsläget på sidan "SportIdent"
      När "Lås funktion" väljs
      Så kan funktionen inte ändras förrän den låsts upp

  Regel: Deltagare kan anmälas direkt ur löpardatabasen

    Scenario: Person i registret anmäls till en klass
      Givet löpardatabasens persontabell
      När "+" i kolumnen "Anmäl" dubbelklickas och en klass väljs
      Och "Anmäl" väljs
      Så anmäls personen till klassen

  Regel: Startlista med starttider kan importeras

    Scenario: Startlista i IOF-XML 3.0 importeras
      Givet en startlistefil i formatet IOF-XML 3.0
      När startlistan importeras
      Så anmäls deltagarna med sina starttider
