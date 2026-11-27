# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5469
# Kod: speakermonitor.cpp (prioritering)
Egenskap: Prioritera bevakning av vissa deltagare
  Som speaker
  vill jag peka ut deltagare som alltid ska bevakas
  så att jag inte missar dem även när det går dåligt.

  Regel: MeOS bevakar automatiskt bra resultat

    Scenario: Bra resultat ger automatisk bevakning
      Givet en händelsevy
      När en deltagare gör ett bra resultat
      Så bevakas deltagaren automatiskt

    Scenario: Bra resultat är relativt
      Givet få rapporterade resultat vid en radiokontroll
      När den första deltagaren passerar
      Så tar deltagaren ledningen och räknas som ett bra resultat

  Regel: Prioriteringen sätts per deltagare i en klass

    Scenario: Klassens deltagare listas
      Givet ett speakerfönster
      När "Prioritering" väljs och en klass pekas ut
      Så visas en lista på klassens löpare eller lag

    Scenario: Inget kryss ger bevakning först vid bra resultat
      Givet en deltagare utan kryss
      När loppet pågår
      Så bevakas deltagaren först från första rapporterade bra resultat
      Och endast så länge det går bra

    Scenario: Ett kryss ger bevakning från start
      Givet en deltagare med ett kryss
      När loppet pågår
      Så bevakas deltagaren från start
      Och så länge det går bra

    Scenario: Två kryss ger bevakning hela loppet
      Givet en deltagare med två kryss
      När loppet pågår
      Så bevakas deltagaren hela loppet oberoende av hur det går

  Regel: Filtrering kompletterar prioriteringen

    Scenario: Filtret styr vad som rapporteras
      Givet en händelsevy med prioriterade deltagare
      När filternivån ändras
      Så påverkas vad som rapporteras
