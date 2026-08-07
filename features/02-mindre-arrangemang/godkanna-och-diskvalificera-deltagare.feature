# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5412
# Kod: RunnerStatus i oRunner.h {StatusUnknown=0, StatusOK=1, StatusNoTiming=2,
#      StatusMP=3, StatusDNF=4, StatusDQ=5, StatusMAX=6, StatusOutOfCompetition=15,
#      StatusDNS=20, StatusCANCEL=21, StatusNotCompeting=99}
Egenskap: Godkänna och diskvalificera deltagare
  Som sekretariat
  vill jag kunna sätta status och justera tider på en deltagare
  så att felstämplingar och specialfall kan hanteras korrekt.

  Regel: Deltagarens stämplingar visas mot banmallen

    Scenario: Extra stämplingar visas för sig
      Givet en deltagare med en avläst bricka
      Och stämplingar som inte kunde matchas mot banmallen
      När deltagaren väljs på sidan "Deltagare"
      Så visas de omatchade stämplingarna längst ner

    Scenario: Saknad stämpling visas som en lucka
      Givet en deltagare vars bricka saknar en av banans kontroller
      När deltagaren väljs
      Så visas en lucka i banmallen där stämplingen saknas

    Scenario: Start- och målstämpling visas
      Givet en deltagare med start- och målstämpling i brickan
      När deltagaren väljs
      Så visas både start- och målstämplingen

  Regel: Löptiden styrs av starttid och måltid

    Scenario: Löptiden ändras genom att justera starttid och måltid
      Givet en deltagare med starttid 10:00:00 och måltid 10:42:00
      När måltiden ändras till 10:45:00
      Så är deltagarens löptid 45:00

    Scenario: Måltid kan inte sättas direkt när målstämpling finns
      Givet en deltagare med en inläst bricka som har målstämpling
      När en annan måltid försöker sättas direkt
      Så måste i stället tiden för målstämplingen ändras

    Scenario: Starttid kan inte sättas direkt när startstämpling finns
      Givet en deltagare med en inläst bricka som har startstämpling
      När en annan starttid försöker sättas direkt
      Så måste i stället tiden för startstämplingen ändras

    Scenario: Starttiden kan komma från klassen
      Givet en klass med gemensam start
      När en deltagare i klassen saknar startstämpling
      Så bestäms deltagarens starttid av klassen

    Scenario: Starttiden kan komma från en växlingstid
      Givet en stafettlöpare på sträcka 2
      När sträcka 1 växlat
      Så bestäms sträcka 2:s starttid av växlingstiden

  Regel: Statustillstånden

    Scenario: Tillgängliga statustillstånd
      Givet en deltagare
      När status ska sättas
      Så finns tillstånden okänd (–), godkänd (OK), ej start, återbud,
         felstämplad (felst.), utgått (utg.), diskvalificerad (disk.)
         och löptid över tillåten tid (maxtid)

    Scenario: Utan tidtagning döljer tiderna men visar status
      Givet en deltagare med status "Utan tidtagning"
      När resultatlistan visas
      Så visas endast deltagarens status, inte tiderna

    Scenario: Utom tävlan visar tiden men ger ingen placering
      Givet en deltagare med status "Utom tävlan"
      När resultatlistan visas
      Så visas deltagarens tid
      Och deltagaren får ingen placering
      Och deltagaren placeras efter de tävlande i listan

    Scenario: Utan tidtagning kan sättas innan deltagaren gått i mål
      Givet en deltagare som ännu inte gått i mål
      När status "Utan tidtagning" sätts
      Så har deltagaren status utan tidtagning och utan resultat

    Scenario: Deltar ej filtreras bort ur listorna
      Givet en deltagare med status "Deltar ej"
      När listor och sammanställningar tas fram
      Så saknas deltagaren i dem

    Scenario: Deltar ej används för löpare som står över en etapp
      Givet en tävling med flera etapper
      När en löpare inte deltar i etapp 2
      Så sätts status "Deltar ej" för löparen på den etappen

  Regel: En inläst bricka begränsar vilka statusar som kan sättas

    Scenario: Godkänd bricka med målstämpling låser flera statusar
      Givet en deltagare med en inläst bricka som matchar banan och har målstämpling
      När status ska sättas
      Så går det inte att sätta okänd, ej start, återbud, felstämplad eller utgått
      Och det går att diskvalificera deltagaren

    Scenario: Bricka som inte matchar banan kan inte godkännas rakt av
      Givet en deltagare med en inläst bricka som inte matchar banan
      När deltagaren ska godkännas
      Så måste de saknade stämplingarna först läggas till manuellt i brickan

    Scenario: Bricka utan måltid ger status utgått
      Givet en deltagare med en inläst bricka som inte matchar banan
      Och som saknar måltid och målstämpling
      När resultatet bedöms
      Så är deltagarens status "Utgått"

    Scenario: Utgått kan inte sättas när måltid finns
      Givet en deltagare med registrerad måltid
      När status "Utgått" försöker sättas
      Så måste måltiden först tas bort

  Regel: Manuella beslut kan dokumenteras

    Scenario: Kommentar dokumenterar varför deltagaren diskvalificerats
      Givet en diskvalificerad deltagare
      När en kommentar skrivs in
      Så sparas kommentaren med deltagaren

  Regel: Trasiga kontroller hanteras på kontrollen, inte i brickan

    Scenario: Försvunnen kontroll ska inte lösas genom att ändra brickan
      Givet en kontroll som gått sönder ute i skogen
      När deltagarnas resultat ska hanteras
      Så markeras kontrollen som trasig på sidan "Kontroller"
      Och de inlästa brickorna lämnas orörda
