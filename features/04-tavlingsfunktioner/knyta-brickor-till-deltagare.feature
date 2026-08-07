# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5513
# Kod: TabSI.cpp (tilldela hyrbrickor, interaktiv inläsning), oRunner (lopp-id)
Egenskap: Knyta brickor till deltagare
  Som funktionär vid incheckning
  vill jag interaktivt koppla ihop deltagare och bricka
  så att växlingsfållan kan bemannas snabbt och rätt.

  Regel: Funktionen körs interaktivt från sidan SportIdent

    Scenario: Interaktiv inläsning aktiveras
      Givet funktionen "Tilldela hyrbrickor" på sidan "SportIdent"
      När "Interaktiv inläsning" markeras
      Så efterfrågas deltagare och bricka en i taget

  Regel: Deltagaren pekas ut med nummerlapp, lopp-id eller namn

    Scenario: Sträckkodsläsare fyller i fältet
      Givet det interaktiva inmatningsfältet
      När en sträckkod läses med en sträckkodsläsare
      Så fylls fältet i

    Scenario: Namnsökning visar träffar under fältet
      Givet det interaktiva inmatningsfältet
      När början av ett namn skrivs in och inmatningen pausas
      Så visas sökresultatet under fältet

    Scenario: Lopp-id är unikt per lopp
      Givet en tävling med flera lopp per deltagare
      När lopp-id listas
      Så har varje lopp ett unikt id-nummer

    Scenario: Lopp-id hämtas ur tabellen på sidan Deltagare
      Givet tabellen på sidan "Deltagare"
      När kolumnen med lopp-id visas
      Så går alla lopp-id att läsa ut och trycka som sträckkod på nummerlappen

    Scenario: Egna lopp-id kan definieras
      Givet tabellen på sidan "Deltagare"
      När egna lopp-id klistras in i tabellen
      Så används de i stället

    Scenario: Ersättaren tar över lopp-id vid vakanstillsättning
      Givet en vakans med ett tilldelat lopp-id
      När vakansen tillsätts med en deltagare
      Så tar deltagaren över det tidigare lopp-id:t

    Scenario: Ersättaren tar över lopp-id vid byte i lag
      Givet en lagmedlem med ett tilldelat lopp-id
      När lagmedlemmen byts ut
      Så tar ersättaren över det tidigare lopp-id:t

  Regel: Brickan läses av eller skrivs in

    Scenario: Automatisk knytning efter inläsning
      Givet att "Knyt automatiskt efter inläsning" är markerad
      När brickan läses av
      Så knyts bricka och deltagare omedelbart

    Scenario: Manuell bekräftelse när automatik är avslagen
      Givet att "Knyt automatiskt efter inläsning" inte är markerad
      När brickan läses av
      Så måste knytningen bekräftas med "OK"

  Regel: Hyrstatus kan sättas manuellt eller automatiskt

    Scenario: Brickan markeras som hyrd
      Givet en bricka som ska knytas till en deltagare
      När "Hyrd" markeras
      Så markeras den tilldelade brickan som hyrbricka

    Scenario: Fördefinierade hyrbrickor sätter hyrstatus automatiskt
      Givet en lista med fördefinierade hyrbrickor
      När "Automatisk hyrbrickshantering genom registrerade brickor" väljs
      Så sätts hyrstatusen automatiskt utifrån listan
