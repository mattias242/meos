# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5514
# Kod: oCourse (avkortad banvariant), oRunner::evaluateCard
Egenskap: Avkortade banor
  Som arrangör
  vill jag låta vissa deltagare springa en kortare variant i samma klass
  så att exempelvis omstartande löpare kan få en kortare bana.

  Regel: Avkortningen kopplas till den vanliga banan

    Scenario: Avkortad variant pekas ut på den långa banan
      Givet en lång bana och en kortare bana upplagda på sidan "Banor"
      När den långa banan väljs och "Med avkortning" markeras
      Och den kortare banan väljs som avkortad banvariant
      Så är den kortare banan en avkortning av den långa

    Scenario: Slingbana kan avkortas genom färre slingor
      Givet en bana med slingor där "Med avkortning" är markerad
      När färre slingor väljs som avkortad variant
      Så sker avkortningen genom att inte springa alla slingor

    Scenario: Flera nivåer av avkortning
      Givet en avkortad bana
      När en avkortning definieras även av den avkortade banan
      Så finns ytterligare en nivå av avkortning

  Regel: Banvarianten avgörs vid avläsning

    Scenario: MeOS väljer variant utifrån brickan
      Givet en klass med en lång bana och en avkortad variant
      När en deltagares bricka läses av med den avkortade variantens kontroller
      Så bedöms deltagaren mot den avkortade varianten

  Regel: Kortare bana placeras efter längre

    Scenario: Avkortad variant hamnar bakom den långa i resultatlistan
      Givet en deltagare på den långa banan med tiden 45:00
      Och en deltagare på den avkortade varianten med tiden 30:00
      När resultatlistan för klassen visas
      Så placeras deltagaren på den avkortade varianten efter den på den långa
