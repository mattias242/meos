# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5455
# Kod: TabSI.cpp (avstämning av hyrbrickor)
Egenskap: Avstämning av hyrbrickor
  Som materialansvarig
  vill jag stämpla in alla återlämnade hyrbrickor och få en rapport
  så att jag vet vilka brickor som saknas.

  Regel: Återlämnade brickor stämplas in

    Scenario: Avstämningen startas
      Givet sidan "SportIdent"
      När funktionen "Avstämning av hyrbrickor" väljs och en SI-enhet aktiveras
      Så registreras varje instämplad bricka som återlämnad

    Scenario: Rapport tas fram
      Givet ett antal instämplade brickor
      När "Rapport" väljs
      Så visas vilka brickor som återlämnats och vilka som saknas

    Scenario: Fler brickor kan stämplas efter en rapport
      Givet en framtagen rapport
      När ytterligare brickor stämplas
      Så kan en ny rapport tas fram

  Regel: Avstämningen är knuten till datorn

    Scenario: Samma dator måste användas för alla brickor
      Givet en pågående avstämning
      När brickor stämplas in
      Så måste samma dator användas för samtliga

    Scenario: Flera SI-enheter kan kopplas in
      Givet en pågående avstämning
      När flera SI-enheter kopplas in på samma dator
      Så kan alla användas

  Regel: Avstämningen kan nollställas och skrivas ut

    Scenario: Nollställning börjar om
      Givet en pågående avstämning
      När "Nollställ" väljs
      Så börjar avstämningen om från början

    Scenario: Rapporten skrivs ut
      Givet en pågående avstämning
      När "Skriv ut" väljs
      Så genereras och skickas en aktuell rapport till skrivaren

  Regel: Enheterna bör programmeras som kontroller

    Scenario: Kontrollprogrammering ger snabbare instämpling
      Givet SI-enheter som ska användas för avstämning
      När de programmeras som kontroller i stället för avläsning
      Så går instämplingen snabbare
