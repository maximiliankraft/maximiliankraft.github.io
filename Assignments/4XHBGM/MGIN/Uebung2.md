---
layout: page
title: Interaktives Adressformular mit Django
permalink: /Assignments/4XHBGM/MGIN/Uebung2
menubar: false
nav_exclude: true
exclude: true
nav: false
---


## Aufgabenstellung

### 1. Projekt-Setup

- Erstelle ein neues Django-Projekt mit dem Namen "WienerAdressen".
- Richte eine neue App namens "adressformular" innerhalb des Projekts ein.
- Initialisiere ein Git-Repository für dein Projekt.

### 2. Backend-Entwicklung

#### 2.1 Modell erstellen
- Erstelle in `models.py` ein Modell `Adresse` mit folgenden Feldern:
  - `strasse` 
  - `hausnummer` 
  - `plz` 
  - `ort` 
  - `bundesland`
  - `timestamp`

#### 2.2 View implementieren
- Erstelle in `views.py` zwei Views:
  1. `adressformular`: Rendert das Formular zur Adresseingabe.
  2. `adresse_speichern`: API-Endpunkt zum Speichern der eingegebenen Adresse.

#### 2.3 URL-Konfiguration
- Konfiguriere die URLs in `urls.py`, um die Views mit den entsprechenden Routen zu verbinden.

### 3. Frontend-Entwicklung

#### 3.1 HTML-Template
- Erstelle ein HTML-Template `adressformular.html` mit einem Formular zur Adresseingabe.
- Implementiere Eingabefelder für Straße, Hausnummer, PLZ und Ort.

#### 3.2 JavaScript-Implementierung
- Erstelle eine separate JavaScript-Datei `adressService.js`.
- Implementiere folgende (oder ähnliche) Funktionen:
  1. `fetchAdressData(query)`: Nutzt die Fetch API, um Daten vom Wiener Adressservice abzurufen.
  2. `displaySuggestions(data)`: Zeigt die Vorschläge unterhalb der Eingabefelder an.
  3. `handleInput()`: Reagiert auf Benutzereingaben und ruft `fetchAdressData` auf.
  4. `selectSuggestion(suggestion)`: Füllt das Formular mit der ausgewählten Adresse aus.

#### 3.3 CSS-Styling
- Erstelle eine CSS-Datei `styles.css` zur Gestaltung des Formulars und der Vorschläge.
- Verwende Flexbox oder CSS Grid für das Layout.

### 4. Integration und Testing

#### 4.1 AJAX-Implementierung
- Verwende jQuery oder Vanilla JS, um eine AJAX-Anfrage an den `adresse_speichern`-Endpunkt zu senden, wenn das Formular abgeschickt wird.
- Zeige eine Erfolgsmeldung an, wenn die Adresse erfolgreich gespeichert wurde.

#### 4.2 Error Handling
- Implementiere Fehlerbehandlung sowohl im Frontend als auch im Backend.
- Zeige benutzerfreundliche Fehlermeldungen an, wenn etwas schiefgeht.

#### 4.3 Testfälle
- Schreibe mindestens drei Testfälle in `tests.py`:
  1. Test der Modellvalidierung
  2. Test der View-Funktionalität
  3. Test der API-Endpunkte

### 5. Dokumentation und Versionskontrolle

- Dokumentiere deinen Code ausführlich mit Kommentaren.
- Führe regelmäßige Git-Commits durch, die den Entwicklungsprozess nachvollziehbar machen.
- Erstelle ein `README.md` mit einer Kurzbeschreibung des Projekts und Anweisungen zur Installation und Ausführung.

### 6. Erweiterungen (Optional)

- Implementiere eine Autocomplete-Funktion für die Straßeneingabe.
- Füge eine Kartenansicht hinzu, die die eingegebene Adresse anzeigt (z.B. mit Leaflet.js und OpenStreetMap).
- Erstelle eine Übersichtsseite, die alle gespeicherten Adressen anzeigt.

## Abgabe

- Erstelle ein ausführliches Protokoll deiner Vorgehensweise.
- Füge Screenshots von wichtigen Entwicklungsschritten und der finalen Anwendung hinzu.
- Exportiere deine Git-Commit-Historie mit `git log --pretty=format:"%h - %an, %ar : %s" > commit_history.txt` und füge sie dem Protokoll bei.
- Packe alle Projektdateien, das Protokoll und die Commit-Historie in ein ZIP-Archiv zur Abgabe.

## Hilfreiche Ressourcen

- [Django-Dokumentation](https://docs.djangoproject.com/)
- [Fetch API - MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API)
- [Wiener Adressservice Dokumentation](https://digitales.wien.gv.at/wp-content/uploads/sites/47/2019/01/adressservice-doku.pdf)
- [JavaScript-Promises - MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise)
- [CSS Flexbox Guide](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)

Viel Erfolg bei der Umsetzung!