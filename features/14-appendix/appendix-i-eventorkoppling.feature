# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5480
# Kod: download.cpp, oImportExport.cpp, TabCompetition.cpp (Eventorkoppling)
Egenskap: Eventorkoppling
  Som arrangör
  vill jag hämta tävlingen och anmälningar direkt från Eventor
  så att sekretariatet slipper filhantering.

  Regel: Kopplingen kräver en API-nyckel

    Scenario: Nyckeln matas in första gången
      Givet en API-nyckel från klubbens Eventoradministratör
      När Eventor används första gången
      Så uppmanas användaren att mata in nyckeln

    Scenario: Nyckeln lagras krypterad
      Givet en inmatad API-nyckel
      När den sparas
      Så förvaras den i krypterad form som är besvärlig men inte omöjlig att knäcka

    Scenario: Nyckeln raderas genom ett tomt fält
      Givet en sparad API-nyckel
      När "Tävling från Eventor" och "Anslutningsinställningar" väljs och fältet lämnas blankt
      Så raderas nyckeln

  Regel: Tävlingen hämtas från Eventor

    Scenario: Tävling väljs ur listan
      Givet MeOS förstasida
      När "Tävling från Eventor" väljs och en tävling väljs ur listan
      Så förbereds importen

    Scenario: Löpardatabasen kan uppdateras samtidigt
      Givet importguiden
      När rutan för att uppdatera löpardatabasen är markerad
      Så uppdateras databasen som en del av importen

    Scenario: Starttid och startmetod anges
      Givet importguidens andra steg
      När första ordinarie starttid och startmetod väljs
      Så används de vid importen

    Scenario: Gemensam start eller lottad startlista skapas automatiskt
      Givet startmetoden "Gemensam start" eller "Lottad startlista"
      När importen genomförs
      Så skapar MeOS automatiskt en startlista

    Scenario: Annan startmetod lämnar startlistan till arrangören
      Givet en annan startmetod
      När importen genomförs
      Så skapas ingen startlista

    Scenario: Banfil kan anges vid importen
      Givet en banfil från OCAD eller Condes
      När den anges i importguiden
      Så läggs banorna in
      Och MeOS försöker para ihop rätt bana med rätt klass

    Scenario: Importen slutförs
      Givet en ifylld importguide
      När "Hämta data från Eventor" klickas
      Så slutförs importen

  Regel: Funktioner aktiveras utifrån tävlingstypen

    Scenario: Lämpliga funktioner slås på automatiskt
      Givet en importerad tävling från Eventor
      När importen är klar
      Så aktiveras lämpliga MeOS-funktioner utifrån tävlingstypen

    Scenario: Specialarrangemang kräver manuell aktivering
      Givet en flerdagarstävling, patrulltävling eller rogaining
      När tävlingen importerats
      Så kan funktioner behöva aktiveras manuellt under "MeOS funktioner"

  Regel: Löpande utbyte sker via knappen Eventorkoppling

    Scenario: Efteranmälningar hämtas
      Givet en tävling från Eventor
      När "Hämta efteranmälningar" väljs
      Så hämtas de nya anmälningarna

    Scenario: Löpardatabasen uppdateras
      Givet en tävling från Eventor
      När "Uppdatera löpardatabasen" väljs
      Så hämtas det senaste registret

    Scenario: Startlistan publiceras
      Givet en tävling från Eventor med lottad startlista
      När "Publicera startlistan" väljs
      Så laddas startlistan upp till Eventor

    Scenario: Resultaten publiceras
      Givet en genomförd tävling från Eventor
      När "Publicera resultaten" väljs
      Så laddas resultat och sträcktider upp till Eventor
      Och sträcktiderna läggs automatiskt in på WinSplits Online

  Regel: Filhantering är ett alternativ vid fel

    Scenario: Filer via webbgränssnittet ger bättre felmeddelanden
      Givet fel vid uppladdning eller hämtning från Eventor
      När arbetet i stället sker med IOF-XML-filer via Eventors webbgränssnitt
      Så kan felmeddelandena bli tydligare

  Regel: Föråldrad löpardatabas upptäcks automatiskt

    Scenario: MeOS erbjuder uppdatering vid ny tävling
      Givet en aktiv Eventorkoppling och en föråldrad löpardatabas
      När en ny tävling skapas
      Så erbjuder MeOS att uppdatera databasen automatiskt

    Scenario: Databasen uppdateras manuellt
      Givet MeOS förstasida
      När "Tävling från Eventor" väljs och endast databasuppdatering kryssas för
      Så uppdateras löpardatabasen

  Regel: Eventorservern kan väljas

    Scenario: Servern ställs in utan öppen tävling
      Givet MeOS utan öppen tävling
      När sidan "Inställningar" öppnas
      Så går det att ställa in vilken Eventorserver MeOS arbetar mot
