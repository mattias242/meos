# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5518
# Kod: TabClass.cpp (start på signal), oClass (reptid, omstartstid)
Egenskap: Starta klass på signal
  Som startchef
  vill jag sätta den gemensamma starttiden i det ögonblick starten går
  så att den registrerade tiden blir den verkliga.

  Regel: Funktionen kräver avancerade funktioner på sidan Klasser

    Scenario: Start på signal visas när avancerade funktioner är på
      Givet sidan "Klasser"
      När "Visa avancerade funktioner" aktiveras
      Så är funktionen "Start på signal" tillgänglig

  Regel: Tiden sätts i samma stund som starten går

    Scenario: Gemensam starttid sätts för valda klasser
      Givet funktionen "Start på signal" med tre klasser valda
      När "Sätt tiden när starten går" klickas 11:03:17
      Så får de tre klasserna gemensam starttid 11:03:17

    Scenario: Datorns klocka måste gå rätt
      Givet funktionen "Start på signal"
      När tiden ska sättas
      Så måste datorns klocka kontrolleras först

  Regel: Reptid och omstartstid kan sättas på samma sätt

    Scenario: Reptid sätts på signal
      Givet en stafettklass
      När reptiden sätts med funktionen "Start på signal"
      Så får klassen den satta reptiden för samtliga sträckor

    Scenario: Omstartstid sätts på signal
      Givet en stafettklass
      När omstartstiden sätts med funktionen "Start på signal"
      Så får klassen den satta omstartstiden för samtliga sträckor
