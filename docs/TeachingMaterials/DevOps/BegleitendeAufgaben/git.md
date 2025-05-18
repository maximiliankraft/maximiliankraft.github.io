---
layout: page
title: Begleitende Aufgabe - Versionsverwaltung
menubar: false
nav_exclude: true
exclude: true
nav: false
---

Erstelle von deiner Programmieraufgabe regelmäßig commits mit `git`. Es ist besser etwas zu viele Commits zu machen als zu wenige. Zumindest nach jeder Unterrichtsstunde sollte ein Commit gemacht werden. Gerne mehr. Gehe dabei wie folgt vor in der Konsole:

```sh
cd <dein Projektpfad>
git init # zum anlegen eine neuen Repositories
git add . # zum hinzufügen neuer Dateien in git
git stage . #  beim nächsten commit werden alle Dateien im Ordner angefügt
git commit -m "<beschreibung was du implementiert hast>" 

# optional
git push # hochladen der Änderungen auf Github, Gitlab etc.
```
