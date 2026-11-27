# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5430
# Kod: HTMLWriter.cpp (mallar, .meostmpl)
Egenskap: Export till HTML/Webb
  Som arrangör
  vill jag exportera listor till HTML med valfri mall
  så att resultat kan visas på webben och på TV-skärmar.

  Regel: Två inbyggda dokumentformat

    Scenario: Strukturerat dokument bygger på en tabell
      Givet en visad lista
      När "Webb" väljs med formatet "Strukturerat"
      Så byggs listan upp genom en osynlig tabell
      Och tabellstrukturen kan klistras in i ett ordbehandlingsprogram och redigeras

    Scenario: Formaterat dokument placerar varje textelement
      Givet en visad lista
      När "Webb" väljs med formatet "Formaterat"
      Så placeras varje textelement ut med angiven placering
      Och dokumentet liknar hur listan ser ut i MeOS

  Regel: Skalfaktor och automatisk omladdning kan sättas

    Scenario: Textstorleken skalas
      Givet HTML-exportens inställningar
      När en skalfaktor anges
      Så skalas textens storlek med den faktorn

    Scenario: Webbläsaren laddar om automatiskt
      Givet HTML-exportens inställningar
      När ett omladdningsintervall anges
      Så instrueras webbläsaren att ladda om sidan med det intervallet

  Regel: Inställningarna kan lagras, automatiseras eller exporteras direkt

    Scenario: Lagra inställningar sparar listan
      Givet en lista vars inställningar inte sparats tidigare
      När "Lagra inställningar" väljs
      Så öppnas dialogen för att spara listan med de aktuella inställningarna

    Scenario: Redan sparad lista uppdateras
      Givet en lista som sparats tidigare
      När "Lagra inställningar" väljs
      Så uppdateras de sparade inställningarna

    Scenario: Automat exporterar regelbundet
      Givet en lista med HTML-inställningar
      När "Automatisera" väljs
      Så skapas en automat som regelbundet exporterar listan till HTML

    Scenario: Direkt export till fil
      Givet en lista med HTML-inställningar
      När "Exportera" väljs och en fil anges
      Så exporteras listan direkt

  Regel: Mallar styr utseendet

    Scenario: Mallen sidor med kolumner växlar sidor
      Givet mallen "Sidor med kolumner"
      När listan exporteras
      Så visas listan som kolumner på separata sidor som växlar med ett tidsintervall
      Och data laddas om när hela listan visats

    Scenario: Marginal styr vitt område
      Givet en mallbaserad export
      När marginalen ändras
      Så ändras det vita området runt texten

    Scenario: Kolumner delar upp sidan
      Givet en mallbaserad export
      När antalet kolumner sätts
      Så delas varje sida upp i det antalet kolumner

    Scenario: Visningstid styr sidbyte eller rullningshastighet
      Givet en mallbaserad export
      När visningstiden sätts
      Så styr den hur länge varje sida visas eller hur snabbt texten rullar

    Scenario: Antal rader per sida kan begränsas
      Givet en mallbaserad export
      När "Begränsa antal rader per sida" sätts
      Så bryts sidan när gränsen nås

    Scenario: Sidbrytning mellan klasser gäller även HTML-export
      Givet en lista med sidbrytning mellan klasser
      När listan exporteras till HTML
      Så blir det minst en kolumn eller sida per klass

  Regel: Länkade listor kan fördelas på kolumner

    Scenario: En lista per kolumn när antalet stämmer
      Givet en sparad lista som är en ihopslagning av startlista och resultatlista
      När HTML exporteras med exakt två kolumner
      Så placeras startlistan i den ena kolumnen och resultatlistan i den andra

    Scenario: Kolumnerna balanseras när antalet inte styrs
      Givet en ihopslagen lista
      När HTML exporteras utan att kolumnantalet matchar antalet listor
      Så balanserar MeOS kolumnerna så att de blir ungefär lika stora

  Regel: Egna mallar kan installeras

    Scenario: Inbyggda mallar ligger som .meostmpl-filer
      Givet en MeOS-installation
      När mallarna letas upp
      Så ligger de som .meostmpl-filer i installationskatalogen

    Scenario: Mall exporteras för redigering
      Givet ett mallbaserat format
      När "Exportera mall" väljs under mallhantering
      Så sparas mallfilen

    Scenario: Egen mall installeras
      Givet en redigerad mallfil
      När mallen installeras
      Så blir den valbar vid export

    Scenario: Varje mall måste ha en unik tagg
      Givet en egen mallfil
      När taggen anges på andra raden i formen "[tag]@[name]"
      Så identifieras mallen med den taggen
