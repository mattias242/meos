# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5440
# Kod: TabAuto.cpp (stämplingstest), TabSI.cpp (porten "Testning")
Egenskap: Testa MeOS inför tävling
  Som arrangör
  vill jag simulera brickavläsningar och radiotider innan tävlingen
  så att datorer, nätverk och specialregler är kontrollerade i förväg.

  Regel: Specialfunktioner bör provas i förväg

    Scenario: Tävlingsform med specialregler kontrolleras
      Givet en tävlingsform med särskilda regler för resultatuträkning eller för lag och växlingar
      När tävlingen förbereds
      Så bör datorer, nätverk och regler testas i förväg

  Regel: Automaten Stämplingstest simulerar avläsningar

    Scenario: Simulerade brickavläsningar skickas in
      Givet en tävling med banor och starttider
      När automaten "Stämplingstest" startas med ett visst intervall
      Så skickas simulerade brickavläsningar in

    Scenario: Flera instanser ökar tempot
      Givet automaten "Stämplingstest"
      När flera instanser startas eller automaten körs på flera datorer
      Så ökar tempot i brickavläsningarna och nätverket stressas

    Scenario: Radiostämplingar kan genereras
      Givet automaten "Stämplingstest"
      När en kontroll väljs
      Så genereras radiostämplingar för den kontrollen

    Scenario: Testtävling skapas
      Givet automaten "Stämplingstest"
      När en testtävling med ett visst antal deltagare och klasser skapas
      Så finns en tävling att testa mot

    Scenario: Testtävling i nätverk skapas lokalt först
      Givet en testtävling som ska köras i nätverk
      När den skapas
      Så måste den skapas lokalt och sedan laddas upp på servern

  Regel: Manuell simulering ger kontrollerade fall

    Scenario: Testporten aktiveras
      Givet sidan "SportIdent"
      När porten "Testning" väljs och "Aktivera" klickas
      Så visas en panel för att mata in brickdata

    Scenario: Brickdata matas in och sparas
      Givet testpanelen
      När check, start, måltid, antal stämplingar och deras nummer matas in
      Och "Spara" väljs
      Så simuleras en riktig brickavläsning

    Scenario: Kontrollernas tider läggs ut mellan start och mål
      Givet en simulerad brickavläsning med start- och måltid
      När stämplingarna genereras
      Så läggs kontrollernas tider ut mellan start och mål

    Scenario: Befintlig bricka ger matchande stämpelkoder
      Givet ett bricknummer som används i tävlingen
      När numret matas in i testpanelen
      Så sätts stämpelkoderna så att de matchar brickan
      Och eventuell starttid justeras

    Scenario: Antalet stämplar måste väljas av användaren
      Givet en simulering mot en befintlig bricka
      När stämpelkoderna sätts automatiskt
      Så måste användaren själv se till att antalet stämplar räcker

    Scenario: Mål-, start- och radiostämpling kan simuleras
      Givet testpanelen
      När en mål-, start- eller radiostämpling simuleras
      Så registreras den i tävlingen
