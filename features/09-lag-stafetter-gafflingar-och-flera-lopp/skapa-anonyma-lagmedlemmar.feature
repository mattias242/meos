# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5478
# Kod: TabTeam.cpp (skapa anonyma lagmedlemmar), _VacantName
Egenskap: Skapa anonyma lagmedlemmar
  Som sekretariat
  vill jag fylla tomma sträckor med anonyma löpare
  så att lottning, brickor och avgifter kan hanteras innan laguppställningen är klar.

  Regel: Anonyma medlemmar skapas på tomma sträckor

    Scenario: N.N. läggs till där uppställning saknas
      Givet lag med sträckor utan tilldelad löpare
      När "Skapa anonyma lagmedlemmar" väljs på sidan "Lag"
      Så skapas anonyma lagmedlemmar (N.N.) på dessa sträckor

    Scenario: Anonyma medlemmar ersätts senare
      Givet anonyma lagmedlemmar
      När de riktiga lagmedlemmarna blir kända
      Så kan de anonyma ersättas

  Regel: Anonyma medlemmar behövs för vissa åtgärder

    Scenario: Lottning kräver löpare på sträckorna
      Givet lag med tomma sträckor
      När starttider ska lottas
      Så behövs anonyma lagmedlemmar

    Scenario: Bricknummer kan tilldelas anonyma medlemmar
      Givet anonyma lagmedlemmar
      När bricknummer tilldelas
      Så kopplas brickorna till lagets sträckor

    Scenario: Anmälningsavgifter kan tilldelas
      Givet anonyma lagmedlemmar
      När anmälningsavgifter tilldelas
      Så räknas de in i lagets avgift
