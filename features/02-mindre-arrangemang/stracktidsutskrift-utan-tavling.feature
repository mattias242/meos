# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5421
# Kod: TabSI.cpp (sträcktidsutskrift utan öppnad tävling)
Egenskap: Sträcktidsutskrift utan tävling
  Som träningsansvarig
  vill jag kunna läsa av brickor och skriva ut sträcktider utan att öppna en tävling
  så att en enkel träning inte kräver något förarbete.

  Regel: Avläsning fungerar utan öppnad tävling

    Scenario: Avläsningsenhet startas utan tävling
      Givet MeOS utan öppnad tävling
      När en avläsningsenhet startas på sidan "SportIdent"
      Så kan brickor läsas av

    Scenario: Brickans innehåll visas på skärmen
      Givet en startad avläsningsenhet utan öppnad tävling
      När en bricka läses av
      Så visas brickans innehåll direkt på skärmen

    Scenario: Utskrift ställs in separat
      Givet läget för sträcktidsutskrift utan tävling
      När "Sträcktidsutskrift" väljs
      Så går det att ställa in skrivare och utskrift

  Regel: Namn kan slås upp och redigeras

    Scenario: Löpardatabasen slår upp namn från bricknummer
      Givet en installerad löpardatabas som känner bricka 500123
      När bricka 500123 läses av
      Så visas löparens namn

    Scenario: Namnet kan redigeras för hand
      Givet en avläst bricka som visas med namnet "okänd"
      När texten "okänd" klickas
      Så går det att skriva in ett namn

  Regel: Avläsningarna kan sparas eller bli en tävling

    Scenario: Avlästa brickor sparas till fil
      Givet ett antal avlästa brickor
      När avläsningarna sparas
      Så skapas en semikolonseparerad fil

    Scenario: Tävling skapas utifrån inlästa brickor
      Givet ett antal avlästa brickor
      När "Skapa tävling utifrån inlästa brickor" väljs
      Så skapas en tävling med deltagarna och deras resultat
