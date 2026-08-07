# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5457
# Kod: TabSI.cpp (registrera hyrbrickor)
Egenskap: Fördefinierade hyrbrickor
  Som materialansvarig
  vill jag registrera hyrbrickornas nummer i förväg
  så att hyrbricka markeras automatiskt vid anmälan.

  Regel: Hyrbrickorna registreras på sidan SportIdent

    Scenario: Brickor läses in från en textfil
      Givet en textfil med ett bricknummer per rad
      När funktionen "Registrera hyrbrickor" används och filen importeras
      Så registreras brickorna som hyrbrickor

    Scenario: Brickor stämplas in med en SI-enhet
      Givet funktionen "Registrera hyrbrickor" med en ansluten SI-enhet
      När brickorna stämplas in
      Så registreras deras nummer

    Scenario: Enheten bör programmeras som kontroll
      Givet en SI-enhet som ska användas för registrering
      När den programmeras som kontroll
      Så går inläsningen av bricknumret snabbare

  Regel: Registrerade brickor markeras automatiskt vid anmälan

    Scenario: Hyrbricka markeras utan handpåläggning
      Givet en registrerad hyrbricka med nummer 500123
      När en deltagare anmäls med bricka 500123
      Så markeras brickan automatiskt som hyrbricka

  Regel: Listan kan hanteras

    Scenario: Listan nollställs
      Givet en lista med registrerade hyrbrickor
      När "Nollställ" väljs
      Så glöms alla hyrbrickor bort

    Scenario: Listan exporteras till textfil
      Givet en lista med registrerade hyrbrickor
      När "Exportera" väljs
      Så sparas hyrbrickorna i en textfil

    Scenario: Exporterad fil återanvänds i nya tävlingar
      Givet en exporterad hyrbricksfil
      När den importeras i en ny tävling
      Så registreras samma hyrbrickor där

    Scenario: Rapport skrivs ut
      Givet en lista med registrerade hyrbrickor
      När "Skriv ut" väljs
      Så skrivs en rapport ut

    Scenario: Enskild bricka tas bort ur listan
      Givet en lista med registrerade hyrbrickor
      När en bricka klickas i listan
      Så tas den bort ur listan

  Regel: Listan blir datorns standardlista

    Scenario: Import eller export gör listan till standard på datorn
      Givet en dator där hyrbrickslistan importerats eller exporterats
      När en ny tävling skapas på datorn
      Så läggs listan in automatiskt
