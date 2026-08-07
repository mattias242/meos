# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5494
# Kod: image.cpp, metalist.cpp (bildposter)
Egenskap: Bilder i listor
  Som arrangör
  vill jag lägga in loggor och reklam i listor och sträcktidsutskrifter
  så att sponsorer syns och listorna får rätt profil.

  Regel: Bilden ska vara en PNG-fil

    Scenario: Bilden sparas i png med lämplig upplösning
      Givet en bild som ska in i en lista
      När den förbereds
      Så ska den sparas i filformatet png med lämplig upplösning

  Regel: Bilden läggs in där den ska visas

    Scenario: Befintlig bild återanvänds
      Givet en bild som redan används i tävlingen
      När "Lägg till bild" väljs
      Så kan den befintliga bilden väljas

    Scenario: Ny bild bläddras fram
      Givet listredigeraren
      När "Ny bild" väljs
      Så går det att bläddra fram och välja en fil

  Regel: Dimensioner och placering kan ställas in

    Scenario: Höjd och bredd anges i MeOS-pixlar
      Givet en bild i en lista
      När höjd och bredd anges
      Så visas bilden i den storleken

    Scenario: Proportionerna kan bevaras
      Givet en bild med angiven höjd och bredd
      När "Bevara höjd/bredd-relationen" väljs
      Så respekteras bildens proportioner

    Scenario: Bilden kan förskjutas
      Givet en bild i en lista
      När en horisontell och vertikal förskjutning anges
      Så flyttas bilden relativt ursprungspositionen

  Regel: Genomskinlighet och lagerordning

    Scenario: Vitt kan tolkas som genomskinligt
      Givet en bild med vit bakgrund
      När "Tolka vitt som genomskinligt" väljs
      Så tolkas vit färg som bakgrund

    Scenario: Exakt transparens i png-filen fungerar också
      Givet en png-fil med alfakanal
      När bilden visas
      Så respekteras transparensen

    Scenario: Bilden kan placeras under texten
      Givet en bild i en lista
      När "Placera bild under text" väljs
      Så används bilden som bakgrund
      Och listans text skrivs ovanpå bilden
