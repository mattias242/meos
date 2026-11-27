# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5521
# Kod: maprenderer.cpp, utm.cpp
Egenskap: Lokalisera kartan
  Som sekretariat
  vill jag kunna georeferera kartbilden även utan world-fil
  så att banor och kontroller hamnar rätt på kartan.

  Regel: World-fil är den enklaste vägen

    Scenario: World-fil i UTM följer med kartbilden
      Givet en world-fil med koordinater i UTM-projektion från samma program som kartbilden
      När kartan importeras
      Så är kartan lokaliserad

  Regel: Manuell inpassning görs med två kontroller

    Scenario: Kontrollerna placeras ut på kartbilden
      Givet en importerad kartbild utan world-fil
      När "Justera karta" väljs på sidan "Banor"
      Så visas kartbilden och två av MeOS valda kontroller

    Scenario: Varje kontroll placeras genom klick
      Givet den manuella inpassningen
      När en kontroll väljs och en punkt på kartan klickas
      Så placeras kontrollen där

    Scenario: Placeringen kan göras om
      Givet en utplacerad kontroll
      När kartan klickas igen
      Så flyttas kontrollen till den nya punkten

    Scenario: Inpassningen sparas
      Givet två utplacerade kontroller
      När "Spara inpassning" väljs
      Så är kartan lokaliserad

  Regel: Textstorleken kan ökas för bättre inzoomning

    Scenario: Större text ger större inzoomning
      Givet en kartbild i låg upplösning som blir svår att markera i
      När textstorleken ökas på MeOS första sida
      Så blir inzoomningen större

  Regel: Kartbilden kan bytas ut

    Scenario: Ny kartbild importeras
      Givet en tävling med en importerad karta
      När "Importera ny karta" väljs
      Så ersätts kartbilden
