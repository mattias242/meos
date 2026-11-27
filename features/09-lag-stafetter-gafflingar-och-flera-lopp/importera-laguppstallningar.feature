# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5477
# Kod: csvparser.cpp (RAIDDATA, OS-format), iof30interface.cpp, oTeam
Egenskap: Importera laguppställningar
  Som sekretariat
  vill jag importera laguppställningar från fil
  så att lagen inte behöver matas in för hand.

  Regel: Flera format stöds

    Scenario: IOF-XML från Eventor importeras
      Givet en laguppställningsfil i IOF-XML
      När "Importera laguppställningar" väljs på sidan "Lag"
      Så importeras lagen

    Scenario: Semikolonseparerad OS-fil importeras
      Givet en laguppställningsfil i OS-format
      När den importeras
      Så importeras lagen

  Regel: Det enkla textformatet har en rad per lag och deltagare

    Scenario: Lagrad följs av deltagarrader
      Givet en semikolonseparerad fil
      När den läses
      Så anger första raden klass, lagnamn och eventuell klubb
      Och därefter följer en rad per deltagare i laget

    Scenario: Deltagarraden kan innehålla fem fält
      Givet en deltagarrad i importfilen
      När den tolkas
      Så kan namn, bricknummer, klubb, bana och deltagarklass anges

    Scenario: Bricknummer, klubb och bana är valfria
      Givet en deltagarrad med endast namn
      När den tolkas
      Så accepteras raden

    Scenario: Deltagarklass gäller bara sträcktypen gruppera
      Givet en deltagarrad med angiven deltagarklass
      När sträcktypen inte är "Gruppera"
      Så är deltagarens klass alltid samma som lagets klass

    Scenario: Klassen måste finnas i tävlingen
      Givet en importfil med en klass som inte finns
      När filen importeras
      Så kan lagen inte skapas

    Scenario: En rad per sträcka krävs
      Givet en lagklass med tre sträckor
      När ett lag importeras
      Så ska filen innehålla tre deltagarrader för laget

    Scenario: Blankrader anger vakanser
      Givet ett lag med en obesatt sträcka
      När filen skrivs
      Så används en blankrad för vakansen

    Scenario: Exempel på giltig fil
      Givet en importfil med innehållet
        """
        Finalklass;OK Linné 1;OK Linné
        Rikard Karlsson;12323;OK Linné;vit-1;H10
        Sven Karlsson;32323;OK Linné;gul-2;H12
        Lisa Stark;42433;Rasbo IK;violett-1;D16
        """
      När filen importeras
      Så skapas laget "OK Linné 1" i "Finalklass" med tre deltagare

  Regel: Befintliga deltagare kan återanvändas

    Scenario: Redan anmälda matchas och flyttas in i laget
      Givet att "Använd befintliga deltagare" är valt
      När en deltagare i filen matchar en redan anmäld
      Så flyttas den anmälde in i laget

    Scenario: Omatchade deltagare ignoreras
      Givet att "Använd befintliga deltagare" är valt
      När en deltagare i filen inte matchas
      Så ignoreras deltagaren

  Regel: Patrullimport använder RAIDDATA-formatet

    Scenario: Filens första rad ska vara RAIDDATA
      Givet en semikolonseparerad patrullfil
      När den tolkas
      Så ska första raden vara "RAIDDATA"

    Scenario: Patrullraden har nio fält
      Givet en patrullrad
      När den tolkas
      Så anges startnummer, lagnamn, stad, anmälningsdatum, klassnamn, klassid, deltagare 1, deltagare 2 och sorteringsindex

    Scenario: Importen görs från sidan Tävling
      Givet en RAIDDATA-fil
      När "Anmälningar" väljs på sidan "Tävling"
      Så importeras patrullerna

    Scenario: Klasserna skapas automatiskt
      Givet en RAIDDATA-fil med klasser som inte finns i tävlingen
      När filen importeras
      Så skapas klasserna
