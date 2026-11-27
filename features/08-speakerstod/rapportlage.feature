# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5471
# Kod: oReport.cpp, TabSpeaker.cpp
Egenskap: Rapportläge från speakerfliken
  Som speaker
  vill jag nå den detaljerade resultatrapporten direkt från speakerfliken
  så att jag snabbt kan berätta om en deltagares lopp.

  # Rapportens innehåll och kioskläget dokumenteras i
  # features/02-mindre-arrangemang/individuell-resultatrapport-och-resultatkiosker.feature

  Regel: Rapporten nås direkt från speakerfliken

    Scenario: Resultatrapporten öppnas
      Givet ett speakerfönster
      När "Rapportläge" väljs
      Så öppnas resultatrapporten

    Scenario: Detaljerad rapport om bommade kontroller
      Givet en vald deltagare i rapportläget
      När rapporten visas
      Så framgår deltagarens bommade kontroller
