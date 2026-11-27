# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5405
# Kod: oCourse (useFirstAsStart/useLastAsFinish), TabCourse.cpp,
#      iof30interface.cpp (banimport)
Egenskap: Definiera banor
  Som banläggare eller sekretariat
  vill jag lägga in banor med kontroller, längder och start-/målregler
  så att avläsningar bedöms rätt och sträcktider kan räknas ut.

  Regel: En bana definieras av namn och en lista med kontroller

    Scenario: Bana läggs upp med kommaseparerade kontroller
      Givet sidan "Banor"
      När en bana skapas med namnet "Lång" och kontrollerna 34, 37, 56, 71
      Så finns banan "Lång" med fyra kontroller i den angivna ordningen

    Scenario: Kontrollnummer och stämplingskod är normalt samma
      Givet en bana som refererar till kontroll 34
      När kontrollens stämplingskod inte har ändrats
      Så är kontrollens kodsiffra 34

    Scenario: Ändrad stämplingskod slår igenom utan att banan ändras
      Givet en bana som refererar till kontroll 34
      När kontroll 34 ges stämplingskoden 35 på sidan "Kontroller"
      Så godkänns en stämpling med kodsiffra 35 för den kontrollen på banan

  Regel: Längd, stigning och antal kartor är frivilliga uppgifter

    Scenario: Bana kan sparas utan längd och stigning
      När en bana skapas med enbart namn och kontroller
      Så sparas banan

    Scenario: Antal kartor används vid direktanmälan
      Givet en bana med 50 angivna kartor
      När direktanmälan görs mot banan
      Så visar MeOS hur många kartor som finns kvar

  Regel: Första kontrollen kan användas som start

    Scenario: Stämpling på första kontrollen startar tidtagningen
      Givet en bana där "Använd första kontrollen som start" är markerad
      Och en deltagare utan startstämpling från en startenhet
      När deltagarens bricka läses av
      Så räknas tiden från stämplingen på banans första kontroll

    Scenario: Tidtagningen kan flyttas fram i efterhand
      Givet en bana där en tidig kontroll försvunnit
      När "Använd första kontrollen som start" markeras
      Så räknas tiden från den kvarvarande första kontrollen

  Regel: Sista kontrollen kan användas som mål

    Scenario: Stämpling på sista kontrollen avslutar tidtagningen
      Givet en bana där "Använd sista kontrollen som mål" är markerad
      När deltagarens bricka läses av
      Så räknas tiden till stämplingen på banans sista kontroll
      Och ingen målenhet behövs

  Regel: Banor kan importeras från banläggningsprogram

    Scenario: Banor importeras från IOF-XML 3.0
      Givet en banfil i formatet IOF-XML 3.0
      När "Importera från fil" väljs på sidan "Banor"
      Så skapas banorna i filen

    Scenario: Klasser kopplas ihop med banor vid import
      Givet en banfil som innehåller klassinformation
      När "Lägg till/uppdatera klasser" är markerat vid importen
      Så knyts varje bana till rätt klass
      Och gafflingar i filen importeras

    Scenario: En klass per bana skapas när filen saknar klassinformation
      Givet en banfil utan klassinformation
      När "Skapa en klass för varje bana" väljs vid importen
      Så skapas en klass per bana

    Scenario: Sträcklängder från filen används för km-tider
      Givet en banfil som innehåller avstånd mellan kontroller
      När banorna importeras
      Så lagras sträcklängderna
      Och km-tider kan räknas ut på sträckorna

    Scenario: Sträcklängder kan redigeras manuellt
      Givet en bana med lagrade sträcklängder
      När "Redigera sträcklängder" väljs
      Så går det att ändra längderna

  Regel: Banor kan importeras från ett enkelt textformat

    Scenario: En bana per rad med kommaseparerade kontroller
      Givet en textfil med raden "Kort bana, 34, 56, 77, 63, 100"
      När banorna importeras
      Så skapas banan "Kort bana" med kontrollerna 34, 56, 77, 63 och 100

    Scenario: Banans namn i textformatet är frivilligt
      Givet en textfil med raden "34, 56, 77, 63, 100"
      När banorna importeras
      Så skapas en bana med de fem kontrollerna
