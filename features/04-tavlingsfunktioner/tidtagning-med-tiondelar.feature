# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5517
# Kod: timeconstants.hpp (timeUnitsPerSecond = 10), formatTime med SubSecond,
#      convertAbsoluteTimeHMS i meos_util.cpp
Egenskap: Tidtagning med tiondelar
  Som arrangör av en tävling där tiondelar avgör
  vill jag mäta och redovisa tider med tiondels sekunder
  så att resultatet blir rättvist i täta lopp.

  # MeOS lagrar alltid tider i tiondels sekunder internt
  # (timeUnitsPerSecond = 10); inställningen styr vad som lagras och visas.

  Regel: Stöd för tiondelar aktiveras på tävlingen

    Scenario: Tiondelar lagras från radiostämplingar
      Givet att "Aktivera stöd för tiondels sekunder" är markerat på sidan "Tävling"
      När en radiostämpling tas emot
      Så lagras tiden med tiondels sekunder

  Regel: SI-enheterna måste programmeras för högre precision

    Scenario: Start- och målenheter programmeras med Sprint 4ms
      Givet start- och målenheter som ska mäta tiondelar
      När enheterna programmeras med "Sprint 4ms" aktiverat
      Så lagras tiden med högre precision i brickan

    Scenario: SIAC och radiobaserad mållinje rekommenderas vid viktiga tävlingar
      Givet en tävling där tiondelar avgör
      När rättvis tidtagning eftersträvas
      Så bör SIAC och radiobaserad mållinje användas

  Regel: Tider med tiondelar har formatet (HH:)MM:SS.t

    Scenario: Tid utan timmar
      Givet en tid på 17 minuter, 23 sekunder och 2 tiondelar
      När tiden visas
      Så skrivs den som "17:23.2"

    Scenario: Tiondelar kan matas in även utan aktiverat stöd
      Givet en tävling utan aktiverat stöd för tiondels sekunder
      När en tid med tiondelar matas in manuellt
      Så accepteras tiden
