---
layout: page
title: Implementierung eines Kontaktformulars mit Remix
permalink: /Assignments/3XHIF/WMC/Assignment4
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
- Überarbeite die bestehende `/contact`-Route aus Übung 1
- Implementiere ein erweitertes Kontaktformular mit folgenden Feldern:
   - Name (Vorname, Nachname)
   - E-Mail
   - Telefonnummer (optional)
   - Betreff (Dropdown-Auswahl)
   - Nachricht
   - Bevorzugte Kontaktmethode (Radio-Buttons)

### 2. Implementierung einer Remix-Action
 -  Erstelle eine `action`-Funktion für die Kontaktseite.
 -  Implementiere eine serverseitige Formularvalidierung in der `action`-Funktion.
 -  Simuliere das Senden einer E-Mail (z.B. durch Logging der Formulardaten in einer Datei).

### 3. Clientseitige Formularvalidierung
 -  Implementiere eine reaktive, clientseitige Validierung für alle Formularfelder.
 -  Zeige Fehlermeldungen in Echtzeit an, während der Benutzer tippt.
 -  Deaktiviere den Submit-Button, wenn das Formular ungültig ist.

### 4. Reaktive Daten-Bindung
 -  Implementiere ein Two-Way-Binding für alle Formularfelder.
 -  Erstelle eine Vorschau der Formulardaten, die sich in Echtzeit aktualisiert.

### 5. Fortgeschrittenes Fehler-Handling
 -  Nutze die `useActionData` Hook, um Fehlermeldungen vom Server anzuzeigen.
 -  Implementiere eine Fehleranzeige für Netzwerkfehler oder serverseitige Probleme.

### 6. Fortgeschrittene UI-Elemente
 -  Implementieren Sie einen mehrstufigen Formularprozess
 -  Fügen Sie einen Ladeindikator hinzu, der während der Formularübermittlung angezeigt wird.

### 7. Zugänglichkeit und UX
 -  Stellen Sie sicher, dass das Formular vollständig tastaturzugänglich ist.
    - TabIndex einstellen
    - Placeholder für die Textfelder
 -  Implementieren Sie ARIA-Attribute für verbesserte Zugänglichkeit.
 -  Fügen Sie Fokus-Management hinzu, um nach der Formularübermittlung auf Fehlermeldungen zu fokussieren.

## Abgabe


## Bewertungskriterien
- Korrekte Implementierung der Remix-Action und clientseitiger Validierung
- Effektive Nutzung reaktiver Daten-Bindung und Echtzeit-Aktualisierungen
- Robustes Fehler-Handling und Benutzer-Feedback
- Zugänglichkeit und Benutzerfreundlichkeit des Formulars
- Code-Qualität und -Organisation