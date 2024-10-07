---
layout: page
title: Übungsaufgaben zu Promises
permalink: /TeachingMaterials/Promises
menubar: false
nav_exclude: true
exclude: true
nav: false
---

Als Abgabe kopiere deinen Code mit Syntax-Highlighting in ein PDF. Wenn der Code bereits kommentiert ist reicht es aus nur den Code reinzugeben. Ansonsten jede Funktion kurz beschreiben. 

```js
// Aufgabe 1: Einfaches Promise erstellen
// Erstelle ein Promise, dass nach 2 Sekunden mit dem Wert "Hallo Welt" erfüllt wird.
function simplePromise() {
  // Deine Lösung hier
}

// Aufgabe 2: Promise-Kette
// Erstelle eine Funktion, die eine Zahl verdoppelt und das Ergebnis als Promise zurückgibt.
// Verwende dann .then(), um das Ergebnis zu verdreifachen.
function doubleNumber(num) {
  // Deine Lösung hier
}

// Aufgabe 3: Promise.all()
// Erstelle drei Promises, die nach unterschiedlichen Zeiten erfüllt werden.
// Verwende Promise.all(), um auf die Erfüllung aller Promises zu warten.
// Gib auch mit Promise.any() aus wann das erste erfüllt ist
function promiseAll() {
  // Deine Lösung hier
}

// Aufgabe 4: Error Handling
// Erstelle ein Promise, das zufällig entweder erfüllt oder abgelehnt wird.
// Eien Erfüllung geht durch den Aufruf von resolve(), eine Ablehnung via reject()
// Behandle beide Fälle mit .then() und .catch().
function randomPromise() {
  // Deine Lösung hier
}

// Aufgabe 5: async/await
// Schreibe eine asynchrone Funktion, die die obige randomPromise() Funktion verwendet
// und das Ergebnis mit await abwartet. Behandle Fehler mit try/catch.
async function asyncFunction() {
  // Deine Lösung hier
}

// Aufgabe 6: Fetch API
// Verwende die Fetch API, um Daten von 'https://jsonplaceholder.typicode.com/todos/1' abzurufen.
// Konvertiere die Antwort in JSON und gib den Titel des Todos aus.
function fetchData() {
  // Deine Lösung hier
}
```

## Weitere Unterlagen

- [MDN Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise)
- [MDN - Using promises](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Using_promises)
- [Common promise mistakes](https://pouchdb.com/2015/05/18/we-have-a-problem-with-promises.html)