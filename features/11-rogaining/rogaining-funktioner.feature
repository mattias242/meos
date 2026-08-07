# language: sv
Egenskap: Rogaining
  Poängorientering: kontroller ger poäng, fritt vägval, maxtid med
  poängavdrag vid övertid.

  Regel: Rogaining (RO)

    Scenario: Poäng summeras för besökta kontroller
      Givet en rogaining-klass med maxtid 60 minuter
      Och kontroller värda 10, 20 och 30 poäng
      När en löpare stämplar alla tre inom maxtiden
      Så är löparens poäng 60

    Scenario: Samma kontroll ger bara poäng en gång
      Givet en kontroll värd 20 poäng
      När en löpare stämplar kontrollen två gånger
      Så räknas kontrollen bara en gång

    Scenario: Övertid ger poängavdrag
      Givet en rogaining-klass med maxtid 60 minuter och avdrag per påbörjad minut
      När en löpare med 100 poäng går i mål efter 62:30
      Så reduceras poängen med 3 minuters avdrag

    Scenario: Placering efter poäng, sedan tid
      Givet två löpare med 80 poäng och tiderna 55:00 respektive 58:00
      Och en löpare med 90 poäng och tiden 59:00
      När resultatet beräknas
      Så vinner löparen med 90 poäng
      Och av 80-poängarna placeras den med kortast tid före

  Regel: Poängavdrag (PA) — manuella justeringar
    # Kräver Rogaining

    Scenario: Manuellt poängavdrag påverkar slutpoängen
      Givet en löpare med 80 poäng
      När ett manuellt avdrag på 10 poäng registreras
      Så är löparens slutpoäng 70
