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
