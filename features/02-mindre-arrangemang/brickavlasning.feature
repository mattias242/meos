# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5411
# Kod: TabSI.cpp, SportIdent.cpp, oRunner::evaluateCard, oCard
Egenskap: Brickavläsning
  Som tävlingssekretariat
  vill jag att en avläst bricka automatiskt matchas mot banan
  så att löparens status och tid räknas fram utan manuell hantering.

  Bakgrund:
    Givet en tävling med nollställd tävlingsklocka
    Och en bana "Bana A" med kontrollerna 31, 32, 33

  Regel: Brickan bedöms mot löparens bana

    Scenario: Korrekta stämplingar ger godkänt resultat
      Givet en löpare med bricka 500123 anmäld på "Bana A" med starttid 10:00:00
      När bricka 500123 läses av med stämplingarna 31, 32, 33 och måltid 10:35:30
      Så får löparen status "Godkänd"
      Och löparens tid är 35:30

    Scenario: Saknad kontroll ger felstämplat
      Givet en löpare med bricka 500123 anmäld på "Bana A"
      När bricka 500123 läses av med stämplingarna 31, 33 och mål
      Så får löparen status "Felstämplat"

    Scenario: Stämplingar i fel ordning ger felstämplat
      Givet en löpare med bricka 500123 anmäld på "Bana A"
      När bricka 500123 läses av med stämplingarna 31, 33, 32 och mål
      Så får löparen status "Felstämplat"

    Scenario: Extra stämplingar mellan rätt kontroller påverkar inte godkännande
      Givet en löpare med bricka 500123 anmäld på "Bana A"
      När bricka 500123 läses av med stämplingarna 31, 50, 32, 33 och mål
      Så får löparen status "Godkänd"

  Regel: Avläsningsfunktionen väljs och kan låsas

    Scenario: Avläsning väljs på sidan SportIdent
      Givet sidan "SportIdent"
      När funktionen "Avläsning/radiotider" väljs
      Så läses brickor in när de placeras i enheten

    Scenario: Låst funktion skyddar mot oavsiktligt byte
      Givet den valda funktionen "Avläsning/radiotider"
      När "Lås funktion" väljs
      Så måste funktionen aktivt låsas upp innan den kan ändras

  Regel: SI-enheten måste vara rätt programmerad

    Scenario: Masterstationen kräver avslagen autosänd vid inläsning
      Givet en SI-enhet som ska användas för brickinläsning
      När enheten programmeras
      Så ska funktionen "Autosänd" vara avslagen

    Scenario: Radiokontroller och målstämpling kräver påslagen autosänd
      Givet en SI-enhet som ska användas som radiokontroll
      När enheten programmeras
      Så ska funktionen "Autosänd" vara påslagen

    Scenario: Enheten aktiveras på en vald COM-port
      Givet en installerad SI-enhet
      När COM-porten väljs och "Aktivera" klickas
      Så är enheten aktiv i MeOS

    Scenario: MeOS kan söka igenom alla COM-portar
      Givet en installerad SI-enhet vars COM-port är okänd
      När "Sök och starta automatiskt" väljs
      Så söks alla COM-portar igenom efter SI-enheter

    Scenario: Flera SI-enheter kan anslutas samtidigt
      Givet två anslutna SI-enheter
      När båda aktiveras
      Så kan båda användas samtidigt

  Regel: Interaktiv inläsning frågar efter data som saknas

    Scenario: Saknade uppgifter efterfrågas vid inläsning
      Givet att "Interaktiv inläsning" är aktiv
      När en bricka läses in utan att deltagaren är föranmäld
      Så ombeds operatören fylla i de uppgifter som saknas

    Scenario: Tävlingen byggs upp vartefter löparna går i mål
      Givet en tävling utan föranmälda deltagare
      Och att "Interaktiv inläsning" är aktiv
      När brickor läses in
      Så byggs tävlingen upp efter hand

    Scenario: Röd utgång bör inte kombineras med interaktiv inläsning
      Givet ett större arrangemang med en röd utgång för avläsningsproblem
      När avläsningen konfigureras
      Så ska "Interaktiv inläsning" inte vara aktiv

  Regel: Löpardatabasen parar ihop deltagare och brickor

    Scenario: Okänd bricka som finns i databasen anmäls automatiskt
      Givet att "Använd löpardatabasen" och "Interaktiv inläsning" är aktiva
      Och att bricka 500123 finns i löpardatabasen
      När bricka 500123 läses in och dess bana matchar banan i en klass
      Så anmäls deltagaren automatiskt i den klassen

    Scenario: Automatiken kan gå fel för en utlånad bricka
      Givet en utlånad bricka som i löpardatabasen tillhör någon annan
      När brickan läses in och anmäls automatiskt
      Så måste deltagarens namn rättas i efterhand

  Regel: Okända brickor hanteras

    Scenario: Okänd bricka hamnar i kön för manuell hantering
      Givet att ingen löpare har bricka 999999
      Och att "Interaktiv inläsning" är aktiv
      När bricka 999999 läses av
      Så markeras avläsningen som "Okänd bricka"
      Och ingen löpares resultat ändras

    Scenario: Utan interaktiv inläsning läggs okända brickor in som oparade
      Givet att "Interaktiv inläsning" inte är aktiv
      När en okänd bricka läses in
      Så läggs brickan in som oparad

  Regel: Avläsningsfönstret visar senaste avläsning i stor stil

    Scenario: Eget fönster visar den senast avlästa brickan
      Givet sidan "SportIdent"
      När "Öppna avläsningsfönster" väljs
      Så öppnas ett fönster som visar namn, klass och resultat med stora bokstäver
      Och fönstret uppdateras vid varje ny avläsning

  Regel: Ljudåterkoppling signalerar utfallet

    Scenario: Olika ljud för olika utfall
      Givet att "Ljud" är markerat
      När en bricka läses in
      Så spelas ett ljud som beror på utfallet godkänd, inte godkänd,
         åtgärd krävs eller ny ledare i klassen

    Scenario: Egna ljudfiler kan väljas
      Givet att ljudåterkoppling är aktiv
      När "Ljudval" väljs
      Så går det att styra vilka ljud som spelas och välja egna ljudfiler

  Regel: Avläsning kan ske i bakgrunden

    Scenario: Brickor läses in medan en annan sida visas
      Givet en aktiv avläsningsenhet
      När resultatlistan visas i stället för sidan "SportIdent"
      Så läses brickor in ändå
      Och resultatlistan uppdateras vartefter löparna kommer i mål

    Scenario: Deltagare som kräver interaktion ställs i kö
      Givet att sidan "SportIdent" inte är aktiv
      När en bricka som kräver interaktion läses in
      Så ställs deltagaren i kö tills sidan aktiveras
