# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5459
# Kod: iof30interface.cpp (Service, ServiceRequest)
Egenskap: Importera startgrupper
  Som arrangör som tar emot anmälningar via Eventor
  vill jag importera startgrupper som IOF-XML-tjänster
  så att deltagarnas önskemål följer med anmälan.

  Regel: Tjänstens namn måste innehålla två tidpunkter

    Scenario: Tjänst tolkas som startgrupp
      Givet en IOF-XML-tjänst med namnet "Start mellan 10:00 och 11:00"
      När tjänsterna importeras
      Så tolkas tjänsten som en startgrupp

    Scenario: Importen kan inspekteras
      Givet importerade tjänster
      När "Startgrupper" öppnas på sidan "Klasser"
      Så går importen att inspektera

  Regel: Tjänstebeställningar tilldelar startgrupp

    Scenario: Beställd tjänst ger deltagaren startgruppen
      Givet importerade startgrupper
      När en tjänstebeställning med matchande id importeras
      Så tilldelas deltagaren motsvarande startgrupp

    Scenario: Importen görs under anmälningsdata
      Givet sidan "Tävling"
      När "Importera anmälningsdata" och "Anmälningar" väljs
      Så kan tjänster och tjänstebeställningar importeras

    Scenario: Filerna hämtas manuellt från Eventor
      Givet tjänster definierade i Eventor
      När de ska in i MeOS
      Så måste filerna med tjänster och tjänstebeställningar laddas ner manuellt

  Regel: Beställning utan anmälan hanteras

    Scenario: Deltagare utan klass skapas
      Givet en tjänstebeställning för en deltagare som inte är anmäld
      När tjänsten importeras
      Så skapas deltagaren utan klass

    Scenario: Varning ges för beställning utan anmälan
      Givet en tjänstebeställning utan motsvarande anmälan
      När importen körs
      Så varnar MeOS
      Och posterna kan tas bort, enklast i tabelläget
