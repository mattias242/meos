# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5506
# Kod: gdioutput.cpp (formulär), Table.cpp (tabelläge), autocomplete.cpp
Egenskap: Allmänna råd och tips
  Som användare av MeOS
  vill jag veta hur formulär, sparning och ändringar beter sig
  så att jag kan arbeta snabbt utan att tappa data.

  Regel: MeOS har två slags formulär

    Scenario: Egenskapsformulär beskriver ett objekt
      Givet en vald deltagare
      När deltagarens formulär visas
      Så innehåller det deltagarens egenskaper som namn, klass och bricknummer

    Scenario: Funktionsformulär utför en uppgift
      Givet funktionen "Lotta"
      När formuläret visas
      Så innehåller det inställningar för uppgiften och en utförandeknapp

  Regel: Egenskapsformulär sparas automatiskt

    Scenario: Ändring sparas när en annan deltagare väljs
      Givet en ändrad uppgift i en deltagares formulär
      När en annan deltagare väljs
      Så sparas ändringen utan att "Spara" behöver tryckas

    Scenario: Ändring sparas vid sidbyte
      Givet en ändrad uppgift i ett egenskapsformulär
      När en annan sida öppnas
      Så sparas ändringen

    Scenario: Ångra återställer till senast sparade värde
      Givet en ändrad men osparad uppgift
      När "Ångra" väljs
      Så återställs uppgiften till det senast sparade värdet

  Regel: Funktionsformulär kräver att utförandeknappen trycks

    Scenario: Uppgiften utförs först vid knapptryck
      Givet ett ifyllt funktionsformulär
      När utförandeknappen inte har tryckts
      Så har uppgiften inte utförts

    Scenario: ENTER motsvarar utförandeknappen
      Givet ett ifyllt funktionsformulär
      När ENTER trycks
      Så utförs uppgiften

  Regel: Tangentbordet räcker för navigering och autokomplettering

    Scenario: TAB växlar mellan formulärfält
      Givet ett formulär med flera fält
      När TAB trycks
      Så flyttas fokus till nästa fält

    Scenario: Autokomplettering föreslår namn och klubb ur databasen
      Givet en installerad klubb- och löpardatabas
      När början av ett namn skrivs i namnfältet
      Så visas matchande förslag i en lista

    Scenario: Förslag väljs med piltangenter och ENTER
      Givet en visad förslagslista
      När PIL NER trycks och därefter ENTER
      Så används det markerade förslaget

    Scenario: ESC stänger förslagslistan
      Givet en visad förslagslista
      När ESC trycks
      Så försvinner förslagen

  Regel: Ändringar får direkt effekt

    Scenario: Ändrad stämpelkod slår igenom omedelbart
      Givet en tävling med godkända deltagare
      När en kontrolls stämpelkod ändras
      Så kan deltagare bli felstämplade utan föregående varning
      Och ändringen kan lika snabbt göras ogjord

    Scenario: Åtgärder som inte går att ångra varnar först
      Givet en åtgärd som inte enkelt kan ångras
      När åtgärden begärs
      Så varnar MeOS innan den utförs

  Regel: Åtgärder kan utföras i valfri ordning

    Scenario: Tävlingen kan byggas upp bakifrån
      Givet MeOS utan förberedd tävling
      När brickor läses in, deltagare läggs in, banor och klasser definieras
         och löpare sätts ihop i lag
      Så kan stafettresultat skrivas ut

    Scenario: Uppenbara beroenden måste ändå respekteras
      Givet en klass som ska ha lottade starttider
      När deltagarna ska starta
      Så måste lottningen ha skett dessförinnan

  Regel: Tabelläget är kraftfullt vid många likartade ändringar

    Scenario: Tabellen kan filtreras och sorteras
      Givet tabelläget på sidan "Deltagare"
      När en kolumn sorteras och ett filter sätts
      Så visas de matchande raderna i den valda ordningen

    Scenario: Data klipps ut och klistras in mot kalkylprogram
      Givet en lottad klass vars starttider ska flyttas 10 minuter framåt
      När tabellen sorteras efter klass och starttiderna kopieras till Excel
      Och tiderna räknas om och kopieras tillbaka
      Så uppdateras starttiderna i MeOS

    Scenario: Inklistring fyller kolumnen nedåt
      Givet kopierade starttider i urklipp
      När den första rutan för klassen i starttidskolumnen markeras och klistras in
      Så fylls kolumnen på nedåt
