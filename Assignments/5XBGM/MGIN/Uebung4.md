---
layout: page
title: Übungsaufgabe - Integration von NCBI BLAST in den ORF-Finder
permalink: /Assignments/5XBGM/MGIN/Uebung4
menubar: false
nav_exclude: true
exclude: true
nav: false
---

## Einführung
In dieser Übung wirst du dein ORF-Finder-Projekt um eine NCBI BLAST-Funktionalität erweitern. Die gefundenen ORF-Sequenzen werden an den NCBI BLAST-Service gesendet, um nach ähnlichen Sequenzen in der NCBI-Datenbank zu suchen. Die Übung soll verdeutlichen, wie man externe Dienste in bestehende Systeme integriert und die Ergebnisse verarbeitet.

## Lernziele
- Integration externer Dienste (NCBI BLAST) in ein bestehendes Django-Projekt
- Verwendung von Biopython für BLAST-Abfragen
- Asynchrone Verarbeitung von zeitaufwändigen Aufgaben (Requests)
- Darstellung und Interpretation von BLAST-Ergebnissen

## Aufgabenstellung

### 1. Vorbereitung
- Installiere Biopython für die Projekte in den entsprechenden ContainernS
- Registriere eidh sich für einen NCBI API-Schlüssel (https://www.ncbi.nlm.nih.gov/account/settings/).
    - Vorzugsweise mit der Spengergassen-Email

### 2. Erweiterung des ORF-Finder-Containers
- Implementiere eine neue Funktion im ORF-Finder-Container, die die gefundenen ORFs entgegennimmt und BLAST-Abfragen durchführt.
- Verwende z.B die Biopython [Bio.Blast.NCBIWWW](https://biopython.org/docs/1.75/api/Bio.Blast.NCBIWWW.html)-Module für die BLAST-Suche. Verwende `blastx` als Algorithmus. Mehr Infos zu den unterschieden [hier](https://www.ncbi.nlm.nih.gov/books/NBK1734/#:~:text=5.1.%20Available%20Translated%20Searches)
- Die Funktion sollte folgende Parameter akzeptieren:
  - ORF-Sequenz
  - E-value Threshold
  - Maximale Anzahl von Treffern

### 3. Anpassung der Django-Webanwendung
- Erweiter die ORF-Ergebnisseite um eine Option, für jeden gefundenen ORF eine BLAST-Suche zu starten.
- Erstelle eine neue View zur Anzeige der BLAST-Ergebnisse.

### 4. Ergebnisdarstellung
- Zeige die BLAST-Ergebnisse in einer übersichtlichen Tabelle an, die folgende Informationen enthält:
  - Sequenzbeschreibung
  - E-value
  - Bit-Score
  - Identität (in Prozent)
  - Alignmentlänge
- Implementiere eine Option, um detaillierte Alignment-Informationen für jeden Treffer anzuzeigen. Was halt von der API als Ergebnis noch zurückkommt.

### 5. Fehlerbehandlung und Benutzerfreundlichkeit
- Implementiere eine robuste Fehlerbehandlung für Netzwerkprobleme oder NCBI-Serverfehler.
- Ermögliche das Abbrechen laufender BLAST-Abfragen.

### 6. Protokollierung
- Dokumentiere den Code ausführlich, insbesondere die Integration mit NCBI BLAST.
- Schreibe kurz und die Vor- und Nachteile der Nutzung externer Dienste wie NCBI BLAST. Kann man BLAST auch lokal hosten?
- Verwende folgende Protokollvorlage: [Protokoll Vorlage.docx](/TeachingMaterials/General/Protokoll%20Vorlage.docx)

## Bonusaufgaben
- Implementiere eine Funktion zum Herunterladen der BLAST-Ergebnisse als CSV- oder Excel-Datei.
- Erweiter die Anwendung um die Möglichkeit, verschiedene BLAST-Programme (blastn, blastp, blastx, tblastn, tblastx) auszuwählen.

## Bewertungskriterien
- Korrekte Implementation der BLAST-Funktionalität mit Biopython
- Effektive Integration des BLAST-Services in die bestehende Django-Anwendung
- Benutzerfreundlichkeit und Übersichtlichkeit der BLAST-Ergebnisdarstellung
- Robustheit der Implementierung (Fehlerbehandlung, Asynchronität)
- Qualität der Dokumentation und der Reflexion

## Hinweise
- Beachten die Rate-Limits bei der Implementierung.
- Testen deine Anwendung gründlich mit verschiedenen Eingabesequenzen und Parametern.
- Achten auf eine effiziente Verarbeitung, insbesondere bei großen Sequenzen oder vielen ORFs.

## Weitere Unterlagen

> [Blast Quick Start](https://www.ncbi.nlm.nih.gov/books/NBK1734/)