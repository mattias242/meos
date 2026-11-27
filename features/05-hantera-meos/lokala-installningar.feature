# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5435
# Kod: prefseditor.cpp, meospref.xml; MeOSUtil::useHourFormat i meos_util.cpp
Egenskap: Lokala inställningar
  Som användare
  vill jag kunna ändra MeOS grundläggande inställningar på min dator
  så att programmet beter sig som miljön kräver.

  Regel: Inställningarna ändras när ingen tävling är öppen

    Scenario: Lokala inställningar är tillgängliga utan öppen tävling
      Givet MeOS utan öppen tävling
      När lokala inställningar öppnas
      Så går grundläggande egenskaper att ändra

  Regel: Egenskaperna styr säkerhetskopiering, nätverk och utseende

    Scenario: AutoSaveTimeOut styr säkerhetskopieringens intervall
      Givet lokala inställningar
      När "AutoSaveTimeOut" sätts i millisekunder
      Så säkerhetskopieras tävlingen med det intervallet

    Scenario: DirectPort styr porten för direktkommunikation
      Givet lokala inställningar
      När "DirectPort" sätts
      Så använder MeOS den porten för direktkommunikation

    Scenario: SynchronizationTimeOut styr hur ofta databasen frågas
      Givet lokala inställningar
      När "SynchronizationTimeOut" sätts
      Så frågar MeOS databasen efter uppdateringar med det intervallet

    Scenario: UseHourFormat styr tidsformatet
      Givet lokala inställningar
      När "UseHourFormat" slås på
      Så visas tider som HH:MM:SS

    Scenario: Avslagen UseHourFormat ger minutformat
      Givet lokala inställningar
      När "UseHourFormat" slås av
      Så visas tider som MMM:SS

    Scenario: TextFont styr typsnittet
      Givet lokala inställningar
      När "TextFont" sätts
      Så används det typsnittet i MeOS

    Scenario: MaximumSpeakerDelay begränsar speakerstödets fördröjning
      Givet lokala inställningar
      När "MaximumSpeakerDelay" sätts i millisekunder
      Så är det den övre gränsen för speakerstödets uppdateringsintervall

    Scenario: Uppdateringstakten sänks automatiskt vid långsamt nätverk
      Givet ett långsamt nätverk eller en långsam speakerdator
      När speakerstödet körs
      Så sänks uppdateringshastigheten automatiskt så att klienten inte blockeras

  Regel: Inställningarna lagras i meospref.xml

    Scenario: Vissa inställningar kräver omstart
      Givet en ändrad lokal inställning
      När ändringen ska få effekt
      Så kan MeOS behöva startas om

    Scenario: Standardvärden återställs genom att radera filen
      Givet filen meospref.xml i MeOS datakatalog
      När filen raderas medan MeOS inte körs
      Så återställs alla värden till standardvärdena
