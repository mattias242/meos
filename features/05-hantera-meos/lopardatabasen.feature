# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5425
# Kod: RunnerDB.cpp, MeOSFeatures::RunnerDb
Egenskap: Löpardatabasen
  Som sekretariat
  vill jag ha ett register över löpare och klubbar
  så att anmälningar kan kompletteras automatiskt och brickor kännas igen.

  Regel: Funktionen måste vara aktiverad

    Scenario: Löpardatabasen kräver aktiverad funktion
      Givet en tävling där "Klubb- och löpardatabas" är avaktiverad
      När löpardatabasen efterfrågas
      Så är den inte tillgänglig

  Regel: Databasen består av personer och klubbar

    Scenario: Persontabellen visas
      Givet löpardatabasen på sidan "Tävling"
      När "Personer" väljs
      Så visas tabellen med registrets personer

    Scenario: Klubbtabellen visas
      Givet löpardatabasen
      När "Klubbar" väljs
      Så visas tabellen med registrets klubbar

    Scenario: Stort register kan ta tid att visa första gången
      Givet ett personregister med över 60 000 personer
      När persontabellen visas första gången på en långsam dator
      Så kan det ta några sekunder

    Scenario: Anmälan görs direkt ur persontabellen
      Givet persontabellen
      När "+" dubbelklickas för en person
      Så anmäls personen till den aktuella tävlingen

  Regel: Databasen importeras från fil

    Scenario: Klubbfil och löparfil anges
      Givet funktionen "Importera" i löpardatabasen
      När en fil med klubbar och en fil med löpare anges
      Så importeras båda

    Scenario: Databasen kan tömmas eller uppdateras vid import
      Givet funktionen "Importera"
      När valet att tömma databasen först görs
      Så nollställs databasen innan importen

    Scenario: Byte av databaskälla kräver tömning
      Givet en databas från svenska Eventor
      När databasen ska bytas till norska Eventor
      Så bör databasen tömmas först

    Scenario: Registret måste vara i IOF-XML
      Givet en registerfil
      När den importeras
      Så måste den vara i formatet IOF-XML version 2.0.4 eller 3.0

  Regel: Databasen kompletteras av tävlingarna

    Scenario: MeOS lär sig vem som springer med vilken bricka
      Givet en genomförd tävling i MeOS
      När löpardatabasen används därefter
      Så har den kompletterats med data från tävlingen

  Regel: Databasen kan uppdateras från Eventor

    Scenario: Senaste registret hämtas automatiskt
      Givet en konfigurerad Eventorkoppling och internetanslutning
      När "Uppdatera" väljs i löpardatabasen
      Så hämtas det senaste registret

  Regel: Databas och inställningar kan flyttas mellan datorer

    Scenario: Export till en mapp
      Givet löpardatabasen
      När "Exportera" väljs och en destinationsmapp anges
      Så sparas löpardatabasen och alla MeOS inställningar i mappen

    Scenario: Installation på en annan dator
      Givet en exporterad mapp och en dator utan öppna tävlingar
      När "Inställningar" väljs, mappen letas upp och "Installera" väljs
      Så installeras databasen och inställningarna
      Och MeOS kan behöva startas om

    Scenario: Personer och klubbar exporteras var för sig
      Givet löpardatabasen
      När "Exportera personer" respektive "Exportera klubbar" väljs
      Så sparas databasen i formatet IOF-XML 3.0

    Scenario: Databasen töms
      Givet en fylld löpardatabas
      När "Töm databasen" väljs
      Så raderas samtliga klubbar och personer

  Regel: I nätverk delas databasen mellan klienterna

    Scenario: Databasen överförs via nätverket
      Givet en tävling som körs i nätverk
      När en klient ansluter
      Så får klienten samma löpardatabas

    Scenario: Uppdaterad serverdatabas kräver att klienterna öppnar om
      Givet en löpardatabas som importerats medan servern var ansluten
      När andra datorer ska använda den uppdaterade databasen
      Så måste de stänga tävlingen och öppna den igen
