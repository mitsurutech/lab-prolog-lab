# Prolog-Lab mit Docker Compose: Fakten, Regeln, Listen und Backtracking in SWI-Prolog

[English](README.md) | [Français](README.fr.md) | [Español](README.es.md) | [日本語](README.ja.md) | [Deutsch](README.de.md)

[![check](https://github.com/mitsurutech/lab-prolog-lab/actions/workflows/check.yml/badge.svg)](https://github.com/mitsurutech/lab-prolog-lab/actions/workflows/check.yml)

Ein fertiges Lab für den Unterricht aus der [MitsuruTech Learning Platform](https://mitsurutech.co.uk/learning), auf der Schulen, Hochschulen und Universitäten jeder lernenden Person eigene Datenbanken, Container und ein Terminal im Browser bereitstellen. Es ist ein fertiges SWI-Prolog-Lab: drei kleine Dateien mit Fakten, Familienregeln und Listenprogrammen sowie ein Terminal, in dem Sie Prolog Fragen dazu stellen.

Das Lab besteht aus einer einzigen `docker-compose`-Datei, `compose.yaml`, und läuft auf Ihrem eigenen Rechner genauso wie auf der Plattform, auf der jede lernende Person eine private Kopie ohne Zugang zum Internet erhält.

## Auf der Plattform nutzen

**Zum Ausprobieren:** Öffnen Sie die [Container-Seite](https://mitsurutech.co.uk/container), suchen Sie dieses Lab unter **Sample labs** (Beispiel-Labs) und klicken Sie auf Start. Dafür ist ein kostenloses Konto nötig.

**Als Aufgabe für einen Kurs:**

1. Legen Sie in Ihrem Modul eine Aufgabe vom Typ **Lab** an und wählen Sie **In a GitHub repository** (in einem GitHub-Repository).
2. Geben Sie `https://github.com/mitsurutech/lab-prolog-lab` mit dem Branch `main` an. Die Compose-Datei ist die Standarddatei `compose.yaml`. Erstellen Sie zuerst einen Fork des Repositorys, wenn Sie es ändern möchten.
3. Veröffentlichen Sie die Aufgabe (Publish). Die Kopie jeder lernenden Person beginnt mit dem Commit, den Sie veröffentlicht haben; eine spätere Änderung hier ändert also kein bereits gestelltes Lab.

Die [Seite zu diesem Lab](https://mitsurutech.co.uk/help/lab-prolog-lab) im Hilfehandbuch und die [Anleitung zu Container-Labs](https://mitsurutech.co.uk/help/labs) behandeln den Rest. Die passende Grundlagenlektion ist **Prolog Basics**, und das Lab wird im Hochschulmodul [Logic and functional programming](https://mitsurutech.co.uk/resources/university/logic-functional) bearbeitet. Noch kein Konto für Ihre Einrichtung? [Das erste Jahr ist kostenlos](https://mitsurutech.co.uk/pricing) für bis zu 50 Lernende, und die [Registrierung](https://mitsurutech.co.uk/signup) braucht nur eine E-Mail-Adresse.

## Auf dem eigenen Rechner ausführen

Sie benötigen Docker mit dem Compose-Plugin. Das Lab hat keine Webseite: Nutzen Sie sein Terminal.

```bash
docker compose up -d
docker compose exec prolog swipl -q -g "member(X, [a, b, c]), write(X), nl" -t halt
```

Beenden Sie es mit `docker compose down`; mit `docker compose down -v` entfernen Sie auch seine Dateien. Das Lab schreibt seine Lehrdateien nur beim ersten Mal in ein Volume, sodass die Änderungen einer lernenden Person nach einem Stopp und erneutem Start erhalten bleiben.

## Was in einem Lab nicht funktioniert

Das Lab hat keinen Zugang zum Internet, daher kann nichts hineininstalliert oder heruntergeladen werden. Alle Ausgaben der Werkzeuge sind auf Englisch. Der Kommentar am Anfang von `compose.yaml` beschreibt, was das Lab ist und was nicht.

## Das Lab prüfen

`test/check.sh` startet das Lab so, wie der Runner der Plattform jeden Dienst startet (alle Capabilities entfernt, `no-new-privileges`, ein Prozesslimit, Speicherlimits und kein Zugang zum Internet), und prüft dann, ob das Lab das tut, was seine Compose-Datei sagt. Es benötigt Docker und läuft bei jedem Push; das ist das Badge ganz oben.

```bash
test/check.sh
```

## Lizenz

Dieses Werk steht unter der Lizenz [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/). Sie dürfen es für Lernen und Lehren teilen und bearbeiten, sofern Sie Mitsuru Technologies Ltd nennen, es nicht kommerziell nutzen und alles, was Sie daraus erstellen, unter derselben Lizenz weitergeben. Den vollständigen Text finden Sie in der Datei `LICENSE`.

## Über uns

Entwickelt von [Mitsuru Technologies](https://mitsurutech.co.uk) für die [MitsuruTech Learning Platform](https://mitsurutech.co.uk/learning): Python, Java, Go, Node, SQL und Linux im Browser für Schulen und Hochschulen, mit Container-Labs, aus GitHub bereitgestellten Web-Apps und Quizzen, die sich selbst auswerten. Probieren Sie Code ohne Konto im [Playground](https://mitsurutech.co.uk/playground) aus.

Weitere Labs vom selben Anbieter: [lab-haskell-lab](https://github.com/mitsurutech/lab-haskell-lab), [lab-quantum-sim](https://github.com/mitsurutech/lab-quantum-sim), [lab-jupyter-data](https://github.com/mitsurutech/lab-jupyter-data) und [lab-git-gitea](https://github.com/mitsurutech/lab-git-gitea).
