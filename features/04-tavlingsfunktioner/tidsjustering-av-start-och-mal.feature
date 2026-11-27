# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5516
# Kod: oControl (tidsjustering per enhet), TabControl.cpp
Egenskap: Tidsjustering av start och mål
  Som sekretariat
  vill jag kunna justera tiderna från en enskild start- eller målenhet
  så att en felprogrammerad enhet inte förstör resultatet.

  Regel: Enheten identifieras genom sin programmerade kod

    Scenario: Enheter måste ha olika koder för att kunna skiljas åt
      Givet flera start- och målenheter
      När enheterna programmeras
      Så måste de ges olika koder

    Scenario: Använd enhet dyker upp på sidan Kontroller
      Givet en start- eller målenhet som använts i tävlingen
      När en bricka eller radiostämpling från enheten inkommer
      Så visas enheten på sidan "Kontroller"

  Regel: Justeringen gäller alla tider från enheten

    Scenario: Justering matas in på formatet +/-MM:SS
      Givet en målenhet vars klocka går 45 sekunder fel
      När tidsjusteringen "-00:45" matas in för enheten
      Så justeras alla nuvarande tider från enheten

    Scenario: Justeringen gäller även framtida tider
      Givet en enhet med angiven tidsjustering
      När en ny stämpling från enheten inkommer
      Så justeras även den

    Scenario: Justeringen kan ändras eller tas bort
      Givet en enhet med angiven tidsjustering
      När justeringen ändras eller tas bort
      Så räknas tiderna om

  Regel: Funktionen kan inte kombineras med tiondels sekunder

    Scenario: Enhetens kod sparas inte i brickan vid tiondelsstöd
      Givet enheter programmerade med stöd för tiondels sekunder
      När brickan läses av
      Så saknas enhetens kod i brickan
      Och tidsjustering per enhet kan inte användas
