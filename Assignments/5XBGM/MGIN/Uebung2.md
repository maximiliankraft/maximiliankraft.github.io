---
layout: page
title: Übungsaufgabe - ORF-Finder mit Django und Docker
permalink: /Assignments/5XBGM/MGIN/Uebung2
menubar: false
nav_exclude: true
exclude: true
nav: false
---


## Einführung
In dieser Übung wirst du deine Django-Webseite um eine ORF (Open Reading Frame) Finder-Funktionalität erweitern. Zusätzlich wirst du einen separaten Docker-Container erstellen, der die Verarbeitung der ORF-Suche übernimmt. Dies simuliert ein verteiltes System, bei dem rechenintensive Aufgaben ausgelagert werden. Wie man es oft in der Bioinformatik braucht. Den Container könnte man ja im späteren Verlauf in einem Rechenzentrum starten z.B. 

## Aufgabenstellung

### Teil 1: Erweiterung der Django-Webseite
1. Erweiter deine bestehende Django-Webseite um ein neues Formular für die ORF-Suche.
2. Das Formular soll folgende Eingabefelder haben:
   - Textfeld für die DNA-Sequenz
   - Numerisches Feld für die minimale ORF-Länge
   - Checkbox für die Suche auf beiden DNA-Strängen (vorwärts und rückwärts)
3. Erstelle eine neue View, die die Formulardaten entgegennimmt und an den Docker-Container sendet.
4. Implementiere eine Ergebnisseite, die die gefundenen ORFs anzeigt. Dabei kannst du dich am ORF Finder von NCBI orientieren.

### Teil 2: Erstellung des Docker-Containers für die ORF-Suche
1. Erstelle einen neuen Docker-Container, der Python und die notwendigen Bibliotheken für die ORF-Suche enthält.
2. Implementiere einen einfachen Web-Server (z.B. mit fastAPI, Flask, pure Python etc.) im Container, der POST-Anfragen mit DNA-Sequenzen entgegennimmt.
3. Schreibe eine Python-Funktion zur ORF-Suche, die folgende Schritte durchführt:
   - Identifizierung von Start- (ATG) und Stopp-Codons (TAA, TAG, TGA)
   - Suche nach ORFs mit der angegebenen Mindestlänge
   - Optional: Suche auf beiden DNA-Strängen
4. Der Container soll die gefundenen ORFs im JSON-Format zurückgeben.

### Teil 3: Integration und Kommunikation
1. Konfiguriere die Django-Anwendung so, dass sie mit dem Docker-Container kommunizieren kann.
2. Implementiere die Datenübertragung zwischen Django und dem Docker-Container mittels HTTP-Requests.
3. Verarbeite die JSON-Antwort des Containers in Django und stelle die Ergebnisse auf der Webseite dar.

### Teil 4: Protokollierung
1. Dokumentiere Deinen Code ausführlich.
2. Schreibe kurz über die Vor- und Nachteile diese Verteilten ansatzes. 
3. Teste die Funktionalität mit bestehenden ORF-Findern und vergleiche die Ergebnisse
        - [ORF Finder von NCBI](https://www.ncbi.nlm.nih.gov/orffinder/)
4. Verwende folgende Protokollvorlage: [Protokoll Vorlage.docx](/TeachingMaterials/General/Protokoll%20Vorlage.docx)

## Bonusaufgaben
- Füge eine Option hinzu, um die gefundenen ORFs als Datei herunterzuladen.


## Bewertungskriterien
- Funktionalität der Django-Webseite und des Docker-Containers
- Korrektheit der ORF-Suche
- Code-Qualität und Dokumentation
- Verständnis und Umsetzung des verteilten Systemkonzepts
- Benutzerfreundlichkeit der Weboberfläche

## Weitere Unterlagen

- [Container der einen anderen startet](https://stackoverflow.com/a/39470462/17996814)
- [FastAPI Tutorial](https://fastapi.tiangolo.com/tutorial/first-steps/)
