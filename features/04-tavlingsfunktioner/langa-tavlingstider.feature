# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5515
# Kod: convertAbsoluteTimeHMS (daysZeroTime, "2D"-syntaxen) i meos_util.cpp
Egenskap: Långa tävlingstider
  Som arrangör av en tävling över flera dygn
  vill jag kunna ange och räkna tider längre än 24 timmar
  så att rogaining och långa arrangemang får rätt totaltid.

  Regel: Stöd för långa tider aktiveras på tävlingen

    Scenario: Stödet aktiveras när någon väntas vara ute länge
      Givet en tävling där deltagare väntas vara ute längre än 20 timmar
      När stöd för långa tävlingstider aktiveras på sidan "Tävling"
      Så kan tävlingstider över 24 timmar hanteras

  Regel: Brickan måste klara långa tider

    Scenario: SICard 6 och senare krävs
      Givet en tävling med långa tävlingstider
      När brickor väljs
      Så kan endast SICard 6 och senare användas

    Scenario: Äldre brickor duger om sista målgång ligger inom 12 timmar
      Givet en tävling med långa tävlingstider
      Och att sista målgång är inom 12 timmar från nolltiden
      När brickor väljs
      Så kan även äldre brickor användas

  Regel: Nolltiden blir midnatt på startdygnet

    Scenario: Datum anges i stället för nolltid
      Givet en tävling med långa tävlingstider
      När tävlingen konfigureras
      Så anges det datum då samtliga tävlande startar, inte någon nolltid

    Scenario: Nolltiden sätts till midnatt
      Givet en tävling med långa tävlingstider och startdygnet angivet
      När nolltiden bestäms
      Så är den midnatt i början av startdygnet

    Scenario: Senare sträckor får starta ett senare dygn
      Givet ett lag med flera sträckor i en tävling med långa tävlingstider
      När sträcka 2 växlas ut mer än ett dygn efter nolltiden
      Så är det tillåtet

  Regel: Tidpunkter på senare dygn skrivs med dygnsprefix

    Scenario: 2D anger två dygn efter nolltiden
      Givet en tävling med långa tävlingstider
      När tidpunkten "2D 14:00:00" matas in
      Så tolkas den som 62 timmar efter nolltiden

    Scenario: 0D kan uteslutas för nolltidens eget dygn
      Givet en tävling med långa tävlingstider
      När tidpunkten "14:00:00" matas in
      Så tolkas den som "0D 14:00:00"

  Regel: Tiden mellan två stämplingar får inte överstiga 22 timmar

    Scenario: Ingen övre gräns för total tävlingstid
      Givet en tävling med långa tävlingstider
      När den totala tävlingstiden växer
      Så finns ingen övre gräns

    Scenario: Överskriden 22-timmarsgräns kan ge för kort totaltid
      Givet två stämplingar med mer än 22 timmar emellan
      När totaltiden räknas ut
      Så garanterar inte MeOS att tiden blir rätt
      Och tiden kan bli ett eller flera dygn för kort

    Scenario: Felaktig tid kan justeras manuellt
      Givet en deltagare vars totaltid blivit ett dygn för kort
      När tiden justeras manuellt
      Så blir totaltiden rätt

  Regel: Datum för stämplingar gissas

    Scenario: Brickans stämplingar saknar datum
      Givet en avläst bricka i en tävling med långa tävlingstider
      När stämplingarnas datum ska bestämmas
      Så gissar MeOS datum utifrån 22-timmarsregeln

    Scenario: Radiotider daterats med den mottagande datorns klocka
      Givet en radiokontroll i en tävling med långa tävlingstider
      När en stämpling inkommer
      Så används den mottagande datorns klocka och mottagningstidpunkten

    Scenario: Fördröjd kommunikation kan ge fel datum
      Givet stora fördröjningar i kommunikationen eller stämplingar inlästa i efterhand
      När datum bestäms
      Så kan MeOS inte garantera att tiderna blir rätt
