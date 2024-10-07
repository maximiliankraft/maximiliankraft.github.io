---
layout: page
title: State Management mit useState und Seiteneffekte mit useEffect 
permalink: /Assignments/3XHIF/WMC/Task2
menubar: false
nav_exclude: true
exclude: true
nav: false
---

## State Management mit useState

### Lernziele
- Verstehen, was State in React ist und wofür er verwendet wird
- Die useState-Hook korrekt anwenden
- Einfache und komplexere Zustandsverwaltung in Komponenten implementieren

### Aufgaben

1. Zähler-Komponente erstellen (40 Minuten)
   - Neue Datei `app/components/Counter.tsx` erstellen
   - Eine Komponente mit einem Zähler und Buttons zum Erhöhen/Verringern implementieren
   - useState für die Verwaltung des Zählerwerts verwenden
   - Die Counter-Komponente in die Home-Seite einbinden

> [Beispiel + offizielle Dokumentation](https://react.dev/reference/react/useState#counter-number)

2. Formular mit kontrollierten Komponenten (40 Minuten)
   - Neue Route `app/routes/form.tsx` erstellen
   - Ein Formular mit Eingabefeldern (z.B. Name, Email) erstellen
   - useState für jedes Eingabefeld verwenden
   - Die Eingabewerte im State speichern und anzeigen

> [Ähnliches Beispiel](https://react.dev/reference/react/useState#text-field-string)

3. Todo-Liste implementieren (40 Minuten)
   - Neue Komponente `app/components/TodoList.tsx` erstellen
   - useState für die Verwaltung der Todo-Liste und des Eingabefelds verwenden
   - Funktionen zum Hinzufügen und Entfernen von Todos implementieren
   - Die TodoList-Komponente in eine neue Route einbinden

## Seiteneffekte mit useEffect


### Lernziele
- Verstehen, was Seiteneffekte in React sind und wann man useEffect benötigt
- useEffect mit verschiedenen Dependency-Arrays anwenden
- API-Aufrufe mit useEffect durchführen und die Ergebnisse im State speichern

### Beispiele aus der Dokumentation

> [react.dev useEffect](https://react.dev/reference/react/useEffect#listening-to-a-global-browser-event)

### Aufgaben

1. Daten von einer API fetchen (40 Minuten)
   - Neue Route `app/routes/users.tsx` erstellen
   - useEffect verwenden, um Benutzerdaten von der [JSONPlaceholder API](https://jsonplaceholder.typicode.com/) zu fetchen
   - Die gefetchten Daten im State speichern und in der Komponente anzeigen
   - Einen Lade-Indikator implementieren, während die Daten geladen werden

2. useEffect mit verschiedenen Dependencies (40 Minuten)
   - Eine Komponente erstellen, die auf Änderungen in Props oder State reagiert
   - Verschiedene useEffect-Hooks mit unterschiedlichen Dependency-Arrays implementieren
   - Die Auswirkungen der verschiedenen Dependency-Arrays beobachten und diskutieren
   - Die Komponente kann alles mögliche Anzeigen. Z.b ein Profil, einen Termin etc. 

3. Cleanup-Funktionen verstehen und anwenden (40 Minuten)
   - Eine Komponente erstellen, die nach einem Buttonklick einen Timer startet (z.B. mit setInterval)
   - useEffect mit einer Cleanup-Funktion implementieren, um den Timer zu stoppen
   - Die Notwendigkeit von Cleanup-Funktionen erklären und weitere Beispiele diskutieren
   - Die Dauer des Timers soll angezeigt werden

