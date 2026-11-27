# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5500
# Kod: generalresult.cpp (declareSymbol/addSymbol)
# Fullständig symboltabell: docs/MRL_SYMBOLER.md
Egenskap: Definierade symboler
  Som skribent av en resultatmodul
  vill jag veta vilka symboler MeOS ställer till förfogande och vad de betyder
  så att jag kan hämta rätt data i mina regler.

  # De 87 symbolnamnen med betydelser listas i docs/MRL_SYMBOLER.md.
  # Här dokumenteras reglerna för hur symbolerna fungerar.

  Regel: Symboler finns i två uppsättningar

    Scenario: Deltagarsymboler i den individuella regeluppsättningen
      Givet en regel för individuella lopp
      När symbolerna slås upp
      Så är deltagarens symboler tillgängliga

    Scenario: Lagsymboler i lagregeluppsättningen
      Givet en regel för lag
      När symbolerna slås upp
      Så är lagets symboler tillgängliga

    Scenario: Antal deltagare i laget
      Givet en lagregel
      När "RunnerStatus.size()" används
      Så returneras antalet deltagare i laget

  Regel: Vektorer och matriser markeras i dokumentationen

    Scenario: Enkelhake markerar vektor
      Givet en symbol skriven med "[]"
      När den används
      Så är den av vektortyp

    Scenario: Dubbelhake markerar matris
      Givet en symbol skriven med "[][]"
      När den används
      Så är den av matristyp

  Regel: Modulens egna beräkningar finns som symboler

    Scenario: ComputedStatus, ComputedTime och ComputedPoints
      Givet en resultatmodul
      När en regel behöver modulens egna resultat
      Så finns "ComputedStatus", "ComputedTime" och "ComputedPoints"

  Regel: Ingångsvärden från tidigare etapper

    Scenario: Input-symbolerna bär ingångsställningen
      Givet en etapp med överförda resultat
      När en regel körs
      Så innehåller "InputStatus", "InputTime", "InputPlace" och "InputPoints" ingångsställningen

    Scenario: Stage-symbolerna är vektorer över etapperna
      Givet en tävling med flera etapper
      När en regel körs
      Så innehåller "StageTime", "StageStatus", "StagePlace" och "StagePoints" värden per etapp

  Regel: Statuskoderna finns som symboler

    Scenario: Statuskoder används som returvärden
      Givet en statusregel
      När ett returvärde ska anges
      Så används symboler som "StatusOK", "StatusMP" och "StatusDQ"

    Scenario: Den felstavade StatusNotCompetiting är föråldrad
      Givet symbolerna "StatusNotCompeting" och "StatusNotCompetiting"
      När en regel skrivs
      Så ska "StatusNotCompeting" användas
      Och "StatusNotCompetiting" är kvar endast för bakåtkompatibilitet

  Regel: Rogainingsymbolerna

    Scenario: RGTimeLimit är tidsgränsen
      Givet en rogainingbana med maxtid
      När "RGTimeLimit" läses
      Så innehåller den banans tidsgräns

    Scenario: RGPointLimit är poänggränsen trots sin beskrivning
      Givet en rogainingbana med en minsta poänggräns
      När "RGPointLimit" läses
      Så innehåller den poänggränsen även om symbolens beskrivning i koden felaktigt säger "tidsgräns"

  Regel: Brickans data finns som parallella vektorer

    Scenario: Stämplingskoder, tider och matchade kontroller
      Givet en deltagare med avläst bricka
      När brickans data läses
      Så finns "CardPunches", "CardTimes" och "CardControls"

    Scenario: Omatchade stämplingar markeras med minus ett
      Givet en stämpling som inte kunde matchas mot banan
      När "CardControls" läses
      Så är motsvarande element -1
