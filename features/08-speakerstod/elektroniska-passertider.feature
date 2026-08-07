# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5465
# Kod: SportIdent.cpp (autosänd, SI Online Punches över TCP), TabSI.cpp,
#      oFreePunch.cpp (kontrollmappning)
Egenskap: Elektroniska passertider
  Som arrangör med radiokontroller
  vill jag ta emot stämplingar direkt från SI-enheter
  så att speaker och listor får liveinformation.

  Regel: Enheten programmeras för autosänd

    Scenario: Masterstation programmeras som kontroll eller mål
      Givet en SI-enhet som ska skicka stämplingar
      När den programmeras som kontroll eller mål med "Skicka stämplingar / autosänd"
      Så skickar den stämplingar vidare

    Scenario: Enheten aktiveras på sin COM-port
      Givet sidan "SportIdent" med "Avläsning / radiotider" valt
      När COM-porten väljs och "Aktivera" klickas
      Så försöker MeOS få kontakt med enheten

  Regel: Enheter utan svar kan lyssnas på

    Scenario: MeOS erbjuder att lyssna när svar uteblir
      Givet en enhet långt bort eller uppkopplad via radiolänk
      När MeOS inte får något svar
      Så frågar MeOS om den ska lyssna efter inkommande stämplingar

    Scenario: Kontakten måste verifieras med provstämpling
      Givet att MeOS lyssnar på en port
      När kontakten ska verifieras
      Så måste en provstämpling göras

    Scenario: MeOS upptäcker inte att kontakten upphör
      Givet en lyssnande port
      När kontakten med enheten upphör
      Så kan MeOS inte upptäcka det

  Regel: Kontrollmappning tolkar kodsiffror utan enhetstyp

    Scenario: Enhetstypen går inte att avgöra utan direktkontakt
      Givet stämplingar mottagna utan direktkontakt med enheten
      När stämplingarna tolkas
      Så används enhetens kodsiffra i stället för enhetstypen

    Scenario: Kontrollmappning visas efter anslutning
      Givet en ansluten enhet
      När anslutningen är klar
      Så visas formuläret "Kontrollmappning"

    Scenario: Kodsiffror över 30 tolkas alltid som kontroller
      Givet en inkommande stämpling med kodsiffra 45
      När den tolkas
      Så behandlas den som kontroll 45

  Regel: Inkommande stämplingar används olika beroende på typ

    Scenario: Startstämpling sätter starttiden
      Givet en registrerad startstämpling för en deltagare
      När den tas emot
      Så sätts deltagarens starttid

    Scenario: Målstämpling sätter måltiden men inte statusen
      Givet en registrerad målstämpling för en deltagare
      När den tas emot
      Så sätts måltiden
      Och deltagarens status sätts inte, resultatet är preliminärt

    Scenario: Resultat vid målstämpling sätter även status
      Givet en klass med "Resultat vid målstämpling"
      När en målstämpling tas emot
      Så sätts även deltagarens status

    Scenario: Check och töm påverkar bara kvar-i-skogen
      Givet en stämpling med check eller töm
      När den tas emot
      Så påverkas inte tävlingen
      Men kvar-i-skogen-listan tar hänsyn till den

    Scenario: Stämplingar för knytning och anmälan registreras inte
      Givet en stämpling som används för att knyta bricka eller anmäla deltagare
      När den tas emot
      Så registreras den inte i tävlingen
      Och resultatet blir detsamma som om siffrorna skrivits in manuellt

  Regel: SI Online Punches tas emot över TCP

    Scenario: TCP väljs i portlistan
      Givet sidan "SportIdent"
      När "TCP" väljs i listan över portar och "Starta" trycks
      Så öppnas porten för inkommande stämplingar

    Scenario: Samma port måste användas av avsändaren
      Givet en öppnad TCP-port i MeOS
      När ett program skickar stämplingar
      Så måste det använda samma port

    Scenario: Protokollets nolltid är midnatt
      Givet stämplingar mottagna över TCP
      När tiderna tolkas
      Så förutsätts protokollets nolltid vara 00:00:00

    Scenario: Brandväggar måste släppa igenom trafiken
      Givet stämplingar över TCP
      När trafiken blockeras av en brandvägg
      Så kommer inga stämplingar in
