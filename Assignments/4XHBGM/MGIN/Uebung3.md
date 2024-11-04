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
In dieser Übung werdet ihr die Grundlagen von Web Components kennenlernen und anwenden. Das Adressformular aus der vorherigen Übung ist als Custom Element zu implementiern. Dieses soll dann in den Code der Übung 2 integriert werden. Das soll euch einen Einblick in moderne Webtechnologien und komponentenbasierte Entwicklung geben. Komponenten werden bei Frameworks wie React, Vue oder Angular häufig in ähnlicher Form eingesetzt. 

## Hintergrundinformation
Web Components sind ein Standard, der es ermöglicht, wiederverwendbare und gekapselte Benutzeroberflächen-Komponenten zu erstellen. Wichtig hierfür sind:
1. [Web Component Specification](https://developer.mozilla.org/en-US/docs/Web/API/Web_components): Erlaubt die Definition eigener HTML-Elemente
2. [Shadow DOM](https://developer.mozilla.org/en-US/docs/Web/API/Web_components/Using_shadow_DOM): Bietet eine gekapselte DOM- und Styling-Struktur


Das Verständnis und die Anwendung von Web Components sind aus folgenden Gründen wichtig:
- Sie fördern modulares und wiederverwendbares Design
- Sie ermöglichen eine bessere Trennung von Markup, Stil und Logik
- Sie verbessern die Wartbarkeit und Skalierbarkeit von Webanwendungen
- Werden (wie bereits erwähnt) in modernen Webframeworks häufig eingesetzt

## Aufgabenstellung

### 1. Projekt-Setup

Nimm die Übung 2 als Grundlage. Bereits erstellte Dateien können gerne weiterverwendet werden.

- Erstelle eine HTML-Datei namens `index.html`
- Erstelle eine JavaScript-Datei namens `address-form.js`
- Verlinke die JavaScript-Datei in der HTML-Datei

### 2. Custom Element definieren
- Definiere in `address-form.js` eine neue Klasse `AddressForm`, die von `HTMLElement` erbt
- Registriere das neue Custom Element mit dem Namen `address-form`
- Beispielcode für eine ähnliche Komponente [hier (editable list MDN)](https://github.com/mdn/web-components-examples/blob/main/editable-list/main.js) oder [(edit-word)](https://mdn.github.io/web-components-examples/edit-word/)

### 3. Template erstellen
- Füge in die HTML-Datei ein `<template>`-Element hinzu
- Gestalte innerhalb des Templates ein Adressformular mit folgenden Feldern:
  - Vorname
  - Nachname
  - Straße
  - Hausnummer
  - Postleitzahl
  - Stadt
  - Land
- Fügen dem Template auch einen "Absenden"-Button hinzu
- In dem Template soll es einen Bearbeiten-Modus geben sowie einen Anzeige-Modus
  - Beim erstellen eines neuen Eintrags soll der Bearbeiten-Modus verwendet werden
  - In der Übersicht der gespeicherten Daten der Anzeige-Modus


### 4. Eventhandling implementieren
- Füge einen Event Listener für das "submit"-Event des Formulars hinzu
  - Um sofortiges Absenden zu unterdrücken, verwende [preventDefault](https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault)
- Implementiere eine Methode, die die eingegebenen Daten sammelt und ausgibt in der Konsole

### 5. Styling
- Füge dem Shadow DOM ein `<style>`-Element hinzu
- Definiere CSS-Regeln, um das Formular ansprechend zu gestalten (tobt euch aus!)

### 6. Verwendung und Test
- Fügen in der `index.html` das neue Custom Element `<address-form>` ein
- Testen die Funktionalität des Formulars im Browser
- Protokolliere die Konsolenausgabe wenn man auf Senden klickt

### 7. Integration
- Implementieren eine Methode, um die Formulardaten als JSON Objekt zurückzugeben. Das JSON soll dann an die entsprechenden Django-Endpunkte aus Übung 2 übergeben werden zum speichern.
- Implementierte serverseitig auch eine Update-Funktion um bestehende Adressen ändern zu können.
- (Optional) Füge eine Validierung für die Eingabefelder hinzu (z.B. Pflichtfelder, Formatüberprüfung)

## Abgabe
- Füge im Protokoll folgende Dateien ein:
  - `index.html`
  - `address-form.js`
- Füge Screenshots hinzu, die das funktionierende Formular und die Konsolenausgabe bei der Formularübermittlung zeigen
- Der Code muss mit Sytax-Highlighting formatiert sein
- Das Word-Template muss nicht als Vorlage genommen werden.
  - Ein mit Markdown geschriebenes PDF nehme ich gerne entgegen. Gibt für VS Code eine Extension [Markdown-PDF](https://marketplace.visualstudio.com/items?itemName=yzane.markdown-pdf) oder man konvertiert es mit [Pandoc](https://pandoc.org/)


### Erweiterungen von Übung 2

- `/add` in den Views (+urls) hinzufügen
  - Sende vom Server zum Client einen Primary Key mit, um zu erkennen ob die übermittelten Daten bestehende überschreiben sollen. Ist der primary key `-1` oder `null` soll ein neuer Eintrag in der Datenbank gespeichert werden. Über `<input type="hidden" value="<key>" ... />` kann man den Primary Key vor dem User verstecken und trotzdem mit übertragen.
- Ergänze im `model.py` den Vornamen und den Nachnamen. Bundesland kannst du auf Land ändern
- Verwende den neuen Tag `<address-form editable="false" ... />` in der Übersicht sowie beim anlegen neuer Adressen

## Weitere Ressourcen
- [MDN Web Components Guide](https://developer.mozilla.org/en-US/docs/Web/Web_Components)
- [Google Developers - Web Components](https://developers.google.com/web/fundamentals/web-components)
- [CSS-Tricks - An Introduction to Web Components](https://css-tricks.com/an-introduction-to-web-components/)