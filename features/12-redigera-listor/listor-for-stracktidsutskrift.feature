# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5495
# Kod: metalist.cpp (sträcktidslista), TabSI.cpp (sträcktidsutskrift)
Egenskap: Listor för sträcktidsutskrift
  Som listkonstruktör
  vill jag kunna använda en egen lista som sträcktidsutskrift
  så att kvittot innehåller precis det tävlingen vill förmedla.

  Regel: Listan måste märkas som sträcktidslista

    Scenario: Användning för sträcktidsutskrift aktiveras
      Givet listredigeraren
      När "Sträcktidslista" väljs och "Använd listan för sträcktidsutskrift" markeras
      Så kan listan användas för automatisk utskrift på sträcktidsskrivare

    Scenario: Listan väljs som standard för tävlingen eller vissa klasser
      Givet en sparad sträcktidslista
      När sträcktidsinställningarna görs
      Så kan listan väljas som standardlista för tävlingen eller för valda klasser

  Regel: Rubriken kan göras egen

    Scenario: Egna rubrikposter används högst upp
      Givet en sträcktidslista med listposter för rubrik
      När utskriften görs
      Så används rubriken högst upp på sidan

    Scenario: Rubriken kan innehålla flera rader
      Givet en egen rubrik
      När den definieras
      Så kan den innehålla tävlingsnamn, datum, bilder och deltagarens resultat

    Scenario: Standardrubrik används när egen saknas
      Givet en sträcktidslista utan egen rubrik
      När utskriften görs
      Så används en standardrubrik med tävlingsnamn och datum

  Regel: Innehållet kan slås av och på

    Scenario: Individuellt resultat kan uteslutas
      Givet en egen rubrik som redan innehåller deltagarens resultat
      När "Inkludera individuellt resultat" stängs av
      Så dubbleras inte resultatet

    Scenario: Sträcktider kan uteslutas
      Givet en sträcktidslista som skriver ut sträcktiderna själv
      När "Inkludera sträcktider" stängs av
      Så skrivs de inte ut separat

    Scenario: Bomanalys och tempo kan styras
      Givet en sträcktidslista
      När visning av bomanalys och tempo ställs in
      Så följer utskriften inställningen

    Scenario: Topplista med N bästa från klassen
      Givet en sträcktidslista
      När "Topplista, N bästa" sätts till 3
      Så skrivs de tre bästa i klassen ut utöver deltagarens eget resultat

  Regel: Listan måste vara smal nog för utskriften

    Scenario: För bred lista skalas ned för mycket
      Givet en sträcktidslista som är bredare än utskriftsformatet
      När den skrivs ut
      Så skalas den ned för mycket
      Och listan bör göras smalare
