# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5519
# Kod: TabSI.cpp (startbokning), oEventDraw.cpp (tilldelningsregler)
Egenskap: Boka starttid
  Som arrangör som vill låta deltagarna välja starttid
  vill jag ändå styra hur många som startar samtidigt och hur nära varandra
  så att startfältet fungerar trots fri starttid.

  Regel: Klasserna som får boka starttid väljs

    Scenario: Klasser med bokning förvalda
      Givet klasser där "Boka starttid" är valt på sidan "Klasser"
      När funktionen "Boka starttid" öppnas på sidan "SportIdent"
      Så är dessa klasser förvalda

  Regel: Startperiod och intervall ställs in

    Scenario: Grundinställningarna anges
      Givet funktionen "Boka starttid"
      När första starttid, sista starttid och startintervall matas in
      Så tilldelas starttider inom den angivna perioden

    Scenario: Minsta tid till start skjuter fram första möjliga tid
      Givet en minsta tid till start på 15 minuter
      När en deltagare bokar 10:00:00
      Så är den tidigaste möjliga starttiden 10:15:00

  Regel: Deltagaren kan välja bland förslag eller tilldelas första möjliga

    Scenario: Deltagaren väljer bland flera förslag
      Givet att "Välj från flera förslag" är aktivt
      När en deltagare bokar starttid
      Så presenteras en lista med möjliga starttider

    Scenario: Upptagen tid ersätts av en närliggande
      Givet en presenterad lista med starttider
      När den valda tiden hunnit bli upptagen
      Så tilldelas deltagaren en annan tid i närheten

    Scenario: Avstånd mellan förslag styr listans täthet
      Givet att avstånd mellan förslag är satt till 10 minuter
      När förslagen presenteras
      Så ligger förslagen 10 minuter isär

    Scenario: Förslagen glesas ut längre fram i tiden
      Givet en lista med föreslagna starttider
      När förslagen ligger långt fram i tiden
      Så glesas de ut för att inte överväldiga deltagaren

    Scenario: Första möjliga tid tilldelas utan val
      Givet att "Välj från flera förslag" inte är aktivt
      När en deltagare bokar starttid
      Så tilldelas första möjliga starttid med hänsyn till minsta tid till start

  Regel: Tilldelningsregler begränsar vilka som får starta nära varandra

    Scenario: Regler om samma bana i olika klasser
      Givet tilldelningsreglerna för startbokning
      När regeln om samma bana i olika klasser sätts
      Så tillåts eller förhindras samtidig start för dessa deltagare

    Scenario: Striktare regler gör det svårare att hitta en tid
      Givet stora klasser som delar bana
      När mycket strikta tilldelningsregler används
      Så kan det bli svårt att hitta en ledig starttid

  Regel: Max antal parallellt startande begränsar startplatsen

    Scenario: Gränsen räknar även lottade starttider
      Givet ett max antal parallellt startande på 4 per startplats
      Och 4 deltagare med lottade starttider på 10:20:00
      När en deltagare försöker boka 10:20:00
      Så är tiden full

    Scenario: Deltagare med fri starttid räknas inte in
      Givet deltagare med fri starttid
      När gränsen för parallellt startande beräknas
      Så räknas dessa deltagare inte in

  Regel: Bokningsläget aktiveras och drivs av stämpling

    Scenario: Bokningssidan uppmanar deltagaren att stämpla
      Givet ifyllda bokningsinställningar
      När "Aktivera" väljs
      Så visas en sida som uppmanar deltagaren att stämpla

    Scenario: Saknad SI-enhet påpekas
      Givet bokningsläget utan aktiverad SI-enhet
      När läget aktiveras
      Så uppmanas operatören att aktivera en SI-enhet

    Scenario: Manuellt läge tilldelar en ledig tid nära den önskade
      Givet bokningsläget i manuellt läge
      När en deltagare väljs och önskad starttid 10:30:00 skrivs in
      Så tilldelas en ledig tid i närheten av 10:30:00

  Regel: Startbevis och liveresultat

    Scenario: Startbevis skrivs ut med den tilldelade tiden
      Givet att "Startbevis" och skrivarinställningar är valda
      När en deltagare bokat starttid
      Så skrivs ett startbevis ut med den tilldelade tiden

    Scenario: Tilldelad tid syns i liveresultat
      Givet en aktiv tjänst för liveresultat
      När en starttid tilldelas
      Så syns starttiden i tjänsten

  Regel: Kioskläge låter deltagarna boka själva

    Scenario: Endast startbokning är tillgänglig i kioskläge
      Givet gjorda bokningsinställningar
      När "Aktivera kioskläge" väljs
      Så är endast startbokningen tillgänglig

    Scenario: Kioskläget lämnas bara genom omstart
      Givet MeOS i kioskläge
      När läget ska lämnas
      Så måste MeOS stängas och startas om

    Scenario: Pekskärm låter deltagaren peka ut sin tid
      Givet en kiosk med pekskärm
      När deltagaren stämplat
      Så kan önskad starttid väljas genom att peka på skärmen

  Regel: Simulering testar om startdjupet räcker

    Scenario: Alla deltagare begär tid vid slumpmässiga tidpunkter
      Givet gjorda bokningsinställningar
      När "Simulering" väljs
      Så begär alla deltagare starttid vid slumpmässiga tidpunkter under startperioden

    Scenario: Simuleringen visar utfallet per klass
      Givet en genomförd simulering
      När resultatet visas
      Så framgår om alla fick en starttid inom perioden
      Och genomsnittlig väntetid jämfört med önskad tid per klass

    Scenario: Simuleringen påverkar inte tävlingen
      Givet en tävling med lottade starttider
      När en simulering körs
      Så är tävlingens data oförändrade

    Scenario: Simuleringens kopia kan sparas för analys
      Givet en genomförd simulering
      När en kopia av tävlingen sparas
      Så går startlistan och minutstartlistan att analysera vidare
