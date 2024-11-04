---
layout: page
title: Erweiterung der Remix-Webseite mit interaktiver Liste
permalink: /Assignments/3XHIF/WMC/Assignment2
menubar: false
nav_exclude: true
exclude: true
nav: false
---


## Ziel
Erweitere deine persönliche Remix-Webseite aus der vorherigen Übung um eine interaktive, editierbare Liste von Fähigkeiten oder Projekten.

## Voraussetzungen
- Abgeschlossene erste Aufgabenstellung (Grundlegende Remix-Webseite)
- Vertrautheit mit JavaScript-Array-Methoden (filter, map, find)

## Aufgaben

### 1. Erstellen einer neuen Route
- Füge eine neue Route `/skills` zu deiner Webseite hinzu.
- Aktualisiere die Header-Komponente, um einen Link zu dieser neuen Seite einzufügen.

### 2. Implementierung der Loader Funktion
- Erstelle eine `loader`-Funktion, die eine erste Liste von Fähigkeiten oder Projekten vom Server lädt.

### 3. Entwicklung einer wiederverwendbaren Komponente
- Erstelle eine `SkillItem`-Komponente, die einen einzelnen Listeneintrag darstellt.
- Diese Komponente sollte sowohl den Anzeigemodus als auch den Bearbeitungsmodus unterstützen (conditional rendering).

### 4. Implementierung der Skills-Liste
- Verwende die `useLoaderData`-Hook, um die Daten aus der `loader`-Funktion zu erhalten.
- Rendere die Liste der Fähigkeiten/Projekte unter Verwendung der `SkillItem`-Komponente und der `map`-Funktion.

### 5. Hinzufügen von Interaktivität
- Implementiere ein Textfeld zum Hinzufügen neuer Fähigkeiten/Projekte.
- Füge Funktionen zum Bearbeiten und Löschen von Einträgen hinzu.
- Verwende die [useSubmit](https://remix.run/docs/en/main/hooks/use-submit)-Hook.

### 6. Filterung der Liste
- Füge ein Suchfeld hinzu, das die Liste der Fähigkeiten/Projekte filtert.
- Verwende die `filter`-Methode, um die Suchergebnisse anzuzeigen.
- Implementiere die Filterung client-seitig für sofortige Ergebnisse.

### 7. Local Storage Integration
- Verwende den [LocalStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage#examples), um die Liste der Fähigkeiten/Projekte zu speichern.
- Aktualisiere den Local Storage bei Änderungen.

### 8. (Optional) Fortgeschrittenes Styling
- Verwende CSS-Transitionen oder Animationen, um das Hinzufügen/Entfernen von Listenelementen zu visualisieren.
    - kleiner Tipp: Mit ChatGPT o.ä geht das ganz gut dass man dem den aktuellen Code gibt und dazuschreibt "Füge animationen hinzu"
- Implementiere ein responsives Design für die Liste, z.B mit einer Flexbox.

## Abgabe
- Ein Protokoll in dem die Umsetzung jedes Punktes beschrieben wird
    - Screenshots der Liste
    - Auszüge aus dem Code mit einer Beschreibung was dieser macht
    - Der kopierte Code soll als Text eingefügt werden. Dabei soll das Syntax-Highlighting erhalten bleiben.
- Verwende die Protokollvorlage


