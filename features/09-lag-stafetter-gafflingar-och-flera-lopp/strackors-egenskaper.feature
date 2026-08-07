# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5475
# Kod: oClass (LegTypes: LTNormal/LTParallel/LTParallelOptional/LTExtra/
#      LTSum/LTIgnore/LTGroup), StartTypes, oTeam.cpp
Egenskap: Sträckors egenskaper
  Som arrangör med egna tävlingsregler
  vill jag ställa in sträcktyp, starttyp och löpare per sträcka
  så att klassen kan följa regler som inte finns fördefinierade.

  Regel: Sträcktypen styr hur sträckan löps och räknas

    Scenario: Normal löps efter föregående löpare
      Givet en sträcka med sträcktypen "Normal"
      När laget löper
      Så löps sträckan efter att föregående löpare gått i mål

    Scenario: Parallell löps samtidigt som föregående
      Givet sträcka 2 och 3 med sträcktypen "Parallell" efter en normal sträcka 1
      När laget löper
      Så löps sträcka 2 och 3 parallellt med samma starttid
      Och sträckans tid är den längsta av de parallellt löpandes
      Och sist i mål växlar ut nästa sträcka

    Scenario: Valbar tillåter att sträckan lämnas tom
      Givet en sträcka med sträcktypen "Valbar"
      När ingen löpare sätts in på sträckan
      Så accepteras det

    Scenario: Valbar avgörs av den som har längst tid
      Givet en patrull med en valbar sträcka besatt
      När patrullens tid räknas ut
      Så avgör den som har längst tid

    Scenario: Extra växlar ut på först i mål
      Givet en sträcka med sträcktypen "Extra"
      När löparna gått i mål
      Så växlar den som är först i mål ut nästa sträcka

    Scenario: Endast den växlande extra-löparen måste vara godkänd
      Givet en sträcka med extralöpare
      När en löpare som inte växlar stämplar fel eller utgår
      Så diskas inte laget

    Scenario: Extra sträckor kan lämnas vakanta
      Givet en sträcka med sträcktypen "Extra"
      När sträckan lämnas vakant
      Så diskas inte laget

    Scenario: Summera adderar tiden oberoende av när sträckan löps
      Givet en sträcka med sträcktypen "Summera"
      När lagets tid räknas ut
      Så adderas löparens sträcktid till lagets tid
      Och det är inte säkert att först i mål vinner

    Scenario: Medlöpare ignoreras i resultatet
      Givet en sträcka med sträcktypen "Medlöpare"
      När resultatet räknas ut
      Så ignoreras löparen
      Och löparen behöver ingen SI-pinne
      Men står med i listorna

    Scenario: Gruppera låter deltagaren springa eget lopp i egen klass
      Givet en sträcka med sträcktypen "Gruppera"
      När deltagaren löper
      Så ingår deltagaren i laget men springer sitt eget lopp i egen klass
      Och lagets resultat måste definieras i en egen resultatmodul

    Scenario: En deltagare kan bara ingå i ett lag
      Givet en deltagare i ett lag
      När deltagaren ska läggas till i ytterligare ett lag
      Så accepteras det inte

  Regel: Starttypen gäller sträcktyperna normal och summera

    Scenario: Starttid ger alla löpare samma tid
      Givet en sträcka med starttypen "Starttid" och starttiden 11:00:00
      När laget löper
      Så startar alla löpare på sträckan 11:00:00

    Scenario: Växling använder föregående sträckas måltid
      Givet en sträcka med starttypen "Växling"
      När föregående löpare går i mål
      Så används måltiden som starttid

    Scenario: Tilldelad lämnar starttiden orörd
      Givet en sträcka med starttypen "Tilldelad"
      När laget löper
      Så rör MeOS inte starttiden
      Och den måste tilldelas genom lottning, startstämpling eller annan metod

    Scenario: Jaktstart använder resultatet på föregående sträckor
      Givet en sträcka med starttypen "Jaktstart" och starttiden 12:00:00
      När startlistan sätts upp
      Så går första löparen i jaktstarten ut 12:00:00
      Och övriga efter resultatet på föregående sträckor

    Scenario: Starttypen gäller inte parallella sträckor
      Givet en sträcka med sträcktypen "Parallell"
      När starttypen ska sättas
      Så är inställningen inte tillämplig

  Regel: Växlingsordningen kan styras

    Scenario: Ordnat följer laguppställningens ordning
      Givet en sträcka med starttypen "Växling" och värdet "Ordnat"
      När föregående sträcka växlar
      Så går löparna ut i laguppställningens ordning

    Scenario: Först in växlar ut först i uppställningen
      Givet parallella sträckor med ordnad växling
      När den som är först in på föregående sträcka växlar
      Så växlar den ut den som står först i laguppställningen

    Scenario: En specificerad sträcka kan skicka ut
      Givet att löpare 1 ska växla till löpare 3 och löpare 2 till löpare 4
      När växlingen sätts till specificerad sträcka
      Så gäller det oavsett vem av löpare 1 och 2 som är snabbast

  Regel: Löparfältet styr vem som springer sträckan

    Scenario: Löparens nummer är normalt samma som sträckans
      Givet en vanlig stafett
      När sträckorna definieras
      Så är löparens nummer detsamma som sträckans nummer

    Scenario: Samma löpare kan springa flera sträckor
      Givet att samma löpare ska springa sträcka 1 och 3
      När "Str. 1" sätts i fältet "Löpare" på både sträcka 1 och sträcka 3
      Så springer samma löpare båda sträckorna

  Regel: Specialiserade regler bör provas i en testtävling

    Scenario: Testtävling verifierar tolkningen
      Givet en stafett med specialiserade regler
      När inställningarna gjorts
      Så bör en testtävling köras med manuellt inmatade resultat eller simulerad brickavläsning
