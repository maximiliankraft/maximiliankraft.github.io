---
layout: page
title: Implementierung eines Kontaktformulars mit Remix
permalink: /Assignments/3XHIF/WMC/Assignment3
menubar: false
nav_exclude: true
exclude: true
nav: false
---

## Ziel
Erweiterne deine Remix-Webseite um ein  Kontaktformular mit Validierungs- und Feedback-Funktionen.

## Voraussetzungen
- Abgeschlossene erste und zweite Aufgabenstellung
- Grundlegendes Verständnis von Remix-Actions und HTML-Formularen

## Aufgaben

### 1. Erweiterung der Kontaktseite
a) Überarbeite die bestehende `/contact`-Route aus Übung 1
b) Implementiere ein erweitertes Kontaktformular mit folgenden Feldern:
   - Name (Vorname, Nachname)
   - E-Mail
   - Telefonnummer (optional)
   - Betreff (Dropdown-Auswahl)
   - Nachricht
   - Bevorzugte Kontaktmethode (Radio-Buttons)

### 2. Implementierung einer Remix-Action
a) Erstelle eine `action`-Funktion für die Kontaktseite.
b) Implementiere eine serverseitige Formularvalidierung in der `action`-Funktion.
c) Simuliere das Senden einer E-Mail (z.B. durch Logging der Formulardaten in einer Datei).

### 3. Clientseitige Formularvalidierung
a) Implementiere eine reaktive, clientseitige Validierung für alle Formularfelder.
b) Zeige Fehlermeldungen in Echtzeit an, während der Benutzer tippt.
c) Deaktiviere den Submit-Button, wenn das Formular ungültig ist.

### 4. Reaktive Daten-Bindung
a) Implementiere ein Two-Way-Binding für alle Formularfelder.
b) Erstelle eine Vorschau der Formulardaten, die sich in Echtzeit aktualisiert.

### 5. Fortgeschrittenes Fehler-Handling
a) Nutze die `useActionData` Hook, um Fehlermeldungen vom Server anzuzeigen.
b) Implementiere eine Fehleranzeige für Netzwerkfehler oder serverseitige Probleme.

### 6. Fortgeschrittene UI-Elemente
a) Implementieren Sie einen mehrstufigen Formularprozess
b) Fügen Sie einen Ladeindikator hinzu, der während der Formularübermittlung angezeigt wird.

### 7. Zugänglichkeit und UX
a) Stellen Sie sicher, dass das Formular vollständig tastaturzugänglich ist.
    - TabIndex einstellen
    - Placeholder für die Textfelder
b) Implementieren Sie ARIA-Attribute für verbesserte Zugänglichkeit.
c) Fügen Sie Fokus-Management hinzu, um nach der Formularübermittlung auf Fehlermeldungen zu fokussieren.

## Abgabe


## Bewertungskriterien
- Korrekte Implementierung der Remix-Action und clientseitiger Validierung
- Effektive Nutzung reaktiver Daten-Bindung und Echtzeit-Aktualisierungen
- Robustes Fehler-Handling und Benutzer-Feedback
- Zugänglichkeit und Benutzerfreundlichkeit des Formulars
- Code-Qualität und -Organisation