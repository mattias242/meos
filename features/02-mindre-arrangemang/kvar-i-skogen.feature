# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5417
# Kod: MeOSFeatures::InForest, TabRunner.cpp (kvar-i-skogen), oFreePunch.cpp
Egenskap: Kvar-i-skogen
  Som tävlingsledning
  vill jag veta vilka deltagare som ännu inte kommit i mål
  så att ingen lämnas kvar i skogen när tävlingen avslutas.

  Regel: Funktionen måste vara aktiverad

    Scenario: Kvar-i-skogen kräver aktiverad funktion
      Givet en tävling där funktionen "Beräkna kvar-i-skogen" är avaktiverad
      När kvar-i-skogen efterfrågas
      Så är funktionen inte tillgänglig

    Scenario: Funktionen är på som standard för standardarrangemang
      Givet en ny tävling av standardtyp
      När funktionerna läses in
      Så är "Beräkna kvar-i-skogen" aktiv

  Regel: Listan visar deltagare som inte kommit i mål

    Scenario: Listan sorteras efter klass och starttid
      Givet flera deltagare som inte gått i mål
      När kvar-i-skogen-listan visas under "Rapporter" på sidan "Listor"
      Så listas deltagarna sorterade efter klass och starttid

    Scenario: Checkstämplingens tid används när exakt starttid saknas
      Givet en deltagare utan starttid men med checkstämpling 10:12:00
      När kvar-i-skogen-listan visas
      Så presenteras 10:12:00 som deltagarens tid

    Scenario: Anmälningstiden används vid direktanmälan
      Givet en direktanmäld deltagare utan starttid och utan checkstämpling
      När kvar-i-skogen-listan visas
      Så presenteras anmälningstiden som deltagarens tid

    Scenario: Listan uppdateras automatiskt
      Givet en visad kvar-i-skogen-lista
      När en deltagares bricka läses av
      Så försvinner deltagaren ur listan

    Scenario: Listan kan filtreras på tid ute
      Givet en kvar-i-skogen-lista
      När filtret sätts till deltagare som varit ute längre än 2 timmar
      Så visas endast dessa deltagare

    Scenario: Stämplingar från okända brickor tas med
      Givet en stämpling från en bricka som inte hör till någon deltagare
      När kvar-i-skogen-listan visas
      Så ingår stämplingen i listan

    Scenario: Möjliga brickägare visas från löpardatabasen
      Givet en okänd bricka som finns i löpardatabasen
      När kvar-i-skogen-listan visas
      Så visas möjliga brickägare från databasen

  Regel: Kontrollistan visar besökare per kontroll

    Scenario: Antal besökare och kvarvarande per kontroll
      Givet en tävling med registrerade stämplingar
      När listan "Kontroller" visas under "Rapporter"
      Så visas per kontroll antalet besökare
      Och hur många deltagare som har kontrollen kvar på banan

    Scenario: Passerad radiokontroll antas innebära passerade tidigare kontroller
      Givet en deltagare som passerat en radiokontroll mitt på banan
      När kontrollistan beräknas
      Så antas deltagaren redan ha passerat kontrollerna tidigare på banan

    Scenario: Samma information finns i kontrolltabellen
      Givet en tävling med registrerade stämplingar
      När tabellen på sidan "Kontroller" visas
      Så visas samma besöksinformation

  Regel: Kvar-i-skogen kan redigeras på sidan Deltagare

    Scenario: Löpare utan registrering listas
      Givet deltagare vars brickor inte använts under tävlingen
      När "Kvar-i-skogen" väljs på sidan "Deltagare"
      Så listas dessa löpare som saknande registrering

    Scenario: Löpare utan registrering sätts till ej start
      Givet en lista med löpare som saknar registrering
      När "Sätt okända löpare utan registrering till <ej start>" väljs
      Så får dessa löpare status "Ej start"

    Scenario: Inlästa enheter flyttar löpare till listan med registrering
      Givet en löpare som saknade registrering
      När en checkenhets stämplingar läses in och innehåller löparens bricka
      Så flyttas löparen till listan "Löpare, status okänd, med registrering"

    Scenario: Stämplingar importeras från en semikolonseparerad fil
      Givet en fil med avlästa stämplingar från SportIdent Config+ i csv-format
      När "Importera stämplingar" väljs
      Så registreras stämplingarna i tävlingen

    Scenario: Felaktigt satta ej start kan återställas
      Givet löpare som fått "Ej start" innan alla checkenheter lästs in
      Och att ytterligare en checkenhet därefter lästs in
      När "Återställ löpare <ej start> med registrering till <status okänd>" väljs
      Så får dessa löpare status okänd
      Och de räknas åter som kvar i skogen
