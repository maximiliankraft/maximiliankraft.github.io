---
layout: page
title: Erstellung einer Django-Webseite für Bioinformatik-Anwendungen
permalink: /Assignments/5XBGM/MGIN/Uebung1
menubar: false
nav_exclude: true
exclude: true
nav: false
---

## Zielsetzung
In dieser Übung werdet ihr die Grundlagen für eine Django-Webseite erstellen, die später als Basis für verschiedene bioinformatische Anwendungen dienen wird. Der Fokus liegt zunächst auf dem Aufbau der Django-Struktur und der Implementierung grundlegender Funktionen wie Formulareingaben und Datei-Uploads.

## Aufgabenstellung

### 1. Django-Projekt einrichten
- Erstelle ein neues Django-Projekt mit dem Namen "BioinformaticsToolbox".
- Erstelle innerhalb des Projekts eine neue App mit dem Namen "sequencetools".

### 2. Modelle erstellen
- Erstelle in der `models.py` Datei ein Modell namens `SequenceSubmission` mit folgenden Feldern:
  - `text_input`: Ein TextField für Texteingaben
  - `file_upload`: Ein FileField für Datei-Uploads
  - `submission_date`: Ein DateTimeField, das automatisch den Zeitpunkt des Uploads speichert

### 3. Formulare implementieren
- Erstelle in einer neuen Datei `forms.py` ein Django-Formular, das die Eingabe von Text und das Hochladen von Dateien ermöglicht.

### 4. Views erstellen
- Implementiere in `views.py` zwei Views:
  1. `submit_sequence`: Verarbeitet das Formular und speichert die Eingaben in der Datenbank.
  2. `view_submissions`: Zeigt alle bisher gemachten Eingaben an.

### 5. Templates gestalten
- Erstelle zwei HTML-Templates:
  1. `submit.html`: Enthält das Formular zur Eingabe und zum Datei-Upload.
  2. `submissions.html`: Zeigt alle bisherigen Eingaben tabellarisch an.

### 6. URLs konfigurieren
- Füge in der `urls.py` Datei die notwendigen URL-Patterns hinzu, um die Views mit den entsprechenden URLs zu verknüpfen.

### 7. Gestaltung und Benutzerfreundlichkeit
- Verwende Bootstrap, Tailwind oder ein anderes CSS-Framework, um die Webseite ansprechend zu gestalten.
- Implementiere eine einfache Navigation zwischen den Seiten.

### 8. Testen
- Teste deine Anwendung gründlich:
  - Können Texteingaben gemacht werden?
  - Funktioniert der Datei-Upload?
  - Werden die Eingaben korrekt in der Datenbank gespeichert?
  - Werden alle Eingaben auf der Übersichtsseite angezeigt?

## Zusatzaufgaben (optional)
- Implementiere eine einfache Validierung für die Texteingabe (z.B. nur DNA-Sequenzen erlauben).
- Füge eine Funktion hinzu, die die Länge der eingegebenen Sequenz berechnet und anzeigt.

## Abgabe
- Dokumentiere in einem Protokoll deine Vorgehensweise
    - Insbesondere die Tests aus Punkt 8 müssen durchgeführt werden und mit Screenshots demonstriert werden dass alles funktioniert
- Verwende folgende Protokollvorlage: [Protokoll Vorlage.docx](/TeachingMaterials/General/Protokoll%20Vorlage.docx)


## Weitere Infos

- [Django Installationsanleitung](https://docs.djangoproject.com/en/5.1/intro/install/)
- [Erstes Django Projekt](https://docs.djangoproject.com/en/5.1/intro/tutorial01/)
- [File Uploads](https://docs.djangoproject.com/en/5.1/topics/http/file-uploads/)