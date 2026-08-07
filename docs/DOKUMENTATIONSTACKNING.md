# Dokumentationstäckning

Checklista över den officiella MeOS 5.0-dokumentationen på
[melin.nu](https://melin.nu/meos/sv/show.php?base=156&id=5400) (121 sidor,
hämtad 2026-08-07). Målet i fas 1 är att varje sida med beskrivet beteende har
motsvarande Gherkin-scenarier i `features/`, korslästa mot koden i `code/`.

Arbetssätt och regler för scenarierna: [UTVECKLINGSPROCESS_BDD_TDD.md](UTVECKLINGSPROCESS_BDD_TDD.md).
Testmålbilden som bygger vidare på scenarierna: [TEST_TODO.md](TEST_TODO.md).

Status: `[ ]` ej påbörjad · `[~]` delvis · `[x]` klar ·
`[-]` ingen beteendespecifikation (installation, miljö eller rena råd).

Utöver sidorna nedan finns korsgående feature-filer som inte hör till en enskild
dokumentationssida utan beskriver kärnlogik härledd ur koden:

| Feature-fil | Innehåll |
|---|---|
| `features/02-mindre-arrangemang/resultatberakning-och-placering.feature` | Resultatberäkning, delade tider, statusordning |


## Allmanna rad och tips

| | Sida | Dokumentation | Feature-fil |
|---|---|---|---|
| [x] | 5506 | [Allmänna råd och tips](https://melin.nu/meos/sv/show.php?base=5400&id=5506) | `features/01-allmanna-rad-och-tips/allmanna-rad-och-tips.feature` |

## Mindre arrangemang

| | Sida | Dokumentation | Feature-fil |
|---|---|---|---|
| [x] | 5401 | [Mindre arrangemang](https://melin.nu/meos/sv/show.php?base=5400&id=5401) | `features/02-mindre-arrangemang/mindre-arrangemang.feature` |
| [x] | 5422 | &nbsp;&nbsp;[Skapa en ny tävling](https://melin.nu/meos/sv/show.php?base=5400&id=5422) | `features/02-mindre-arrangemang/skapa-en-ny-tavling.feature` |
| [x] | 5402 | &nbsp;&nbsp;[Förberedelsearbete](https://melin.nu/meos/sv/show.php?base=5400&id=5402) | `features/02-mindre-arrangemang/forberedelsearbete.feature` |
| [x] | 5403 | &nbsp;&nbsp;&nbsp;&nbsp;[Anmäla deltagare](https://melin.nu/meos/sv/show.php?base=5400&id=5403) | `features/02-mindre-arrangemang/anmala-deltagare.feature` |
| [x] | 5404 | &nbsp;&nbsp;&nbsp;&nbsp;[Skapa klasser](https://melin.nu/meos/sv/show.php?base=5400&id=5404) | `features/02-mindre-arrangemang/skapa-klasser.feature` |
| [x] | 5405 | &nbsp;&nbsp;&nbsp;&nbsp;[Definiera banor](https://melin.nu/meos/sv/show.php?base=5400&id=5405) | `features/02-mindre-arrangemang/definiera-banor.feature` |
| [x] | 5408 | &nbsp;&nbsp;&nbsp;&nbsp;[Slingor med varvningskontroll](https://melin.nu/meos/sv/show.php?base=5400&id=5408) | `features/02-mindre-arrangemang/slingor-med-varvningskontroll.feature` |
| [x] | 5406 | &nbsp;&nbsp;&nbsp;&nbsp;[Lottning](https://melin.nu/meos/sv/show.php?base=5400&id=5406) | `features/02-mindre-arrangemang/lottning.feature` |
| [x] | 5409 | &nbsp;&nbsp;&nbsp;&nbsp;[Lotta samma bana gemensamt](https://melin.nu/meos/sv/show.php?base=5400&id=5409) | `features/02-mindre-arrangemang/lotta-samma-bana-gemensamt.feature` |
| [x] | 5407 | &nbsp;&nbsp;&nbsp;&nbsp;[Hyrbrickor och återanvändning av brickor](https://melin.nu/meos/sv/show.php?base=5400&id=5407) | `features/02-mindre-arrangemang/hyrbrickor-och-ateranvandning-av-brickor.feature` |
| [x] | 5410 | &nbsp;&nbsp;[Genomföra arrangemanget](https://melin.nu/meos/sv/show.php?base=5400&id=5410) | `features/02-mindre-arrangemang/genomfora-arrangemanget.feature` |
| [x] | 5411 | &nbsp;&nbsp;&nbsp;&nbsp;[Brickavläsning](https://melin.nu/meos/sv/show.php?base=5400&id=5411) | `02-mindre-arrangemang/brickavlasning.feature` |
| [x] | 5419 | &nbsp;&nbsp;&nbsp;&nbsp;[Manuell tidtagning](https://melin.nu/meos/sv/show.php?base=5400&id=5419) | `features/02-mindre-arrangemang/manuell-tidtagning.feature` |
| [x] | 5412 | &nbsp;&nbsp;&nbsp;&nbsp;[Godkänna och diskvalificera deltagare](https://melin.nu/meos/sv/show.php?base=5400&id=5412) | `features/02-mindre-arrangemang/godkanna-och-diskvalificera-deltagare.feature` |
| [x] | 5413 | &nbsp;&nbsp;&nbsp;&nbsp;[Redigera stämplingar](https://melin.nu/meos/sv/show.php?base=5400&id=5413) | `features/02-mindre-arrangemang/redigera-stamplingar.feature` |
| [x] | 5414 | &nbsp;&nbsp;&nbsp;&nbsp;[Sträcktidsutskrifter](https://melin.nu/meos/sv/show.php?base=5400&id=5414) | `features/02-mindre-arrangemang/stracktidsutskrifter.feature` |
| [x] | 5415 | &nbsp;&nbsp;&nbsp;&nbsp;[Start- och resultatlistor](https://melin.nu/meos/sv/show.php?base=5400&id=5415) | `features/02-mindre-arrangemang/start-och-resultatlistor.feature` |
| [x] | 5416 | &nbsp;&nbsp;&nbsp;&nbsp;[Export av resultat och sträcktider](https://melin.nu/meos/sv/show.php?base=5400&id=5416) | `features/02-mindre-arrangemang/export-av-resultat-och-stracktider.feature` |
| [x] | 5417 | &nbsp;&nbsp;&nbsp;&nbsp;[Kvar-i-skogen](https://melin.nu/meos/sv/show.php?base=5400&id=5417) | `features/02-mindre-arrangemang/kvar-i-skogen.feature` |
| [x] | 5420 | &nbsp;&nbsp;&nbsp;&nbsp;[Flera lopp eller varv per deltagare](https://melin.nu/meos/sv/show.php?base=5400&id=5420) | `features/02-mindre-arrangemang/flera-lopp-eller-varv-per-deltagare.feature` |
| [x] | 5418 | &nbsp;&nbsp;&nbsp;&nbsp;[Individuell resultatrapport och resultatkiosker](https://melin.nu/meos/sv/show.php?base=5400&id=5418) | `features/02-mindre-arrangemang/individuell-resultatrapport-och-resultatkiosker.feature` |
| [x] | 5421 | &nbsp;&nbsp;[Sträcktidsutskrift utan tävling](https://melin.nu/meos/sv/show.php?base=5400&id=5421) | `features/02-mindre-arrangemang/stracktidsutskrift-utan-tavling.feature` |
| [x] | 5423 | &nbsp;&nbsp;[Importera resultat](https://melin.nu/meos/sv/show.php?base=5400&id=5423) | `features/02-mindre-arrangemang/importera-resultat.feature` |

## Tidtagning utan banor och kontroller

| | Sida | Dokumentation | Feature-fil |
|---|---|---|---|
| [x] | 5507 | [Tidtagning utan banor och kontroller](https://melin.nu/meos/sv/show.php?base=5400&id=5507) | `03-tidtagning-utan-banor-och-kontroller/tidtagning-utan-banor-och-kontroller.feature` |

## Tavlingsfunktioner

| | Sida | Dokumentation | Feature-fil |
|---|---|---|---|
| [x] | 5508 | [Tävlingsfunktioner](https://melin.nu/meos/sv/show.php?base=5400&id=5508) | `features/04-tavlingsfunktioner/tavlingsfunktioner.feature` |
| [x] | 5519 | &nbsp;&nbsp;[Boka starttid](https://melin.nu/meos/sv/show.php?base=5400&id=5519) | `features/04-tavlingsfunktioner/boka-starttid.feature` |
| [x] | 5518 | &nbsp;&nbsp;[Starta klass på signal](https://melin.nu/meos/sv/show.php?base=5400&id=5518) | `features/04-tavlingsfunktioner/starta-klass-pa-signal.feature` |
| [x] | 5509 | &nbsp;&nbsp;[Vakanser, klassbyte och återbud](https://melin.nu/meos/sv/show.php?base=5400&id=5509) | `features/04-tavlingsfunktioner/vakanser-klassbyte-och-aterbud.feature` |
| [x] | 5510 | &nbsp;&nbsp;[Oparade brickor](https://melin.nu/meos/sv/show.php?base=5400&id=5510) | `features/04-tavlingsfunktioner/oparade-brickor.feature` |
| [x] | 5513 | &nbsp;&nbsp;[Knyta brickor till deltagare](https://melin.nu/meos/sv/show.php?base=5400&id=5513) | `features/04-tavlingsfunktioner/knyta-brickor-till-deltagare.feature` |
| [x] | 5511 | &nbsp;&nbsp;[Kontroller](https://melin.nu/meos/sv/show.php?base=5400&id=5511) | `features/04-tavlingsfunktioner/kontroller.feature` |
| [x] | 5512 | &nbsp;&nbsp;&nbsp;&nbsp;[Tabelläge och statistik](https://melin.nu/meos/sv/show.php?base=5400&id=5512) | `features/04-tavlingsfunktioner/tabellage-och-statistik.feature` |
| [x] | 5514 | &nbsp;&nbsp;[Avkortade banor](https://melin.nu/meos/sv/show.php?base=5400&id=5514) | `features/04-tavlingsfunktioner/avkortade-banor.feature` |
| [x] | 5517 | &nbsp;&nbsp;[Tidtagning med tiondelar](https://melin.nu/meos/sv/show.php?base=5400&id=5517) | `features/04-tavlingsfunktioner/tidtagning-med-tiondelar.feature` |
| [x] | 5515 | &nbsp;&nbsp;[Långa tävlingstider](https://melin.nu/meos/sv/show.php?base=5400&id=5515) | `features/04-tavlingsfunktioner/langa-tavlingstider.feature` |
| [x] | 5516 | &nbsp;&nbsp;[Tidsjustering av start och mål](https://melin.nu/meos/sv/show.php?base=5400&id=5516) | `features/04-tavlingsfunktioner/tidsjustering-av-start-och-mal.feature` |
| [x] | 5520 | &nbsp;&nbsp;[Kartor](https://melin.nu/meos/sv/show.php?base=5400&id=5520) | `features/04-tavlingsfunktioner/kartor.feature` |
| [x] | 5521 | &nbsp;&nbsp;&nbsp;&nbsp;[Lokalisera kartan](https://melin.nu/meos/sv/show.php?base=5400&id=5521) | `features/04-tavlingsfunktioner/lokalisera-kartan.feature` |

## Hantera meos

| | Sida | Dokumentation | Feature-fil |
|---|---|---|---|
| [x] | 5424 | [Hantera MeOS](https://melin.nu/meos/sv/show.php?base=5400&id=5424) | `features/05-hantera-meos/hantera-meos.feature` |
| [x] | 5434 | &nbsp;&nbsp;[MeOS funktioner](https://melin.nu/meos/sv/show.php?base=5400&id=5434) | `05-hantera-meos/meos-funktioner/ (6 filer)` |
| [x] | 5439 | &nbsp;&nbsp;[Valbara extra datafält](https://melin.nu/meos/sv/show.php?base=5400&id=5439) | `features/05-hantera-meos/valbara-extra-datafalt.feature` |
| [x] | 5431 | &nbsp;&nbsp;[Spara, flytta och ta bort tävlingar](https://melin.nu/meos/sv/show.php?base=5400&id=5431) | `features/05-hantera-meos/spara-flytta-och-ta-bort-tavlingar.feature` |
| [x] | 5425 | &nbsp;&nbsp;[Löpardatabasen](https://melin.nu/meos/sv/show.php?base=5400&id=5425) | `features/05-hantera-meos/lopardatabasen.feature` |
| [x] | 5438 | &nbsp;&nbsp;[Ranking](https://melin.nu/meos/sv/show.php?base=5400&id=5438) | `features/05-hantera-meos/ranking.feature` |
| [x] | 5441 | &nbsp;&nbsp;[Nummerlappar](https://melin.nu/meos/sv/show.php?base=5400&id=5441) | `features/05-hantera-meos/nummerlappar.feature` |
| [x] | 5428 | &nbsp;&nbsp;[Mer om listor](https://melin.nu/meos/sv/show.php?base=5400&id=5428) | `features/05-hantera-meos/mer-om-listor.feature` |
| [x] | 5429 | &nbsp;&nbsp;&nbsp;&nbsp;[Listor på helskärm](https://melin.nu/meos/sv/show.php?base=5400&id=5429) | `features/05-hantera-meos/listor-pa-helskarm.feature` |
| [x] | 5430 | &nbsp;&nbsp;&nbsp;&nbsp;[Export till HTML/Webb](https://melin.nu/meos/sv/show.php?base=5400&id=5430) | `features/05-hantera-meos/export-till-html-webb.feature` |
| [x] | 5426 | &nbsp;&nbsp;[Automatisk utskrift och filexport](https://melin.nu/meos/sv/show.php?base=5400&id=5426) | `features/05-hantera-meos/automatisk-utskrift-och-filexport.feature` |
| [x] | 5427 | &nbsp;&nbsp;&nbsp;&nbsp;[Exportera listor till webben](https://melin.nu/meos/sv/show.php?base=5400&id=5427) | `features/05-hantera-meos/exportera-listor-till-webben.feature` |
| [x] | 5432 | &nbsp;&nbsp;[Publicera resultat på Internet](https://melin.nu/meos/sv/show.php?base=5400&id=5432) | `features/05-hantera-meos/publicera-resultat-pa-internet.feature` |
| [x] | 5433 | &nbsp;&nbsp;[Fjärrinmatning  och radiotider från Internet](https://melin.nu/meos/sv/show.php?base=5400&id=5433) | `features/05-hantera-meos/fjarrinmatning-och-radiotider-fran-internet.feature` |
| [x] | 5436 | &nbsp;&nbsp;[MeOS informationsserver](https://melin.nu/meos/sv/show.php?base=5400&id=5436) | `features/05-hantera-meos/meos-informationsserver.feature` |
| [x] | 5437 | &nbsp;&nbsp;[Direktanmälan via wifi](https://melin.nu/meos/sv/show.php?base=5400&id=5437) | `features/05-hantera-meos/direktanmalan-via-wifi.feature` |
| [x] | 5435 | &nbsp;&nbsp;[Lokala inställningar](https://melin.nu/meos/sv/show.php?base=5400&id=5435) | `features/05-hantera-meos/lokala-installningar.feature` |
| [x] | 5440 | &nbsp;&nbsp;[Testa MeOS inför tävling](https://melin.nu/meos/sv/show.php?base=5400&id=5440) | `features/05-hantera-meos/testa-meos-infor-tavling.feature` |

## Storre arrangemang

| | Sida | Dokumentation | Feature-fil |
|---|---|---|---|
| [x] | 5442 | [Större arrangemang](https://melin.nu/meos/sv/show.php?base=5400&id=5442) | `features/06-storre-arrangemang/storre-arrangemang.feature` |
| [x] | 5443 | &nbsp;&nbsp;[MeOS i nätverk](https://melin.nu/meos/sv/show.php?base=5400&id=5443) | `features/06-storre-arrangemang/meos-i-natverk.feature` |
| [-] | 5445 | &nbsp;&nbsp;&nbsp;&nbsp;[Installera MySQL](https://melin.nu/meos/sv/show.php?base=5400&id=5445) | — (installationsinstruktion för MySQL) |
| [x] | 5444 | &nbsp;&nbsp;&nbsp;&nbsp;[Server- och nätverksproblem](https://melin.nu/meos/sv/show.php?base=5400&id=5444) | `features/06-storre-arrangemang/server-och-natverksproblem.feature` |
| [x] | 5447 | &nbsp;&nbsp;[Mer om klasser](https://melin.nu/meos/sv/show.php?base=5400&id=5447) | `features/06-storre-arrangemang/mer-om-klasser.feature` |
| [x] | 5448 | &nbsp;&nbsp;&nbsp;&nbsp;[Dela klasser](https://melin.nu/meos/sv/show.php?base=5400&id=5448) | `features/06-storre-arrangemang/dela-klasser.feature` |
| [x] | 5450 | &nbsp;&nbsp;[Avancerad lottning](https://melin.nu/meos/sv/show.php?base=5400&id=5450) | `features/06-storre-arrangemang/avancerad-lottning.feature` |
| [x] | 5451 | &nbsp;&nbsp;&nbsp;&nbsp;[Exportera och importera lottningsunderlag](https://melin.nu/meos/sv/show.php?base=5400&id=5451) | `features/06-storre-arrangemang/exportera-och-importera-lottningsunderlag.feature` |
| [x] | 5456 | &nbsp;&nbsp;[Seedad lottning](https://melin.nu/meos/sv/show.php?base=5400&id=5456) | `features/06-storre-arrangemang/seedad-lottning.feature` |
| [x] | 5458 | &nbsp;&nbsp;[Startgrupper](https://melin.nu/meos/sv/show.php?base=5400&id=5458) | `features/06-storre-arrangemang/startgrupper.feature` |
| [x] | 5459 | &nbsp;&nbsp;&nbsp;&nbsp;[Importera startgrupper](https://melin.nu/meos/sv/show.php?base=5400&id=5459) | `features/06-storre-arrangemang/importera-startgrupper.feature` |
| [x] | 5460 | &nbsp;&nbsp;&nbsp;&nbsp;[Lotta med startgrupper](https://melin.nu/meos/sv/show.php?base=5400&id=5460) | `features/06-storre-arrangemang/lotta-med-startgrupper.feature` |
| [x] | 5449 | &nbsp;&nbsp;[Klubbar](https://melin.nu/meos/sv/show.php?base=5400&id=5449) | `features/06-storre-arrangemang/klubbar.feature` |
| [x] | 5452 | &nbsp;&nbsp;[Ekonomi och fakturor](https://melin.nu/meos/sv/show.php?base=5400&id=5452) | `features/06-storre-arrangemang/ekonomi-och-fakturor.feature` |
| [x] | 5453 | &nbsp;&nbsp;&nbsp;&nbsp;[Kontant betalning](https://melin.nu/meos/sv/show.php?base=5400&id=5453) | `features/06-storre-arrangemang/kontant-betalning.feature` |
| [x] | 5454 | &nbsp;&nbsp;[Tävlingsinställningar](https://melin.nu/meos/sv/show.php?base=5400&id=5454) | `features/06-storre-arrangemang/tavlingsinstallningar.feature` |
| [x] | 5455 | &nbsp;&nbsp;[Avstämning av hyrbrickor](https://melin.nu/meos/sv/show.php?base=5400&id=5455) | `features/06-storre-arrangemang/avstamning-av-hyrbrickor.feature` |
| [x] | 5457 | &nbsp;&nbsp;[Fördefinierade hyrbrickor](https://melin.nu/meos/sv/show.php?base=5400&id=5457) | `features/06-storre-arrangemang/fordefinierade-hyrbrickor.feature` |
| [x] | 5461 | &nbsp;&nbsp;[Slå ihop tävlingar / hantera sekretariat på flera platser](https://melin.nu/meos/sv/show.php?base=5400&id=5461) | `features/06-storre-arrangemang/sla-ihop-tavlingar-hantera-sekretariat-pa-flera-platser.feature` |
| [x] | 5462 | &nbsp;&nbsp;[Hantera flera tävlingar i en MeOS-tävling](https://melin.nu/meos/sv/show.php?base=5400&id=5462) | `features/06-storre-arrangemang/hantera-flera-tavlingar-i-en-meos-tavling.feature` |
| [x] | 5446 | &nbsp;&nbsp;[Säkerhetskopior och återställning](https://melin.nu/meos/sv/show.php?base=5400&id=5446) | `features/06-storre-arrangemang/sakerhetskopior-och-aterstallning.feature` |

## Hantera flera etapper

| | Sida | Dokumentation | Feature-fil |
|---|---|---|---|
| [x] | 5484 | [Hantera flera etapper](https://melin.nu/meos/sv/show.php?base=5400&id=5484) | `features/07-hantera-flera-etapper/hantera-flera-etapper.feature` |
| [x] | 5486 | &nbsp;&nbsp;[Förberelser](https://melin.nu/meos/sv/show.php?base=5400&id=5486) | `features/07-hantera-flera-etapper/forberelser.feature` |
| [x] | 5487 | &nbsp;&nbsp;[Genomföra etappen](https://melin.nu/meos/sv/show.php?base=5400&id=5487) | `features/07-hantera-flera-etapper/genomfora-etappen.feature` |
| [x] | 5488 | &nbsp;&nbsp;[Speciallottning och jaktstart](https://melin.nu/meos/sv/show.php?base=5400&id=5488) | `features/07-hantera-flera-etapper/speciallottning-och-jaktstart.feature` |
| [x] | 5485 | &nbsp;&nbsp;[Resultat](https://melin.nu/meos/sv/show.php?base=5400&id=5485) | `features/07-hantera-flera-etapper/resultat.feature` |

## Speakerstod

| | Sida | Dokumentation | Feature-fil |
|---|---|---|---|
| [x] | 5463 | [Speakerstöd](https://melin.nu/meos/sv/show.php?base=5400&id=5463) | `features/08-speakerstod/speakerstod.feature` |
| [x] | 5467 | &nbsp;&nbsp;[Händelsevyn](https://melin.nu/meos/sv/show.php?base=5400&id=5467) | `features/08-speakerstod/handelsevyn.feature` |
| [x] | 5468 | &nbsp;&nbsp;[Klassvyn](https://melin.nu/meos/sv/show.php?base=5400&id=5468) | `features/08-speakerstod/klassvyn.feature` |
| [x] | 5464 | &nbsp;&nbsp;[Inmatning av passertider](https://melin.nu/meos/sv/show.php?base=5400&id=5464) | `features/08-speakerstod/inmatning-av-passertider.feature` |
| [x] | 5465 | &nbsp;&nbsp;[Elektroniska passertider](https://melin.nu/meos/sv/show.php?base=5400&id=5465) | `features/08-speakerstod/elektroniska-passertider.feature` |
| [x] | 5466 | &nbsp;&nbsp;[Redigera passertider](https://melin.nu/meos/sv/show.php?base=5400&id=5466) | `features/08-speakerstod/redigera-passertider.feature` |
| [x] | 5469 | &nbsp;&nbsp;[Prioritera bevakning av vissa deltagare](https://melin.nu/meos/sv/show.php?base=5400&id=5469) | `features/08-speakerstod/prioritera-bevakning-av-vissa-deltagare.feature` |
| [x] | 5471 | &nbsp;&nbsp;[Rapportläge](https://melin.nu/meos/sv/show.php?base=5400&id=5471) | `features/08-speakerstod/rapportlage.feature` |
| [x] | 5470 | &nbsp;&nbsp;[Liveresultat – stoppur](https://melin.nu/meos/sv/show.php?base=5400&id=5470) | `features/08-speakerstod/liveresultat-stoppur.feature` |

## Lag stafetter gafflingar och flera lopp

| | Sida | Dokumentation | Feature-fil |
|---|---|---|---|
| [x] | 5472 | [Lag, stafetter, gafflingar och flera lopp](https://melin.nu/meos/sv/show.php?base=5400&id=5472) | `09-lag-stafetter-gafflingar-och-flera-lopp/lag-och-gaffling-funktioner.feature` |
| [x] | 5474 | &nbsp;&nbsp;[Bantilldelning](https://melin.nu/meos/sv/show.php?base=5400&id=5474) | `features/09-lag-stafetter-gafflingar-och-flera-lopp/bantilldelning.feature` |
| [x] | 5475 | &nbsp;&nbsp;[Sträckors egenskaper](https://melin.nu/meos/sv/show.php?base=5400&id=5475) | `features/09-lag-stafetter-gafflingar-och-flera-lopp/strackors-egenskaper.feature` |
| [x] | 5476 | &nbsp;&nbsp;[Hantera lag](https://melin.nu/meos/sv/show.php?base=5400&id=5476) | `features/09-lag-stafetter-gafflingar-och-flera-lopp/hantera-lag.feature` |
| [x] | 5477 | &nbsp;&nbsp;&nbsp;&nbsp;[Importera laguppställningar](https://melin.nu/meos/sv/show.php?base=5400&id=5477) | `features/09-lag-stafetter-gafflingar-och-flera-lopp/importera-laguppstallningar.feature` |
| [x] | 5478 | &nbsp;&nbsp;&nbsp;&nbsp;[Skapa anonyma lagmedlemmar](https://melin.nu/meos/sv/show.php?base=5400&id=5478) | `features/09-lag-stafetter-gafflingar-och-flera-lopp/skapa-anonyma-lagmedlemmar.feature` |
| [x] | 5479 | &nbsp;&nbsp;&nbsp;&nbsp;[Direktanmälan](https://melin.nu/meos/sv/show.php?base=5400&id=5479) | `features/09-lag-stafetter-gafflingar-och-flera-lopp/direktanmalan.feature` |
| [x] | 5473 | &nbsp;&nbsp;[Omstart](https://melin.nu/meos/sv/show.php?base=5400&id=5473) | `features/09-lag-stafetter-gafflingar-och-flera-lopp/omstart.feature` |

## Kval och final knockout sprint

| | Sida | Dokumentation | Feature-fil |
|---|---|---|---|
| [ ] | 5503 | [Kval och final – knockout sprint](https://melin.nu/meos/sv/show.php?base=5400&id=5503) | `features/10-kval-och-final-knockout-sprint/kval-och-final-knockout-sprint.feature` |
| [~] | 5504 | &nbsp;&nbsp;[Redigera kval/final-scheman](https://melin.nu/meos/sv/show.php?base=5400&id=5504) | `10-kval-och-final-knockout-sprint/redigera-kval-final-scheman.feature` |
| [ ] | 5505 | &nbsp;&nbsp;[Exempelscheman](https://melin.nu/meos/sv/show.php?base=5400&id=5505) | `features/10-kval-och-final-knockout-sprint/exempelscheman.feature` |

## Rogaining

| | Sida | Dokumentation | Feature-fil |
|---|---|---|---|
| [~] | 5482 | [Rogaining](https://melin.nu/meos/sv/show.php?base=5400&id=5482) | `11-rogaining/rogaining-funktioner.feature` |
| [ ] | 5483 | &nbsp;&nbsp;[Rogaining i lag](https://melin.nu/meos/sv/show.php?base=5400&id=5483) | `features/11-rogaining/rogaining-i-lag.feature` |

## Redigera listor

| | Sida | Dokumentation | Feature-fil |
|---|---|---|---|
| [ ] | 5489 | [Redigera listor](https://melin.nu/meos/sv/show.php?base=5400&id=5489) | `features/12-redigera-listor/redigera-listor.feature` |
| [ ] | 5490 | &nbsp;&nbsp;[Grundprinciper](https://melin.nu/meos/sv/show.php?base=5400&id=5490) | `features/12-redigera-listor/grundprinciper.feature` |
| [ ] | 5491 | &nbsp;&nbsp;[Egenskaper för listan](https://melin.nu/meos/sv/show.php?base=5400&id=5491) | `features/12-redigera-listor/egenskaper-for-listan.feature` |
| [ ] | 5492 | &nbsp;&nbsp;[Listposter](https://melin.nu/meos/sv/show.php?base=5400&id=5492) | `features/12-redigera-listor/listposter.feature` |
| [ ] | 5493 | &nbsp;&nbsp;[Data från resultatmoduler](https://melin.nu/meos/sv/show.php?base=5400&id=5493) | `features/12-redigera-listor/data-fran-resultatmoduler.feature` |
| [ ] | 5494 | &nbsp;&nbsp;[Bilder](https://melin.nu/meos/sv/show.php?base=5400&id=5494) | `features/12-redigera-listor/bilder.feature` |
| [ ] | 5495 | &nbsp;&nbsp;[Listor för sträcktidsutskrift](https://melin.nu/meos/sv/show.php?base=5400&id=5495) | `features/12-redigera-listor/listor-for-stracktidsutskrift.feature` |

## Resultatmoduler

| | Sida | Dokumentation | Feature-fil |
|---|---|---|---|
| [ ] | 5497 | [Resultatmoduler](https://melin.nu/meos/sv/show.php?base=5400&id=5497) | `features/13-resultatmoduler/resultatmoduler.feature` |
| [ ] | 5498 | &nbsp;&nbsp;[MRL – MeOS Result Language](https://melin.nu/meos/sv/show.php?base=5400&id=5498) | `features/13-resultatmoduler/mrl-meos-result-language.feature` |
| [ ] | 5499 | &nbsp;&nbsp;[Resultatregler](https://melin.nu/meos/sv/show.php?base=5400&id=5499) | `features/13-resultatmoduler/resultatregler.feature` |
| [ ] | 5500 | &nbsp;&nbsp;[Definierade symboler](https://melin.nu/meos/sv/show.php?base=5400&id=5500) | `features/13-resultatmoduler/definierade-symboler.feature` |
| [ ] | 5501 | &nbsp;&nbsp;[Testkörning och avlusning](https://melin.nu/meos/sv/show.php?base=5400&id=5501) | `features/13-resultatmoduler/testkorning-och-avlusning.feature` |

## Appendix

| | Sida | Dokumentation | Feature-fil |
|---|---|---|---|
| [ ] | 5480 | &nbsp;&nbsp;[Appendix I: Eventorkoppling](https://melin.nu/meos/sv/show.php?base=5400&id=5480) | `features/14-appendix/appendix-i-eventorkoppling.feature` |
| [ ] | 5481 | &nbsp;&nbsp;[Appendix II: Tabelläge](https://melin.nu/meos/sv/show.php?base=5400&id=5481) | `features/14-appendix/appendix-ii-tabellage.feature` |
| [ ] | 5502 | &nbsp;&nbsp;[Appendix III: Mästerskap med kval och final](https://melin.nu/meos/sv/show.php?base=5400&id=5502) | `features/14-appendix/appendix-iii-masterskap-med-kval-och-final.feature` |
| [-] | 5496 | &nbsp;&nbsp;[Appendix IV: MeOS på Mac och Linux](https://melin.nu/meos/sv/show.php?base=5400&id=5496) | — (miljöinstruktion: MeOS under Wine) |
