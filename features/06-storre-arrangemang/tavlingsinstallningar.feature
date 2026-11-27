# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5454
# Kod: oEvent (oDataContainer-fält), cardsystem.cpp (.cardsystem-fil),
#      iof30interface.cpp (UTC-export)
Egenskap: Tävlingsinställningar
  Som arrangör
  vill jag ställa in arrangörsuppgifter, avgifter, valuta, maxtid och brickregler
  så att fakturor, resultat och export blir rätt för den här tävlingen.

  Regel: Arrangörsuppgifter används vid fakturering

    Scenario: Adress, konto och sista betalningsdatum används på fakturan
      Givet tävlingsinställningarna på sidan "Tävling"
      När arrangörens adressuppgifter, konto och sista betalningsdatum matas in
      Så används de när fakturor genereras

  Regel: Avgifter sätts per klasstyp

    Scenario: Avgifter och brickhyra anges
      Givet tävlingsinställningarna
      När avgifter för olika klasstyper och brickhyra anges
      Så gäller de som standard i tävlingen

    Scenario: Avgiftshöjning i procent ger standardvärdet för efteranmälan
      Givet en angiven avgiftshöjning i procent
      När en klass skapas
      Så beräknas den förhöjda avgiften utifrån ordinarie avgift

    Scenario: Importerade avgifter går före de inställda
      Givet en tävling importerad från Eventor med avgifter
      När avgifterna bestäms
      Så används avgifterna från importfilen

    Scenario: Stoppdatum två ger högre avgift på tävlingsdagen
      Givet ett andra stoppdatum satt till tävlingsdagen med kopplad höjning
      När en deltagare anmäls den dagen
      Så tas den högre avgiften ut

  Regel: Åldersgränser styr reducerad avgift

    Scenario: Lägre gräns ger ungdomsrabatt
      Givet en inställd lägre åldersgräns
      När en deltagare under gränsen anmäls
      Så används den reducerade avgiften

    Scenario: Högre gräns ger pensionärsrabatt
      Givet en inställd högre åldersgräns
      När en deltagare över gränsen anmäls
      Så används den reducerade avgiften

  Regel: Avgifterna verkar på tre nivåer

    Scenario: Tävling, klass och deltagare
      Givet inställda avgifter på tävlingen
      När klasser och deltagare skapas
      Så tillämpas avgifterna först på varje klass och därefter på varje deltagare

  Regel: Valuta konfigureras

    Scenario: Valutasymbol visas i gränssnittet
      Givet valutasymbolen "kr"
      När ett belopp visas
      Så visas symbolen

    Scenario: Valutakod används i exportformat
      Givet valutakoden "SEK"
      När data exporteras
      Så används koden

    Scenario: Symbolen kan placeras före beloppet
      Givet valutasymbolen "£" och inställningen "Valutasymbol före"
      När ett belopp visas
      Så skrivs det "£10"

    Scenario: Decimaler kan tillåtas
      Givet att "Tillåt decimaler" är markerat
      När ett belopp matas in med decimaler
      Så accepteras det
      Och det angivna decimaltecknet används

  Regel: Maxtid diskvalificerar långsamma deltagare

    Scenario: Deltagare över maxtiden godkänns inte
      Givet en angiven maxtid
      När en deltagare överskrider den
      Så godkänns inte deltagaren

  Regel: Tider kan exporteras i UTC

    Scenario: Standard är MeOS egna tider med datorns tidszon
      Givet en tävling utan UTC-export
      När IOF-XML exporteras
      Så skrivs tiderna som de är angivna i MeOS
      Och tidszonen anges efter datorns inställning

    Scenario: UTC-export ger samma tidsangivelse oavsett plats
      Givet att "Exportera tider i UTC" är markerat
      När en startlista exporteras i Sverige och importeras i USA
      Så uttrycks starttiderna i lokal amerikansk tid där

  Regel: Äldre brickor kan varnas för eller hindras

    Scenario: Varning vid användning av äldre bricka
      Givet inställningen att varna för äldre brickor
      När en äldre bricka används
      Så varnar MeOS

    Scenario: Direktanmälan hindras med äldre bricka
      Givet inställningen att hindra äldre brickor
      När en äldre bricka används vid direktanmälan
      Så hindras anmälan

    Scenario: Vad som är en äldre bricka definieras i en fil
      Givet en fil av typen .cardsystem i MeOS installationskatalog
      När brickans ålder bedöms
      Så används informationen i filen
      Och filen kan redigeras om förutsättningarna ändrats
