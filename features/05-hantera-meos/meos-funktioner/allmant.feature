# language: sv
Egenskap: Allmänna funktioner
  Grundfunktioner som de flesta tävlingar använder:
  startlottning, nummerlappar, klubbar, kvar-i-skogen och nätverk.

  Regel: Förbereda startlistor (SL) — lottning och relaterade funktioner

    Scenario: Lottning ger alla anmälda en starttid
      Givet en klass med anmälda löpare och ett startdjup med intervall
      När klassen lottas
      Så har varje löpare en starttid inom startfönstret
      Och två löpare på samma bana startar inte på samma tid

  Regel: Nummerlappar (BB) — nummerlappshantering

    Scenario: Nummerlappar delas ut i följd per klass
      Givet en klass med nummerlappsserie som börjar på 101
      När nummerlappar tilldelas
      Så får löparna löpande nummer utan luckor i serien

  Regel: Klubbar (CL) och Redigera klubbar (CC)

    Scenario: Anmäld löpare kopplas till sin klubb
      Givet att funktionen "Klubbar" är aktiv
      När en löpare anmäls med klubben "OK Skogen"
      Så visas löparen med klubb "OK Skogen" i start- och resultatlistor

    Scenario: Klubbar kan slås ihop
      Givet att funktionen "Redigera klubbar" är aktiv
      Och två klubbposter som avser samma klubb
      När klubbarna slås ihop
      Så pekar alla berörda löpare på den kvarvarande klubben

  Regel: Beräkna kvar-i-skogen (RF) — vilka löpare har inte gått i mål

    Scenario: Ej avläst löpare räknas som kvar i skogen
      Givet en startad löpare vars bricka inte lästs av
      När kvar-i-skogen-listan visas
      Så finns löparen med i listan

    Scenario: Avläst löpare lämnar listan
      Givet en löpare som finns i kvar-i-skogen-listan
      När löparens bricka läses av
      Så finns löparen inte längre i listan

  Regel: Flera MeOS-klienter i nätverk (NW) — gemensam databas

    Scenario: Ändring på en klient syns på övriga
      Givet två MeOS-klienter anslutna till samma tävling
      När en löpares resultat registreras på den ena klienten
      Så visas resultatet på den andra klienten efter synkronisering
