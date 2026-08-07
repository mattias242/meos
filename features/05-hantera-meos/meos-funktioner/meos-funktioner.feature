# language: sv
Egenskap: MeOS-funktioner
  Utökade funktioner: speakerstöd, etapper, ekonomi, vakanser,
  tidstillägg och löpardatabas.

  Regel: Speakerstöd (SP)

    Scenario: Speakern förvarnas vid radiokontroll
      Givet att funktionen "Speakerstöd" är aktiv
      Och en bevakad klass med radiokontroll
      När en stämpling från radiokontrollen tas emot
      Så visas löparen i speakerfönstret med preliminär placering

  Regel: Flera etapper (ST)

    Scenario: Totaltid ackumuleras över etapper
      Givet en tävling i två etapper
      Och en löpare med tiden 35:00 på etapp 1
      När löparen går i mål på 40:00 på etapp 2
      Så är löparens totaltid 1:15:00

    Scenario: Etappresultat förs över som ingångstid
      Givet en avslutad etapp 1
      När etapp 2 skapas från etapp 1
      Så har varje löpare etapp 1-resultatet som ingångstid

  Regel: Ekonomi (EC) — avgifter och fakturering
    # Kräver Klubbar och Redigera klubbar

    Scenario: Anmälningsavgift bestäms av klass och anmälningsdatum
      Givet en klass med ordinarie avgift 100 och efteranmälningsavgift 150
      Och att efteranmälningsgränsen har passerats
      När en löpare anmäls
      Så är löparens avgift 150

    Scenario: Klubbfaktura summerar klubbens deltagaravgifter
      Givet en klubb med tre anmälda löpare med avgifterna 100, 100 och 150
      När klubbens faktura skapas
      Så är fakturans belopp 350

  Regel: Vakanser (VA) — vakansplatser och återbud
    # Kräver Lotta startlistor

    Scenario: Vakansplatser lottas in i startlistan
      Givet en klass som lottas med 2 vakansplatser
      När startlistan skapas
      Så innehåller den 2 vakanser med egna starttider

    Scenario: Efteranmäld tar en vakansplats
      Givet en lottad klass med en ledig vakans
      När en löpare efteranmäls till vakansen
      Så övertar löparen vakansens starttid
      Och vakansen är förbrukad

  Regel: Tidstillägg (TA) — manuella tidstillägg och justeringar

    Scenario: Tidstillägg adderas till löptiden
      Givet en godkänd löpare med löptid 35:00
      När ett tidstillägg på 2:00 registreras
      Så är löparens slutliga tid 37:00

  Regel: Löpardatabas (RD) — klubb- och löpardatabas
    # Kräver Klubbar

    Scenario: Anmälan via bricknummer hämtar löparen från databasen
      Givet en löpardatabas som innehåller bricka 500123 med namn och klubb
      När bricka 500123 anmäls
      Så fylls namn, klubb och födelseår i från databasen
