# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5415
# Kod: TabList.cpp, oListInfo.cpp, HTMLWriter.cpp, pdfwriter.cpp
Egenskap: Start- och resultatlistor
  Som sekretariat och publik
  vill jag kunna ta fram, anpassa, spara och exportera listor
  så att rätt information når rätt mottagare i rätt form.

  # Själva resultatberäkningen och placeringsreglerna dokumenteras i
  # resultatberakning-och-placering.feature.

  Regel: Varje lista kan skrivas ut och exporteras

    Scenario: Lista skrivs ut
      Givet en visad resultatlista
      När "Skriv ut" väljs
      Så skrivs listan ut

    Scenario: Lista sparas som PDF
      Givet en visad resultatlista
      När "PDF" väljs
      Så sparas listan som en PDF-fil

    Scenario: Lista sparas som HTML för webben
      Givet en visad resultatlista
      När "Webb" väljs
      Så sparas listan som en HTML-fil

    Scenario: Lista kopieras till urklipp
      Givet en visad lista
      När "Kopiera" väljs
      Så ligger listan i urklipp och kan klistras in i ett ordbehandlings- eller kalkylbladsprogram

    Scenario: Lista öppnas i ett eget fönster
      Givet en visad lista
      När "Eget fönster" väljs
      Så öppnas listan i ett separat fönster som kan flyttas till en extern skärm

    Scenario: Lista automatiseras
      Givet en visad lista
      När "Automatisera" väljs
      Så skapas en automat som skriver ut eller exporterar listan med jämna mellanrum

  Regel: Listans innehåll kan ställas in

    Scenario: Klassurval begränsar listan
      Givet en resultatlista
      När klassurvalet ändras under "Inställningar"
      Så visas endast de valda klasserna

    Scenario: Sidbrytning mellan klasser påverkar bara utskrift
      Givet en lista med sidbrytning mellan klasser
      När listan visas på skärmen
      Så påverkas inte skärmvyn
      Och utskriften bryter sida mellan klasserna

    Scenario: Åldersfiltrering begränsar deltagarna
      Givet en resultatlista
      När ett åldersintervall anges under "Inställningar"
      Så visas endast deltagare inom intervallet

    Scenario: Resultat räknas från eller till en viss kontroll
      Givet en resultatlista för en bana med radiokontroller
      När resultatet ställs in att räknas till en viss kontroll
      Så beräknas resultatet fram till den kontrollen

    Scenario: Topplista genom begränsat antal per klass
      Givet en resultatlista
      När "Begränsa antal per klass" sätts till 3
      Så visas de tre bästa i varje klass

    Scenario: Sträcka väljs när listan avser en stafett
      Givet en resultatlista i en tävling med sträckor
      När en sträcka väljs under "Inställningar"
      Så avser listan den sträckan

  Regel: Listans utseende kan ställas in

    Scenario: Färger ändras
      Givet en visad lista
      När bakgrundsfärg och textfärg ändras under "Utseende"
      Så visas listan med de valda färgerna

    Scenario: Listan visas i helskärm
      Givet en visad lista
      När helskärmsläge väljs under "Utseende"
      Så visas listan i helskärm

  Regel: Listinställningar kan sparas med tävlingen

    Scenario: Kom ihåg listan sparar inställningarna
      Givet en lista med anpassat klassurval
      När "Kom ihåg listan" väljs
      Så sparas inställningarna i tävlingen
      Och listan kan tas fram igen från sidan "Listor"

    Scenario: Sparad lista är tillgänglig för alla som öppnar tävlingen
      Givet en lista sparad med "Kom ihåg listan"
      När en annan användare öppnar tävlingen
      Så är listan tillgänglig

    Scenario: Två listor kan slås ihop
      Givet en sparad lista och ytterligare en lista
      När listorna slås ihop
      Så visas den ena listan direkt efter den andra

  Regel: Listorna uppdateras automatiskt

    Scenario: Visad lista uppdateras när en bricka läses in
      Givet en visad resultatlista
      När en bricka läses in
      Så uppdateras listan direkt

  Regel: Listorna är navigerbara

    Scenario: Klick på namn leder till deltagaren
      Givet en visad resultatlista
      När en deltagares namn klickas
      Så visas deltagaren

    Scenario: Klick på lagnamn leder till laget
      Givet en visad lagresultatlista
      När ett lagnamn klickas
      Så visas laget

  Regel: Grundinställningar gäller sidan Listor

    Scenario: Sträcktidsanalys ger uppskattade bomtider
      Givet grundinställningen "Med sträcktidsanalys"
      När en resultatlista visas
      Så innehåller den information om uppskattade bomtider

    Scenario: Sidbrytning mellan klubbar påverkar bara utskrift
      Givet grundinställningen sidbrytning mellan klubbar
      När en klubblista skrivs ut
      Så bryts sida mellan klubbarna

  Regel: Sparad lista kan nås över det lokala nätverket

    Scenario: Lista publiceras via informationsservern
      Givet en lista sparad i tävlingen
      När en informationsserver startas
      Så är listan tillgänglig som en webbsida på det lokala nätverket
