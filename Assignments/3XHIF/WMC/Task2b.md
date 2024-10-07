---
layout: page
title: State Management mit useState und Seiteneffekte mit useEffect 
permalink: /Assignments/3XHIF/WMC/Task2n
menubar: false
nav_exclude: true
exclude: true
nav: false
---

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

