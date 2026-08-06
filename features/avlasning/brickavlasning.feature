# language: sv
Egenskap: Avläsning av löparbricka
  Som tävlingssekretariat
  vill jag att en avläst bricka automatiskt matchas mot banan
  så att löparens status och tid räknas fram utan manuell hantering.

  Bakgrund:
    Givet en tävling med nollställd tävlingsklocka
    Och en bana "Bana A" med kontrollerna 31, 32, 33

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

  Scenario: Okänd bricka hamnar i kön för manuell hantering
    Givet att ingen löpare har bricka 999999
    När bricka 999999 läses av
    Så markeras avläsningen som "Okänd bricka"
    Och ingen löpares resultat ändras
