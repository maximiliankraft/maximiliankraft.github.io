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
a) Füge eine neue Route `/skills` zu deiner Webseite hinzu.
b) Aktualisiere die Header-Komponente, um einen Link zu dieser neuen Seite einzufügen.

### 2. Implementierung der Loader Funktion
a) Erstelle eine `loader`-Funktion, die eine erste Liste von Fähigkeiten oder Projekten vom Server lädt.

### 3. Entwicklung einer wiederverwendbaren Komponente
a) Erstelle eine `SkillItem`-Komponente, die einen einzelnen Listeneintrag darstellt.
b) Diese Komponente sollte sowohl den Anzeigemodus als auch den Bearbeitungsmodus unterstützen (conditional rendering).

### 4. Implementierung der Skills-Liste
a) Verwende die `useLoaderData`-Hook, um die Daten aus der `loader`-Funktion zu erhalten.
b) Rendere die Liste der Fähigkeiten/Projekte unter Verwendung der `SkillItem`-Komponente und der `map`-Funktion.

### 5. Hinzufügen von Interaktivität
a) Implementiere ein Textfeld zum Hinzufügen neuer Fähigkeiten/Projekte.
b) Füge Funktionen zum Bearbeiten und Löschen von Einträgen hinzu.
c) Verwende die [useSubmit](https://remix.run/docs/en/main/hooks/use-submit)-Hook.

### 6. Filterung der Liste
a) Füge ein Suchfeld hinzu, das die Liste der Fähigkeiten/Projekte filtert.
b) Verwende die `filter`-Methode, um die Suchergebnisse anzuzeigen.
c) Implementiere die Filterung client-seitig für sofortige Ergebnisse.

### 7. Local Storage Integration
a) Verwende den [LocalStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage#examples), um die Liste der Fähigkeiten/Projekte zu speichern.
b) Aktualisiere den Local Storage bei Änderungen.

### 8. Fortgeschrittenes Styling
a) Verwende CSS-Transitionen oder Animationen, um das Hinzufügen/Entfernen von Listenelementen zu visualisieren.
    - kleiner Tipp: Mit ChatGPT o.ä geht das ganz gut dass man dem den aktuellen Code gibt und dazuschreibt "Füge animationen hinzu"
b) Implementiere ein responsives Design für die Liste, z.B mit einer Flexbox.

## Abgabe
- Ein Protokoll in dem die Umsetzung jedes Punktes beschrieben wird
    - Screenshots der Liste
    - Auszüge aus dem Code mit einer Beschreibung was dieser macht
    - Der kopierte Code soll als Text eingefügt werden. Dabei soll das Syntax-Highlighting erhalten bleiben.
- Verwende die Protokollvorlage


