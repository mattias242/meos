# language: sv
# Dokumentation: https://melin.nu/meos/sv/show.php?base=5400&id=5470
# Kod: liveresult.cpp
Egenskap: Liveresultat – stoppur
  Som arrangör av korta lopp som labyrintorientering
  vill jag visa ett rullande stoppur på storbildskärm
  så att publiken kan följa loppet i realtid.

  Regel: Stoppuret konfigureras och startas från speakersidan

    Scenario: Klasser och kontroller väljs
      Givet sidan "Speaker"
      När "Liveresultat" väljs
      Så öppnas ett nytt fönster där klasser samt start- och slutkontroll väljs

    Scenario: Fönstret startas i helskärm
      Givet ett konfigurerat liveresultatfönster på rätt skärm
      När "Starta" väljs eller ENTER trycks
      Så visas MeOS i helskärm i fönstret

  Regel: Stoppuret följer deltagaren mellan kontrollerna

    Scenario: Stoppuret startar vid startkontrollen
      Givet ett startat stoppur
      När en deltagare i klassen stämplar vid startkontrollen
      Så startar stoppuret

    Scenario: Stoppuret stannar vid slutkontrollen
      Givet ett rullande stoppur
      När deltagaren når slutkontrollen
      Så stannar tiden

    Scenario: Endast en deltagare hanteras i taget
      Givet ett startat stoppur
      När flera deltagare är ute samtidigt
      Så hanteras för närvarande endast en deltagare i taget

  Regel: Helskärmsläget lämnas med ESC

    Scenario: ESC avslutar helskärmen
      Givet ett helskärmsfönster med fokus
      När ESC trycks
      Så avslutas helskärmsläget

  Regel: Kontrollerna måste vara uppkopplade och snabba

    Scenario: Start- och slutkontroll måste vara uppkopplade
      Givet ett stoppur som ska användas
      När kontrollerna inte är uppkopplade mot tävlingen
      Så fungerar inte stoppuret

    Scenario: Snabb förhandsinformation bör vara aktiverad
      Givet en MeOS-uppkoppling som används för stoppuret
      När fördröjningen ska minimeras
      Så bör snabb förhandsinformation om stämplingar vara aktiverad
