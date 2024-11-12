---
layout: page
title: Übung Phylogenetischer Baum
permalink: /Assignments/5XBGM/MGIN/Uebung3A
menubar: false
nav_exclude: true
exclude: true
nav: false
---

## Zielsetzung
In dieser Übung erweiterst du deine Django-Webseite um Funktionen zur Erstellung eines phylogenetischen Baums. Diese Funktionalität wird von einem bereits bestehenden separaten Container bereitgestellt. Realistische Testdaten kannst du dir z.B von der [NCBI dbVar](https://www.ncbi.nlm.nih.gov/dbvar) oder der [NCBI Nucleotide DB](https://www.ncbi.nlm.nih.gov/nuccore) holen. 
## Aufgabenstellung
### Erweiterung der Django-Webseite

- Füge der bestehenden Django-Webseite ein neues Formular hinzu, das mehrere Sequenzen für die phylogenetische Analyse akzeptiert
- Implementiere eine neue View, die die eingegebenen Sequenzen an den Phylogenie-Service sendet

### Implementierung des Phylogenie-Services

- Verwende einen bestehenden Microservice für den Phylogenie-Service

  - Möglich wäre z.B der [raxml](https://hub.docker.com/r/biocontainers/raxml)-Container


Für DNA-Sequenzen wird die Methode `GTRGAMMA` benötigt

### Integration und Kommunikation

 - Implementiere die Kommunikation zwischen der Django-Webseite und dem Phylogenie-Service
- Starte die Container direkt über os.system (Einfach Kommandos wie `docker run` übergeben) oder über das offizielle [docker](https://pypi.org/project/docker/)-Pythoninterface von der Docker Foundation 

### Datenverarbeitung und Visualisierung

   - Nutzen `Bio.Phylo` für die Erstellung des phylogenetischen Baums. Dieser kann dort direkt gezeichnet und als Bild ausgegeben werden.
    - Schicke das Bild dann zum Client

### Container-Orchestrierung

Erstelle ein Docker-Compose-File, das sowohl den Django-Container als auch den Phylogenie-Service-Container beinhaltet

## Zusatzaufgaben (optional)
- Füge Optionen für verschiedene phylogenetische Baum-Konstruktionsmethoden hinzu.
- Implementiere eine Funktion zum Exportieren der Ergebnisse in gängige Formate (z.B. Newick für Bäume, FASTA für Alignments).

## Abgabe
- Stelle sicher, dass doe Docker-Container korrekt konfiguriert und lauffähig sind
- Dokumentiere die API-Endpunkte des MSA-Services.
- Protokolliere die Durchführung und die Ergebnisse
- Verwende folgende Protokollvorlage: [Protokoll Vorlage.docx](/TeachingMaterials/General/Protokoll%20Vorlage.docx)