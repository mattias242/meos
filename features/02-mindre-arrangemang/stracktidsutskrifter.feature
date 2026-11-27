# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5414
# Kod: TabSI.cpp (automatisk utskrift), printer.cpp, oListInfo (sträcktidslista)
Egenskap: Sträcktidsutskrifter
  Som sekretariat
  vill jag att deltagarens sträcktider skrivs ut vid avläsning
  så att deltagaren får med sig sitt resultat direkt.

  Regel: Automatisk sträcktidsutskrift sker vid avläsning

    Scenario: Sida med sträcktider skrivs ut när brickan lästs in
      Givet att "Automatisk sträcktidsutskrift" är valt på sidan "SportIdent"
      När en bricka läses in
      Så skrivs deltagarens sträcktider ut

    Scenario: Formatet anpassas efter pappersformatet
      Givet en konfigurerad kvittoskrivare med pappersformatet 72 mm
      När en sträcktidsutskrift görs
      Så anpassas utskriftens format efter pappersformatet

    Scenario: Utskriften skalas så att texten får plats
      Givet en tävling med ett mycket långt tävlingsnamn
      När en sträcktidsutskrift görs
      Så skalas texten ned så att den får plats

  Regel: Sträcktidslistan kan väljas

    Scenario: Automatiskt val anpassar listan efter klass
      Givet sträcktidsinställningarna med listvalet "Automatisk"
      När en bricka läses in
      Så väljs en lista anpassad efter deltagarens klass

    Scenario: Standardlistan saknar klassresultat
      Givet sträcktidsinställningarna med listvalet "Standard"
      När en bricka läses in
      Så används den inbyggda listan utan klassresultat

    Scenario: Egendefinierad lista kan redigeras
      Givet en vald sträcktidslista
      När "Redigera" väljs
      Så öppnas listan i Listredigeraren
      Och en inbyggd lista öppnas som en kopia

    Scenario: Olika klasser kan använda olika sträcktidslistor
      Givet tabellen för klasser
      När kolumnen "Sträcktidslista" visas och sätts per klass
      Så används den valda listan för respektive klass

  Regel: Egna textrader kan skrivas ut

    Scenario: Fast text skrivs ut oförändrad
      Givet en egen textrad "Tack för att du kom"
      När en sträcktidsutskrift görs
      Så skrivs raden ut oförändrad

    Scenario: Symbol inom hakparentes ersätts med ett uträknat värde
      Givet en egen textrad "Att betala: [RunnerFee]"
      Och en deltagare med avgiften 50
      När en sträcktidsutskrift görs
      Så skrivs "Att betala: 50kr" ut

  Regel: Sträcktider kan skrivas ut manuellt

    Scenario: Utskrift för en enskild deltagare
      Givet en deltagare på sidan "Deltagare"
      När "Skriv ut sträcktider" väljs
      Så skrivs deltagarens sträcktider ut

  Regel: SIAC-brickans batterinivå kontrolleras

    Scenario: Varning skrivs ut vid låg batterispänning
      Givet en deltagare med en SIAC-bricka med låg batterispänning
      När sträcktider skrivs ut
      Så innehåller utskriften en varning om batterinivån

  Regel: Flera löpare kan samlas på ett papper

    Scenario: Sträcktider i kolumner på standardformat
      Givet att "Sträcktider i kolumner" är markerat
      När sträcktider skrivs ut på A4
      Så placeras flera löpare på samma blad

    Scenario: Väntetiden begränsar hur länge ett blad hålls kvar
      Givet inställningen 4 löpare per papper och maximal väntetid 3 minuter
      Och att endast 2 löpare lästs in när väntetiden går ut
      När väntetiden överskrids
      Så skrivs ett papper ut med de 2 löparna
