# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5416
# Kod: iof30interface.cpp, oImportExport.cpp
Egenskap: Export av resultat och sträcktider
  Som arrangör
  vill jag exportera resultat och sträcktider i IOF-XML
  så att de kan laddas upp till WinSplits Online och Eventor.

  Regel: Exporten görs från sidan Tävling

    Scenario: Sträcktidsfil sparas i IOF-XML
      Givet en genomförd tävling
      När "Exportera sträcktider" väljs på sidan "Tävling"
      Så sparas en fil i formatet IOF-XML

  Regel: Tävlingar med flera sträckor kan exporteras på tre sätt

    Scenario: Individuella resultat per sträcka
      Givet en tävling med flera sträckor
      När exportvalet "individuella resultat per sträcka" görs
      Så innehåller filen ett resultat per sträcka och löpare

    Scenario: Totalresultat
      Givet en tävling med flera sträckor
      När exportvalet "totalresultat" görs
      Så innehåller filen lagens totalresultat

    Scenario: En separat resultatfil per sträcka
      Givet en tävling med tre sträckor
      När exportvalet "separat resultatfil per sträcka" görs
      Så skapas tre filer

  Regel: Flera lopp per löpare kan tas med eller uteslutas

    Scenario: Flera lopp inkluderas i filen
      Givet en tävling där samma löpare gör flera lopp
      När "inkludera information om flera lopp per löpare" markeras
      Så innehåller filen samtliga lopp per löpare

    Scenario: Eventor kräver att flera lopp inom en etapp utesluts
      Givet en tvåmannastafett där samma löpare gör flera lopp inom etappen
      När filen ska laddas upp till Eventor
      Så måste alternativet för flera lopp per löpare avmarkeras

  Regel: Slingor kan exporteras på tre sätt

    Scenario: Slingor exporteras som om alla sprang dem i samma ordning
      Givet en tävling med slingbanor
      När exportvalet "samma ordning" görs
      Så redovisas alla löpare med slingorna i samma ordning

    Scenario: Slingor exporteras som raka banor
      Givet en tävling med slingbanor
      När exportvalet "slingor som raka banor" görs
      Så lämpar sig filen för sträcktidsanalys och jämförelse

    Scenario: Slingor exporteras i faktisk ordning
      Givet en tävling med slingbanor
      När exportvalet "faktisk ordning" görs
      Så redovisas varje deltagares slingor i den ordning de sprangs
      Och filen kan kopplas till GPS-spår

  Regel: Preliminära resultat och radiotider kan tas med

    Scenario: Endast kompletta resultat exporteras
      Givet en pågående tävling
      När exportvalet "bara kompletta resultat" görs
      Så innehåller filen endast deltagare med färdigt resultat

    Scenario: Preliminära resultat och radiotider inkluderas
      Givet en pågående tävling med radiokontroller
      När preliminära resultat och radiotider inkluderas
      Så innehåller filen även radiopasseringar och preliminära resultat

  Regel: MeOS interna id kan tas med

    Scenario: Internt id skrivs till filen
      Givet en tävling
      När "Inkludera MeOS interna id" markeras
      Så innehåller filen ett id som är unikt för varje deltagare i tävlingen
      Och id:t identifierar inte deltagaren i nationella register

  Regel: IOF-XML 2.0.4 saknar bra stöd för patruller

    Scenario: Andra patrullmedlemmens namn skrivs i klubbfältet
      Givet en patrullklass med två medlemmar
      När resultat exporteras i IOF-XML version 2.0.4
      Så skrivs den andra patrullmedlemmens namn i fältet för klubbnamn

  Regel: Exporten kan automatiseras

    Scenario: Automat exporterar med jämna mellanrum
      Givet sidan "Automater"
      När automaten "Export av resultat/sträcktider" skapas
      Så exporteras filen med jämna mellanrum eller när tävlingsdata ändras
