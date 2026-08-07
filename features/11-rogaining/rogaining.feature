# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5482
# Kod: oCourse (rogaininginställningar), oControl (ControlStatus::StatusRogaining,
#      rogainingpoäng), MeOSFeatures::Rogaining
Egenskap: Rogaining
  Som arrangör av poängorientering
  vill jag kunna köra tävlingar med tidsgräns eller poänggräns
  så att kontroller kan tas i valfri ordning och räknas som poäng.

  # Funktionsscenarierna för Rogaining och Poängavdrag finns i
  # rogaining-funktioner.feature.

  Regel: Funktionen måste aktiveras

    Scenario: Rogaining kräver aktiverad funktion
      Givet en tävling där funktionen "Rogaining" är avaktiverad
      När rogaininginställningar efterfrågas
      Så är de inte tillgängliga

  Regel: Tidsgräns — flest poäng vinner

    Scenario: Maxtid ger poängavdrag vid övertid
      Givet en bana med rogainingtypen "Tidsgräns" och maxtid 60 minuter
      När en deltagare går i mål efter 62:30
      Så ges poängavdrag för övertiden

    Scenario: Avdrag per påbörjad minut
      Givet en bana med poängavdrag per påbörjad minut
      När en deltagare är 2:30 över maxtiden
      Så ges avdrag för tre påbörjade minuter

    Scenario: Flest poäng vinner
      Givet två deltagare med 90 respektive 80 poäng
      När resultatet beräknas
      Så vinner deltagaren med 90 poäng

  Regel: Poänggräns — kortast tid vinner

    Scenario: Poänggränsen måste uppnås för godkänt
      Givet en bana med rogainingtypen "Poänggräns" och gränsen 60 poäng
      När en deltagare uppnår 50 poäng
      Så godkänns inte deltagaren

    Scenario: Kortast tid vinner bland godkända
      Givet två godkända deltagare med tiderna 55:00 och 58:00
      När resultatet beräknas
      Så vinner deltagaren med 55:00

  Regel: Rogainingtypen ställs in per bana

    Scenario: Typen sätts på sidan Banor
      Givet en bana
      När rogainingtypen ställs in på sidan "Banor"
      Så gäller den för banan

    Scenario: Banan måste lista alla räknebara kontroller
      Givet en rogainingbana
      När banan definieras
      Så måste alla kontroller som kan räknas med finnas i listan

    Scenario: Ordningen på banan spelar ingen roll
      Givet en rogainingbana
      När en deltagare besöker kontrollerna i valfri ordning
      Så räknas de ändå

  Regel: Vanlig orientering kan blandas med rogainingmoment

    Scenario: Bo med rogainingkontroller mitt på banan
      Givet en bana med ett bo av rogainingkontroller och en poänggräns
      När en deltagare uppnått poänggränsen i boet
      Så kan deltagaren fortsätta banan

  Regel: Kontrollen märks som rogainingkontroll

    Scenario: Status och poäng sätts på kontrollen
      Givet sidan "Kontroller"
      När en kontrolls status sätts till "Rogaining" och poängen anges
      Så ger kontrollen de poängen

    Scenario: Samma fysiska kontroll kan ha olika roller
      Givet flera kontroller med samma SI-kod men olika status eller poäng
      När banorna refererar till respektive kontrolls id-nummer
      Så spelar kontrollen olika roller i olika banor
