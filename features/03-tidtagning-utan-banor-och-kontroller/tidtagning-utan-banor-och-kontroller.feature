# language: sv
Egenskap: Tidtagning utan banor
  Enkel tidtagning där tävlingen inte har banor eller kontroller —
  endast start, mål och tid.

  Regel: Utan banor (NC)

    Scenario: Resultat utan bankontroll
      Givet en tävling med funktionen "Utan banor" och inga banor upplagda
      Och en löpare med starttid 10:00:00
      När löparens bricka läses av med måltid 10:42:00
      Så är löparens tid 42:00
      Och löparens status "Godkänd" utan kontroll av stämplingar

    Scenario: Utan banor gäller bara så länge banor saknas
      Givet en tävling med funktionen "Utan banor"
      När en bana läggs upp i tävlingen
      Så bedöms avläsningar åter mot banans kontroller

    Scenario: Namngivna kontroller ger mellantider utan bana
      Givet en tävling med funktionen "Utan banor"
      Och en namngiven kontroll för kodsiffra 100
      När en löpares bricka läses av med en stämpling på kodsiffra 100
      Så kan stämplingen visas som mellantid i resultatlistan

  Regel: Varvräkning bygger på Utan banor
    # Räkneregeln ligger i resultatmodulen för varvningsresultat (MRL),
    # inte i C++-koden — se docs/FUNKTIONSKATALOG_BDD.md.

    Scenario: Varje stämpling av varvningskontrollen räknas som ett varv
      Givet en tävling med funktionen "Utan banor" och en varvningskontroll
      När en löpare stämplar varvningskontrollen tre gånger med minst en minut emellan
      Så redovisar listan "Varvräkning" tre avklarade varv för löparen

    Scenario: Extra säkerhetsstämpling på samma varv räknas inte som nytt varv
      Givet en tävling med funktionen "Utan banor" och en varvningskontroll
      När en löpare stämplar varvningskontrollen två gånger inom en minut
      Så räknas stämplingarna som ett enda varv
