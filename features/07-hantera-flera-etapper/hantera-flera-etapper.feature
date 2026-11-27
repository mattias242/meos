# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5484
# Kod: MeOSFeatures::SeveralStages, oEvent (etapphantering), oClass (Endast etappresultat)
Egenskap: Hantera flera etapper
  Som arrangör av en flerdagarstävling
  vill jag koppla ihop etapper och räkna ut totalresultat
  så att deltagare som sprungit alla etapper får ett slutresultat.

  Regel: Funktionen flera etapper måste vara aktiverad

    Scenario: Etapphantering kräver aktiverad funktion
      Givet en tävling där funktionen "Flera etapper" är avaktiverad
      När etapphantering efterfrågas
      Så är den inte tillgänglig

  Regel: Flera upplägg stöds

    Scenario: Traditionell flerdagarstävling
      Givet flera etapper i samma klasser
      När totalresultatet räknas ut
      Så baseras det på totaltiden över etapperna

    Scenario: Prolog och jaktstart i vissa klasser
      Givet en prolog och en jaktstartsetapp
      När etapperna kopplas ihop
      Så kan jaktstarten lottas utifrån prologens resultat

    Scenario: Löst ihopknutna tävlingar
      Givet flera fristående tävlingar som kopplas ihop
      När slutresultatet tas fram
      Så får de som sprungit alla ingående tävlingar ett resultat på totaltiden

  Regel: Serier och poängräkning saknar inbyggt stöd

    Scenario: Poängserier byggs med egna resultatmoduler
      Givet en serie där poäng tilldelas enligt egna regler
      När resultat ska tas fram
      Så används egna resultatmoduler och listor

    Scenario: Modulens poäng skrivs som deltagarens etapppoäng
      Givet en klass med en resultatmodul som räknar ut poäng
      När etappen genomförs
      Så skrivs poängen in som deltagarens poäng på etappen

    Scenario: Sista etappens modul sammanställer slutresultatet
      Givet etapppoäng från tidigare etapper
      När en resultatmodul används på sista etappen
      Så kan den sammanställa ett slutresultat ur poängen

    Scenario: Poäng kan också föras över manuellt
      Givet ingående poäng i ett kalkylbladsprogram
      När de klistras in i tabellkolumnen "Poäng in" på sista etappen
      Så används de i slutresultatet

  Regel: Klasser kan begränsas till enbart etappresultat

    Scenario: Flaggan Endast etappresultat sätts i tabelläget
      Givet tabelläget för klasser
      När flaggan "Endast etappresultat" sätts på en klass
      Så får klassen inget sammanlagt resultat

    Scenario: Flaggan påverkar liveresultat och resultatöverföring
      Givet en klass med "Endast etappresultat"
      När resultat överförs till nästa etapp
      Så påverkas överföringen och liveresultaten av flaggan
