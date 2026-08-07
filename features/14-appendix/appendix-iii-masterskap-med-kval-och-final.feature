# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5502
# Kod: TabClass.cpp (dela klass, slå ihop klasser, seedad lottning),
#      oevent_transfer.cpp (etappöverföring)
Egenskap: Mästerskap med kval och final
  Som arrangör av ett mästerskap
  vill jag följa ett arbetsflöde med ranking, jämna kvalheat och finaler
  så att kval och final kan köras som två etapper.

  # Alternativet — allt i en tävling med flera lopp per löpare — beskrivs i
  # features/10-kval-och-final-knockout-sprint/.

  Regel: Förberedelsen bygger på ranking

    Scenario: Tävling skapas och anmälda importeras
      Givet ett mästerskap som ska arrangeras
      När en tävling skapas och de anmälda importeras
      Så finns deltagarna i MeOS

    Scenario: Ranking importeras
      Givet den ranking som ska användas
      När den importeras
      Så kan den användas för heatindelning och seedning

    Scenario: Rankingen kontrolleras i tabelläget
      Givet importerad ranking
      När tabelläget för deltagare visas
      Så ska fältet "Ranking" vara satt

  Regel: Kvalheaten skapas genom klassdelning

    Scenario: Jämna heat efter ranking
      Givet en mästerskapsklass på sidan "Klasser"
      När "Dela klass" väljs med metoden "Jämna klasser (ranking)"
      Och antal klasser och antal deltagare per heat anges
      Så skapas jämna kvalheat

    Scenario: Heaten kan döpas om
      Givet skapade kvalheat
      När de döps om
      Så behålls indelningen

  Regel: Varje kvalheat lottas seedat för sig

    Scenario: Seedad lottning med ranking som källa
      Givet ett kvalheat
      När "Lotta/starttider" väljs med metoden "Seedad lottning" och seedningskällan "Ranking"
      Så lottas heatet seedat

    Scenario: Gruppstorlek 1 följer rankingen strikt
      Givet en seedad lottning
      När storleken på seedningsgrupperna sätts till 1
      Så följs rankingen strikt

    Scenario: Klubbkamrater kan hindras från angränsande tider
      Givet en seedad lottning
      När "Hindra att deltagare från samma klubb startar på angränsande tider" markeras
      Så undviks angränsande starttider för klubbkamrater

    Scenario: Första start och intervall anges
      Givet en seedad lottning
      När första start och intervall anges
      Så används de

  Regel: Kvalet genomförs som en vanlig tävling

    Scenario: Inga särskilda åtgärder krävs
      Givet ett uppsatt kvalheat
      När kvalet genomförs
      Så krävs inga speciella åtgärder jämfört med en vanlig tävling

  Regel: Finalen sätts upp som nästa etapp

    Scenario: Etappstöd aktiveras och etappen skapas
      Givet kvaltävlingen öppnad lokalt
      När "MeOS funktioner" för flera etapper är aktiverad
      Och "Hantera flera etapper", "Lägg till ny etapp" och "Överför resultat till nästa etapp" väljs
      Så skapas finaltävlingen med överförda resultat

    Scenario: Överföringen kontrolleras i tabelläget
      Givet den skapade finaletappen
      När tabelläget för deltagare visas
      Så finns de förväntade deltagarna med
      Och alla har förväntade ingångsresultat som placering in och tid in
      Och fältet "Heat" är satt

    Scenario: Heatnumret följer kvalheatets bokstav
      Givet en deltagare från kvalheat A
      När fältet "Heat" läses
      Så är värdet 1
      Och för heat B är värdet 2

  Regel: Finalklasserna skapas genom hopslagning och delning

    Scenario: Kvalheaten slås ihop till en klass
      Givet finaletappens kvalheat
      När ett heat markeras och "Slå ihop klasser" väljs
      Och proceduren upprepas
      Så blir alla sammanhörande kvalheat en stor klass

    Scenario: Den hopslagna klassen delas efter placering
      Givet den hopslagna klassen
      När "Dela klassen" väljs med metoden "Placering"
      Och antal finalklasser och antal deltagare per klass anges
      Så skapas finalklasserna

  Regel: Starttider i finalen kan följa kvalplaceringen strikt

    Scenario: Seedad lottning med resultat som källa
      Givet en finalklass
      När "Lotta/starttider" och "Seedad lottning" väljs med seedningskällan "Resultat"
      Så styr kvalresultatet startordningen

    Scenario: Gruppstorlek 1 tar bort lottningen
      Givet en seedad lottning av finalen
      När storleken på seedningsgrupperna sätts till 1
      Så sker ingen lottning
      Och varje deltagare blir sin egen seedningsgrupp

  Regel: Klubbvillkoret kan inte alltid uppfyllas

    Scenario: Fler än hälften från samma klubb gör villkoret omöjligt
      Givet en klass där fler än hälften kommer från samma klubb
      När starttider tilldelas
      Så kan villkoret om angränsande tider inte uppfyllas

    Scenario: Stor koncentration i en del av startfältet kan ge krockar
      Givet en stor koncentration av deltagare från samma klubb
      När starttider tilldelas
      Så kan MeOS misslyckas med önskemålet
      Och starttider tilldelas i vilket fall
