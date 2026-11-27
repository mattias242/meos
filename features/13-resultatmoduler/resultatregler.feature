# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5499
# Kod: generalresult.cpp (statusregel, tidsregel, poängregel, placeringspoäng)
Egenskap: Resultatregler
  Som skribent av en resultatmodul
  vill jag veta vad var och en av modulens fyra rutiner ska returnera
  så att status, tid, poäng och placering blir rätt.

  Regel: Modulen har två uppsättningar regler

    Scenario: En uppsättning för individuella lopp och en för lag
      Givet en resultatmodul
      När reglerna redigeras
      Så finns en uppsättning för individuella lopp och en för lag

    Scenario: Tillgängliga symboler skiljer sig
      Givet de två regeluppsättningarna
      När symbolerna jämförs
      Så har deltagaren symbolen "Course"
      Och laget symbolen "RunnerTime"

    Scenario: Standardregler behöver inte skrivas om
      Givet en resultatmodul där standardreglerna fungerar
      När modulen skrivs
      Så behöver de rutinerna inte skrivas

    Scenario: Lagreglerna saknar funktion i individuella tävlingar
      Givet en tävling med endast individuella lopp
      När modulen används
      Så fyller lagreglerna ingen funktion

  Regel: Statusberäkningen returnerar en statuskod

    Scenario: Standardmetoden returnerar Status
      Givet statusregelns standardmetod
      När den körs
      Så returneras symbolen "Status"

    Scenario: Tillåtna returvärden
      Givet en egen statusregel
      När den returnerar ett värde
      Så måste det vara någon av StatusOK, StatusDNS, StatusMP, StatusDNF, StatusDQ, StatusMAX, StatusUnknown eller StatusNotCompeting

  Regel: Tidsberäkningen returnerar en tid i sekunder

    Scenario: Standardmetoden returnerar Time
      Givet tidsregelns standardmetod
      När den körs
      Så returneras symbolen "Time"

  Regel: Poängberäkningen returnerar ett tal

    Scenario: Poängens tolkning beror på placeringspoängen
      Givet en egen poängregel
      När den körs
      Så beror tolkningen av poängen helt på rutinen för placeringspoäng

  Regel: Placeringspoängen styr sortering och placering

    Scenario: Lägre poäng ger bättre placering
      Givet två deltagare med olika placeringspoäng
      När placeringen bestäms
      Så får den med lägre poäng bättre placering

    Scenario: Lika poäng ger samma placering
      Givet två deltagare med samma placeringspoäng
      När placeringen bestäms
      Så får de samma placering

    Scenario: Standardmetoden separerar godkända från övriga
      Givet placeringspoängens standardmetod
      När en deltagare är godkänd
      Så returneras Time
      Och annars 900000 + Status

    Scenario: Snabbaste godkända vinner
      Givet standardmetoden för placeringspoäng
      När placeringen bestäms
      Så får den snabbaste godkända lägst placeringspoäng
      Och ej godkända får högre poäng än alla godkända
