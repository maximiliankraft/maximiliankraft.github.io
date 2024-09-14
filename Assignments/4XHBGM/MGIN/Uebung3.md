---
layout: page
title: Erstellung eines Adressformulars als Web Component
permalink: /Assignments/4XHBGM/MGIN/Uebung3
menubar: false
nav_exclude: true
exclude: true
nav: false
---

## Zielsetzung
In dieser Übung werdet ihr die Grundlagen von Web Components kennenlernen und anwenden. Das Adressformular aus der vorherigen Übung ist als Custom Element zu implementiern. Das soll euch einen Einblick in moderne Webtechnologien und komponentenbasierte Entwicklung geben. Diese Übung bildet eine solide Grundlage für das Verständnis von Frameworks wie Angular, React oder Vue.js, die ähnliche Konzepte verwenden.

## Hintergrundinformation
Web Components sind eine Sammlung von Webtechnologien, die es ermöglichen, wiederverwendbare und gekapselte Benutzeroberflächen-Komponenten zu erstellen. Sie bestehen aus drei Haupttechnologien:
1. [Custom Elements](https://developer.mozilla.org/en-US/docs/Web/API/Web_components): Erlauben die Definition eigener HTML-Elemente
2. [Shadow DOM](https://developer.mozilla.org/en-US/docs/Web/API/Web_components/Using_shadow_DOM): Bietet eine gekapselte DOM- und Styling-Struktur
3. HTML Templates: Ermöglichen die Erstellung von wiederverwendbaren HTML-Strukturen

Das Verständnis und die Anwendung von Web Components sind aus folgenden Gründen wichtig:
- Sie fördern modulares und wiederverwendbares Design
- Sie bilden die Grundlage für viele moderne Frontend-Frameworks
- Sie ermöglichen eine bessere Trennung von Markup, Stil und Logik
- Sie verbessern die Wartbarkeit und Skalierbarkeit von Webanwendungen

## Aufgabenstellung

### 1. Projekt-Setup
- Erstellen Sie eine neue HTML-Datei namens `index.html`
- Erstellen Sie eine JavaScript-Datei namens `address-form.js`
- Verlinken Sie die JavaScript-Datei in Ihrer HTML-Datei

### 2. Custom Element definieren
- Definieren Sie in `address-form.js` eine neue Klasse `AddressForm`, die von `HTMLElement` erbt
- Registrieren Sie das neue Custom Element mit dem Namen `address-form`
- Beispielcode für eine ähnliche Komponente [hier (editable list MDN)](https://github.com/mdn/web-components-examples/blob/main/editable-list/main.js)

### 3. Template erstellen
- Fügen Sie in Ihre HTML-Datei ein `<template>`-Element hinzu
- Gestalten Sie innerhalb des Templates das Markup für ein Adressformular mit folgenden Feldern:
  - Vorname
  - Nachname
  - Straße
  - Hausnummer
  - Postleitzahl
  - Stadt
  - Land
- Fügen Sie dem Template auch einen "Absenden"-Button hinzu

### 4. Shadow DOM und Template verwenden
- Erstellen Sie in der `AddressForm`-Klasse einen Shadow DOM
- Klonen Sie das Template und fügen Sie es dem Shadow DOM hinzu

### 5. Eventhandling implementieren
- Fügen Sie einen Event Listener für das "submit"-Event des Formulars hinzu
- Implementieren Sie eine Methode, die die eingegebenen Daten sammelt und ausgibt (z.B. in der Konsole)

### 6. Styling
- Fügen Sie dem Shadow DOM ein `<style>`-Element hinzu
- Definieren Sie CSS-Regeln, um das Formular ansprechend zu gestalten
- Nutzen Sie die Kapselung des Shadow DOM, um zu demonstrieren, dass die Stile nicht mit dem Rest der Seite interagieren

### 7. Verwendung und Test
- Fügen Sie in Ihrer `index.html` das neue Custom Element `<address-form>` ein
- Testen Sie die Funktionalität des Formulars im Browser

### 8. Erweiterung (Optional)
- Implementieren Sie eine Methode, um die Formulardaten als strukturiertes Objekt zurückzugeben
- Fügen Sie eine Validierung für die Eingabefelder hinzu (z.B. Pflichtfelder, Formatüberprüfung)

### 9. Dokumentation
- Kommentieren Sie Ihren Code ausführlich
- Erstellen Sie eine kurze README-Datei, die erklärt, wie man die Komponente verwendet und welche Funktionen sie bietet

## Abgabe
- Reichen Sie folgende Dateien ein:
  - `index.html`
  - `address-form.js`
  - README.md
- Fügen Sie Screenshots hinzu, die das funktionierende Formular und die Konsolenausgabe bei der Formularübermittlung zeigen

## Lernziele
Nach Abschluss dieser Übung sollten Sie:
- Die Grundkonzepte von Web Components verstehen
- Ein Custom Element mit Shadow DOM erstellen können
- HTML-Templates für wiederverwendbare Strukturen nutzen können
- Die Vorteile der Kapselung durch Shadow DOM erkennen
- Eine Basis für das Verständnis komponentenbasierter Frameworks wie Angular, React oder Vue.js haben

## Weitere Ressourcen
- [MDN Web Components Guide](https://developer.mozilla.org/en-US/docs/Web/Web_Components)
- [Google Developers - Web Components](https://developers.google.com/web/fundamentals/web-components)
- [CSS-Tricks - An Introduction to Web Components](https://css-tricks.com/an-introduction-to-web-components/)