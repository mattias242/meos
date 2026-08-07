# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5511
# Kod: oControl.h, ControlStatus {StatusOK, StatusBad, StatusMultiple,
#      StatusStart, StatusFinish, StatusRogaining, StatusNoTiming,
#      StatusOptional, StatusBadNoTiming, StatusRogainingRequired, StatusCheck}
Egenskap: Kontroller
  Som banläggare och sekretariat
  vill jag kunna styra hur enskilda kontroller används
  så att trasiga och särskilda kontroller kan hanteras utan att röra brickorna.

  Regel: Kontrollen har ett id-nummer och en stämplingskod

    Scenario: Kontrollens id är normalt samma som stämplingskoden
      Givet en kontroll som lagts till automatiskt
      När kontrollen visas på sidan "Kontroller"
      Så är id-numret samma som stämplingskoden

    Scenario: Banan refererar till id-numret, inte kodsiffran
      Givet en bana som refererar till kontroll 32
      När kontrollens stämplingskod ändras till 33
      Så refererar banan fortfarande till kontroll 32
      Och en stämpling med kodsiffra 33 godkänns för kontrollen

  Regel: Kontrollen kan namnges

    Scenario: Namn ersätter numret inom hakparentes
      Givet en kontroll som visas som "[32]"
      När namnet "Varvning" skrivs in
      Så heter kontrollen "Varvning"

    Scenario: Namnet används i speakerstödet
      Givet en namngiven kontroll
      När speakerstödet visar passeringar
      Så används kontrollens namn

    Scenario: Mellantider vid namngivna kontroller kan skrivas ut
      Givet en namngiven kontroll
      När en resultatlista med mellantider tas fram
      Så kan mellantiden vid kontrollen tas med

  Regel: Kontrollens status styr hur den används

    Scenario: OK godkänner vid en av kontrollens kodsiffror
      Givet en kontroll med status "OK" och kodsiffrorna 32 och 132
      När en deltagare stämplat 132
      Så är deltagaren godkänd vid kontrollen

    Scenario: Flera kodsiffror ger en enkel gaffling
      Givet en kontroll med kodsiffrorna 32 och 132
      När två deltagare stämplat var sin av kodsiffrorna
      Så är båda godkända vid kontrollen

    Scenario: Multipel kräver samtliga listade kontroller
      Givet en kontroll med status "Multipel" och kodsiffrorna 41, 42 och 43
      När en deltagare stämplat 41 och 42
      Så är deltagaren inte godkänd vid kontrollen

    Scenario: Multipel tillåter valfri ordning
      Givet en kontroll med status "Multipel" och kodsiffrorna 41, 42 och 43
      När en deltagare stämplat 43, 41 och 42
      Så är deltagaren godkänd vid kontrollen

    Scenario: Trasig kontroll används inte alls
      Givet en kontroll med status "Trasig"
      När resultaten beräknas
      Så är utfallet detsamma som om kontrollen tagits bort från alla banor

    Scenario: Försvunnen kontroll gör efterföljande sträcka utan tidtagning
      Givet en kontroll med status "Försvunnen"
      Och en deltagare som stämplade föregående kontroll 10:22:00
      När deltagarens tider räknas ut
      Så får deltagaren stämplingstiden 10:22:00 även på efterföljande kontroll

    Scenario: Utan tidtagning bortser från sträckan till kontrollen
      Givet en kontroll med status "Utan tidtagning"
      Och en deltagare som stämplade föregående kontroll 10:22:00
      När deltagarens tider räknas ut
      Så redovisas stämplingstiden på kontrollen som 10:22:00
      Och totaltiden är oberoende av deltagarens faktiska tid på sträckan

    Scenario: Valfri kontroll påverkar inte resultatet
      Givet en kontroll med status "Valfri"
      När en deltagare inte stämplat vid kontrollen
      Så är deltagaren godkänd

    Scenario: Valfri kontroll ger mellantid om den stämplas
      Givet en kontroll med status "Valfri"
      När en deltagare stämplat vid kontrollen
      Så registreras en mellantid

  Regel: Tidsjustering rättar en kontroll med fel klocka

    Scenario: Justering på formatet +/-MM:SS
      Givet en kontroll vars klocka går 30 sekunder fel
      När tidsjusteringen "-00:30" matas in
      Så justeras kontrollens stämplingstider med 30 sekunder

  Regel: Minsta sträcktid golvar tiden in mot kontrollen

    Scenario: Snabbare löpare justeras upp
      Givet en kontroll med minsta sträcktid 2:00
      När en deltagare tagit sträckan på 1:20
      Så räknas 2:00 för sträckan
      Och alla efterföljande tider justeras upp

    Scenario: Långsammare löpare behåller sin tid
      Givet en kontroll med minsta sträcktid 2:00
      När en deltagare tagit sträckan på 2:40
      Så räknas deltagarens faktiska tid 2:40

    Scenario: Radiotider kan bli felaktiga vid minsta sträcktid
      Givet en kontroll med minsta sträcktid
      När en radiotid rapporteras innan deltagaren gått i mål
      Så kan tiden vara felaktig, eftersom justeringen sker först vid målgång

  Regel: Ändringar på en kontroll får omedelbart genomslag

    Scenario: Alla resultat räknas om vid ändring
      Givet en tävling med beräknade resultat
      När en kontrolls status ändras
      Så räknas alla resultat om
      Och alla listor uppdateras
