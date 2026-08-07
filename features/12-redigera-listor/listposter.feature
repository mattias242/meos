# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5492
# Kod: metalist.cpp (MetaListPost: typ, egen text, blockbredd, justering,
#      relation till föregående)
Egenskap: Listposter
  Som listkonstruktör
  vill jag styra varje listposts typ, text, bredd och formatering
  så att kolumnerna hamnar där de ska.

  Regel: Poster läggs till på rader

    Scenario: Rad måste finnas innan posten läggs till
      Givet en del av listan utan rader
      När en listpost ska läggas till
      Så måste först "Lägg till rad" väljas

    Scenario: Post läggs till på raden
      Givet en rad i listan
      När "Lägg till ny" väljs
      Så läggs en listpost till på raden

    Scenario: Ordningen ändras och poster raderas
      Givet en rad med flera listposter
      När "Flytta höger", "Flytta vänster" eller "Radera" används
      Så ändras ordningen eller posten tas bort

  Regel: Typen definierar postens innehåll

    Scenario: Typen text ger helt egen text
      Givet en listpost med typen "Text"
      När innehållet definieras i fältet "Egen text"
      Så används den texten

    Scenario: Övriga typer genererar text automatiskt
      Givet en listpost av en annan typ än text
      När listan skapas
      Så skapar MeOS texten

    Scenario: Typer kan sökas fram
      Givet valet av typ för en listpost
      När en sökterm skrivs i sökfältet
      Så söks både beskrivning och namn igenom

  Regel: Egen text kan omge den genererade texten

    Scenario: Tomt fält ger endast MeOS text
      Givet en listpost där "Egen text" är tomt
      När listan skapas
      Så används endast den text MeOS skapar

    Scenario: Tecknet X markerar var blockets text sätts in
      Givet en listpost av typen "Banlängd för klass"
      När "Egen text" sätts till "X meter"
      Så skrivs till exempel "2500 meter"

    Scenario: Kortare enhet med annan egen text
      Givet en listpost av typen "Banlängd för klass"
      När "Egen text" sätts till "X m"
      Så skrivs "2500 m"

  Regel: Positionering och bredd styrs i MeOS-pixlar

    Scenario: Posten justeras mot en post i en annan rad
      Givet en listpost
      När "Justera mot" pekar ut en post i en annan rad
      Så justeras posten horisontellt mot den

    Scenario: Textposter justeras genom sin text
      Givet justering mot en listpost av typen "Text"
      När justeringen anges
      Så ska motsvarande text anges i fältet "Text"

    Scenario: Minsta blockbredd sätter en undre gräns
      Givet en listpost med angiven minsta blockbredd
      När listan skapas
      Så sätts texten in som ett block av minst den bredden

    Scenario: Sex MeOS-pixlar per bokstav som tumregel
      Givet en listpost som ska rymma tio bokstäver
      När blockbredden beräknas
      Så är en tumregel att multiplicera antalet bokstäver med 6 eller 7

    Scenario: Ankrad text ovanför knuffas åt höger
      Givet text ovanför som är ankrad inom blocket i vertikal led
      När blocket växer
      Så knuffas texten åt höger och ankras där blocket slutar

    Scenario: Begränsa bredd klipper av för lång text
      Givet en listpost med "Begränsa bredd"
      När texten är längre än vad som ryms
      Så klipps den av i stället för att blocket växer

    Scenario: Justering i sidled anges i MeOS-pixlar
      Givet en listpost
      När justering i sidled anges
      Så positioneras texten därefter

  Regel: Data kan hämtas från resultatmodulen

    Scenario: Alternativet visas när en resultatmodul valts
      Givet en lista med vald resultatmodul
      När en listpost redigeras
      Så visas alternativet "Data från resultatmodul"

    Scenario: Tid och placering hämtas från modulen
      Givet en listpost med "Data från resultatmodul" markerat
      När listan skapas
      Så hämtas till exempel tid och placering från den valda modulen

  Regel: Sträckval styr vilken lagmedlem posten avser

    Scenario: En viss sträcka pekas ut på en lagrad
      Givet en rad som syftar på ett lag
      När "Tillämpa för viss sträcka" sätts till sträcka 1
      Så avser posten lagmedlemmen på sträcka 1

    Scenario: Patrullens båda medlemmar på samma rad
      Givet en patrull-lista
      När sträckval används för deltagare 1 och deltagare 2
      Så visas båda på samma rad
      I stället för en rad var i en underlista

    Scenario: Automatisk sträcka följer visningen
      Givet en listpost med sträckvalet "Automatisk"
      När listan visas
      Så används den sträcka som valts vid visningen

    Scenario: Alla sträckor duplicerar posten
      Givet en listpost med sträckvalet "Alla sträckor"
      När listan skapas
      Så dupliceras posten för varje sträcka enligt klassinställningen

    Scenario: Index ersätter sträckvalet för resultatmodulens utdata
      Givet en listpost som refererar till särskild utdata från en resultatmodul
      När posten redigeras
      Så ersätts sträckvalet av ett index

    Scenario: Etappval ersätter sträckvalet för tidigare etapper
      Givet en listpost som refererar till ett resultat från en tidigare etapp
      När posten redigeras
      Så ersätts sträckvalet av ett etappval

    Scenario: Alla etapper ger en kolumn per etapp
      Givet en listpost med etappvalet "Alla etapper"
      När listan skapas
      Så dupliceras fältet för varje tidigare etapp

  Regel: Relationen till föregående post styr kolumnindelningen

    Scenario: Ingen relation ger en egen kolumn
      Givet en listpost med relationen "Ingen"
      När listan skapas
      Så får posten en egen kolumn

    Scenario: Slå ihop text skapar ingen egen kolumn
      Givet en listpost med relationen "Slå ihop text"
      När listan skapas
      Så slås texten ihop med texten i kolumnen till vänster

    Scenario: Mellanslag måste anges manuellt
      Givet en listpost med relationen "Slå ihop text"
      När ett mellanslag behövs
      Så måste det skrivas i "Egen text", till exempel " X"

    Scenario: Formatering ärvs vid sammanslagning
      Givet en listpost med relationen "Slå ihop text"
      När listan skapas
      Så ärvs format, färg och justering från posten till vänster

    Scenario: Håll ihop kolumner behåller separata kolumner
      Givet en listpost med relationen "Håll ihop kolumner"
      När listan läggs ut
      Så behålls separata kolumner men de hålls nära varandra

  Regel: Format, justering och färg

    Scenario: Formatet är relativt basformatet
      Givet en listpost med ett valt format
      När listan skapas
      Så tillämpas formatet relativt basformatet för listans del

    Scenario: Textjustering väljs per kolumn
      Givet en listpost
      När textjusteringen sätts
      Så blir texten vänsterjusterad, högerjusterad eller centrerad

    Scenario: Färgen väljs per post
      Givet en listpost
      När en färg väljs
      Så visas texten i den färgen

  Regel: Vissa fält anpassas automatiskt

    Scenario: Nummerlapp utesluts när ingen har nummerlapp
      Givet en lista med en nummerlappspost
      När ingen deltagare har nummerlapp
      Så utesluts fältet

    Scenario: Ranking utesluts när ingen har ranking
      Givet en lista med en rankingpost
      När ingen deltagare har ranking
      Så utesluts fältet

    Scenario: Starttid formateras utan sekunder vid hela minuter
      Givet en tävling där alla startar på hel minut
      När starttiden formateras
      Så visas den utan sekunder

    Scenario: Kolumnbredder justeras vid laddning
      Givet en visad lista
      När tävlingsdata ändras
      Så justeras inte kolumnbredderna om

    Scenario: Långt namn kan behöva att listan öppnas om
      Givet en lista där alla föranmälda har korta namn
      När någon direktanmäler sig med ett mycket långt namn
      Så kan namnet inte få plats
      Och listan måste stängas och öppnas på nytt
