# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5461
# Kod: oevent_transfer.cpp (slå ihop tävlingar), TabCompetition.cpp
Egenskap: Slå ihop tävlingar och hantera sekretariat på flera platser
  Som arrangör med sekretariat på flera platser
  vill jag kunna slå ihop ändringar från oberoende kopior av tävlingen
  så att data kan utbytas med filer när gemensamt nätverk saknas.

  Regel: Hopslagning kräver en gemensam basversion

    Scenario: Basversionen exporteras till varje sekretariat
      Givet en färdigställd tävling
      När den exporteras till en fil och importeras på varje plats
      Så har alla sekretariat samma basversion

    Scenario: Även oberoende tävlingar kan slås ihop
      Givet två oberoende tävlingar baserade på samma uppsättning banor
      När de ska slås ihop
      Så stöds det

  Regel: Ändringar slås ihop i huvudsekretariatet

    Scenario: Kopia med ändringar exporteras från ett distribuerat sekretariat
      Givet ett distribuerat sekretariat med gjorda ändringar
      När en ny kopia av tävlingen exporteras
      Så innehåller filen ändringarna

    Scenario: Filen granskas innan hopslagning
      Givet en överförd fil på huvudsekretariatets dator
      När "Slå ihop tävling" väljs och filen anges
      Så visas information om filen innan hopslagningen bekräftas

    Scenario: Hopslagningen införlivar ändringarna
      Givet en granskad fil
      När "Slå ihop" väljs
      Så införlivas ändringarna i den aktuella tävlingen

    Scenario: En automatisk kopia sparas före hopslagningen
      Givet en förestående hopslagning
      När den utförs
      Så skapas först en lokal automatisk kopia av tävlingen som den såg ut innan

    Scenario: Resultatet återförs till de distribuerade sekretariaten
      Givet en genomförd hopslagning på huvudsekretariatet
      När tävlingen exporteras och importeras på det distribuerade sekretariatet
      Så har det platsen samma data

    Scenario: Överföring kan ske flera gånger
      Givet en pågående tävling
      När data utbyts flera gånger under tävlingen eller en gång i efterhand
      Så fungerar hopslagningen i båda fallen

  Regel: Sekretariaten får inte ändra i samma del av tävlingen

    Scenario: Överlappande ändringar kan skrivas över
      Givet två sekretariat som ändrar i samma del av tävlingen
      När tävlingarna slås ihop
      Så kan vissa ändringar bli överskrivna

    Scenario: Strikt uppdelning per klass eller sträcka
      Givet flera sekretariat
      När arbetet delas upp
      Så bör uppdelningen vara strikt i vilka klasser eller sträckor som hanteras var

  Regel: Utbytet måste följa en fast topologi

    Scenario: Stjärna med ett huvudsekretariat
      Givet sekretariaten A, B, C och D där A är huvudsekretariat
      När data utbyts
      Så sker utbytet A–B, A–C och A–D
      Och aldrig direkt mellan B och C

    Scenario: Kedja där data vandrar steg för steg
      Givet sekretariaten A, B, C och D i en kedja
      När en ändring i D ska nå A
      Så överförs den först till C, sedan till B och till sist till A
      Och data får inte överföras direkt mellan A och C
