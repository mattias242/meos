# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5437
# Kod: infoserver.cpp (direktanmälan via webbgränssnitt)
Egenskap: Direktanmälan via wifi
  Som arrangör
  vill jag låta deltagarna anmäla sig själva från telefonen
  så att kön till direktanmälan blir kortare.

  Regel: Tjänsten körs på informationsservern

    Scenario: Direktanmälan tillåts i informationsservern
      Givet automaten "Informationsserver" på sidan "Automater"
      När "Tillåt direktanmälan" markeras och automaten startas
      Så kan deltagare anmäla sig via webbtjänsten

    Scenario: Datorn som kör MeOS behöver inte själv använda wifi
      Givet ett nätverk med wifi-anslutning
      När MeOS-datorn är ansluten med kabel
      Så fungerar tjänsten ändå för deltagare på wifi

    Scenario: Lokalt nätverk räcker
      Givet ett lokalt nätverk utan internetuppkoppling
      När deltagarna ansluter till nätverket
      Så når de anmälningstjänsten

  Regel: Vem som får anmäla sig kan begränsas

    Scenario: Endast klubbar som redan finns i tävlingen
      Givet begränsningen till klubbar som redan finns i tävlingen
      När en deltagare från en ny klubb anmäler sig
      Så måste den anmälan hanteras manuellt

    Scenario: Endast klubbar i löpardatabasen
      Givet begränsningen till klubbar som finns i löpardatabasen
      När en deltagare från en okänd klubb anmäler sig
      Så nekas anmälan

    Scenario: Endast klasser öppna för direktanmälan
      Givet begränsningen till klasser med direktanmälan
      När en deltagare väljer klass
      Så visas endast dessa klasser

  Regel: Löparregistret förenklar inmatningen

    Scenario: Namnuppslagning och bricknummer fylls i
      Givet ett installerat klubb- och löparregister
      När en deltagare börjar skriva sitt namn
      Så föreslås namn och bricknummer

  Regel: Adressen kan förenklas och delas

    Scenario: Port 80 förenklar adressen
      Givet en dator utan andra webbtjänster
      När porten sätts till 80
      Så blir adressen http://datornamn/

    Scenario: Rotadressen mappas till anmälan
      Givet informationsservern
      När "Mappa rotadressen" sätts till direktanmälan
      Så leder rotadressen direkt till anmälningsformuläret

    Scenario: Länkarna visas när automaten startas
      Givet en konfigurerad informationsserver
      När "Starta automaten" väljs
      Så visas en eller flera klickbara länkar till webbtjänsten

    Scenario: Adressen får inte vara localhost för andra datorer
      Givet en startad tjänst
      När den ska nås från en annan dator
      Så måste en adress som inte är localhost användas

    Scenario: QR-kod leder deltagarna rätt
      Givet en fungerande anmälningsadress
      När en QR-kod skapas för adressen
      Så kan deltagarna scanna sig direkt till anmälan

  Regel: Nätverkets säkerhet bör övervägas

    Scenario: Deltagare bör koppla ner sig efter anmälan
      Givet deltagare anslutna till nätverket
      När anmälan är klar
      Så bör de uppmanas koppla ner sig för att frigöra resurser

    Scenario: MeOS säkerhet skyddar inte mot illasinnade
      Givet att deltagare släpps in på nätverket
      När säkerheten bedöms
      Så är MeOS säkerhet byggd för att hjälpa användare att göra rätt, inte för att hindra hackare

    Scenario: Två routrar isolerar gästnätet
      Givet en wifi-router kopplad till den interna routerns WAN-port
      När gäster ansluter till wifi
      Så når de inte det interna nätverket i övrigt
      Och portvidarebefordran krävs för att nå MeOS-datorn
