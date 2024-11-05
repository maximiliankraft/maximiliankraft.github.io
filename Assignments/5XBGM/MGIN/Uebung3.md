---
layout: page
title: Übungen - Multiple Sequence Alignment und Phylogenetischer Baum
permalink: /Assignments/5XBGM/MGIN/Uebung3
menubar: false
nav_exclude: true
exclude: true
nav: false
---

## Zielsetzung
In diesen zwei Übungen erweiterst du deine Django-Webseite um Funktionen für Multiple Sequence Alignment (MSA) bzw. die Erstellung eines phylogenetischen Baums. Diese Funktionen werden von bereits bestehenden separaten Container bereitgestellt. Realistische Testdaten kannst du dir z.B von der [NCBI dbVar](https://www.ncbi.nlm.nih.gov/dbvar) oder der [NCBI Nucleotide DB](https://www.ncbi.nlm.nih.gov/nuccore) holen. 

## Aufgabenstellung

### Erweiterung der Django-Webseite
- Füge der bestehenden Django-Webseite ein neues Formular hinzu, das mehrere Sequenzen für das MSA akzeptiert.
- Implementiere eine neue View, die die eingegebenen Sequenzen an den MSA-Service sendet
- Für das Alignment kannst du z.B einen [Muscle-Container](https://hub.docker.com/r/biocontainers/muscle) verwenden
  - Auch andere Container wie [Emboss](https://hub.docker.com/r/biocontainers/emboss) sind möglich
  - [Hier](https://biopython.org/docs/dev/Tutorial/chapter_msa.html) eine Liste von Programmen die Biopython unterstützt


### Implementierung des Phylogenie-Services
- Verwende einen bestehenden Microservice für den Phylogenie-Service
  - Möglich wäre z.B der [raxml](https://hub.docker.com/r/biocontainers/raxml)-Container

### Integration und Kommunikation
- Implementiere die Kommunikation zwischen der Django-Webseite und dem MSA- bzw. Phylogenie-Service.
- Starte die Container direkt über os.system (Einfach Kommandos wie `docker run` übergeben) oder über das offizielle [docker](https://pypi.org/project/docker/)-Pythoninterface von der Docker Foundation 

### Datenverarbeitung und Visualisierung
- Verarbeite die vom Service zurückgegebenen Daten in Django.
- Erstelle eine Ansicht zur Darstellung des MSA (z.B. mit einer JavaScript-Bibliothek wie MSAViewer)
  - Im letzten [MSA-Viewer Release](https://github.com/wilzbach/msa/releases/tag/v1.0.0) muss man eine Zeile auskommentieren, dann funktionierts wieder. Deren [Beispielcode](http://msa.biojs.net/app/) muss nur etwas abgeändert werden 
- Visualisiere den phylogenetischen Baum mit raxml, Um DNA-Sequenzen zusammenzufassen benötigt man die Methode `GTRGAMMA`

### Container-Orchestrierung
- Erstelle ein Docker-Compose-File, das sowohl den Django-Container als auch die Service-Container beinhaltet.

## Detaillierte Aufgabenschritte

1. **Django-Erweiterung:**
   - Erstelle ein neues Modell `MultipleSequenceSubmission` in Django.
   - Implementiere ein Formular, das mehrere Sequenzen akzeptiert.
   - Erstelle eine neue View `submit_msa`, die die Sequenzen entgegennimmt und an den Service sendet.

2. **MSA- und Phylogenie-Service:**
   - Verwende Biopython's `Bio.Align.MultipleSeqAlignment` für das MSA.
   - Nutzen `Bio.Phylo` für die Erstellung des phylogenetischen Baums.



4. **Visualisierung:**
   - Verwende JavaScript-Bibliotheken zur Darstellung des MSA und des phylogenetischen Baums.
   - Beispiel für die Integration von [MSAViewer](http://msa.biojs.net/app/)
   - Der MSAViewer von BioJS braucht eine Datei im CLUSTAL_Format um das Alignment darstellen zu können
   - NAchdem MUSCLE nur im FASTA-Format arbeiten kann ist es notwendig eine Umwandlung zwischen den Dateiformaten vorzunehmen
  

## Zusatzaufgaben (optional)
- Implementiere verschiedene MSA-Algorithmen (z.B. ClustalW, MUSCLE) und lasse den Benutzer wählen.
- Füge Optionen für verschiedene phylogenetische Baum-Konstruktionsmethoden hinzu.
- Implementiere eine Funktion zum Exportieren der Ergebnisse in gängige Formate (z.B. Newick für Bäume, FASTA für Alignments).

## Abgabe
- Stelle sicher, dass doe Docker-Container korrekt konfiguriert und lauffähig sind
- Dokumentiere die API-Endpunkte des MSA-Services.
- Protokolliere die Durchführung und die Ergebnisse
- Verwende folgende Protokollvorlage: [Protokoll Vorlage.docx](/TeachingMaterials/General/Protokoll%20Vorlage.docx)
