# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5427
# Kod: TabAuto.cpp (skript efter export)
Egenskap: Exportera listor till webben
  Som arrangör
  vill jag ladda upp de exporterade listorna till en webbserver automatiskt
  så att resultaten syns på klubbens hemsida under tävlingen.

  Regel: Automatens skript körs efter varje export

    Scenario: Skript laddar upp de exporterade filerna
      Givet en automat som exporterar en lista i webbformat
      Och ett skript som laddar upp filer via ftp
      När exporten är klar
      Så körs skriptet och filerna laddas upp

    Scenario: Skriptet pekas ut i automaten
      Givet en automat
      När exportfilen sätts till "c:\temp\meosexport\resultat.html"
      Och skriptet sätts till "c:\temp\meosexport\send.bat"
      Så exporteras listan dit och skriptet körs efter varje export

  Regel: Skriptet bör provköras innan tävlingen

    Scenario: Provkörning med en egen fil
      Givet ett uppladdningsskript och en egen html-fil i exportmappen
      När skriptet körs för hand
      Så laddas filen upp till servern

  Regel: Ett skript räcker för flera automater

    Scenario: Gemensam exportmapp gör att ett skript räcker
      Givet flera automater som exporterar till samma mapp
      När skriptet körs från en av dem
      Så laddas samtliga filer upp

  Regel: Även startlistan kan publiceras live

    Scenario: Startlistan publiceras löpande
      Givet många sena ändringar i startlistan
      När en automat exporterar startlistan
      Så publiceras den löpande
