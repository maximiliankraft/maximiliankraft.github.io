---
layout: page
title: Übung Multiple Sequence Alignment
permalink: /Assignments/5XBGM/MGIN/Uebung3
menubar: false
nav_exclude: true
exclude: true
nav: false
---

## Zielsetzung
In dieser Übung erweiterst du deine Django-Webseite um Funktionen für Multiple Sequence Alignment (MSA). Diese Funktionalität wird von einem bereits bestehenden separaten Container bereitgestellt. Realistische Testdaten kannst du dir z.B von der NCBI dbVar oder der NCBI Nucleotide DB holen.

## Aufgabenstellung

### Erweiterung der Django-Webseite

 - Füge der bestehenden Django-Webseite ein neues Formular hinzu, das mehrere Sequenzen für das MSA akzeptiert
 - Implementiere eine neue View, die die eingegebenen Sequenzen an den MSA-Service sendet
 - Für das Alignment kannst du z.B einen [Muscle-Container](https://hub.docker.com/r/biocontainers/muscle) verwenden
  - Auch andere Container wie [Emboss](https://hub.docker.com/r/biocontainers/emboss) sind möglich
  - [Hier](https://biopython.org/docs/dev/Tutorial/chapter_msa.html) eine Liste von Programmen die Biopython unterstützt


### Integration und Kommunikation

Implementiere die Kommunikation zwischen der Django-Webseite und dem MSA-Service
Starte die Container direkt über os.system (Einfach Kommandos wie 'docker run' übergeben) oder über das offizielle [docker](https://pypi.org/project/docker/)-Pythoninterface von der Docker Foundation

### Datenverarbeitung und Visualisierung

Verarbeite die vom Service zurückgegebenen Daten in Django
- Erstelle eine Ansicht zur Darstellung des MSA mit einer JavaScript-Bibliothek wie MSAViewer

Im letzten [MSA-Viewer Release](https://github.com/wilzbach/msa/releases/tag/v1.0.0) muss man eine Zeile auskommentieren, dann funktionierts wieder. Deren Beispielcode muss nur etwas abgeändert werden


Der MSAViewer von BioJS braucht eine Datei im CLUSTAL_Format
Da MUSCLE nur im FASTA-Format arbeiten kann ist eine Umwandlung zwischen den Dateiformaten notwendig.

Es ist auch möglich statt dem MAS-Viewer bei muscle den Parameter `-html` hinzuzufügen. Dann wird ebenfalls eine grafische Version des Alignments generiert.

### Container-Orchestrierung

Erstelle ein Docker-Compose-File, das sowohl den Django-Container als auch den MSA-Service-Container beinhaltet


## Zusatzaufgaben (optional)

- Implementiere verschiedene MSA-Algorithmen (z.B. ClustalW, MUSCLE) und lasse den Benutzer wählen
- Implementiere eine Funktion zum Exportieren der Ergebnisse in gängige Formate (FASTA, Clustal etc.) und biete die Dateien zum Download an.

## Abgabe
- Stelle sicher, dass doe Docker-Container korrekt konfiguriert und lauffähig sind
- Dokumentiere die API-Endpunkte des MSA-Services.
- Protokolliere die Durchführung und die Ergebnisse
- Verwende folgende Protokollvorlage: [Protokoll Vorlage.docx](/TeachingMaterials/General/Protokoll%20Vorlage.docx)
