---
layout: page
title: Remix SQLite Übungsaufgabe
permalink: /Assignments/3XHIF/WMC/Assignment4
menubar: false
nav_exclude: true
exclude: true
nav: false
---

## Aufgabenstellung
Erstelle eine Remix-Anwendung für einen einfachen Webshop. Die Anwendung soll Produkte aus einer SQLite-Datenbank laden und anzeigen können.

## Projekt-Setup

1. Erstelle ein neues Remix-Projekt:
```bash
npx create-remix@latest
```

2. Installiere die benötigten Abhängigkeiten:
```bash
npm install sqlite3 --save
```

3. Lade dir die bestehende Datenbank `webshop.db` von Moodle herrunger, oder erstelle eine neue SQLite-Datenbank mit einer Produkttabelle:
```sql
CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price REAL NOT NULL,
    description TEXT
);
```

## Datenbank-Konfiguration

Verbinde dich zur Datenbank:

```typescript
const sqlite3 = require('sqlite3')

// Connect to the database specified by a single file path
const db = new sqlite3.Database('./webshop.db', (err) => {
    if (err) {
        console.error('Error opening database', err.message);
    } else {
        console.log('Connected to the SQLite database.');
    }
});
```

## Alle Produkte laden

```typescript

  const products = db
    .prepare("SELECT * FROM products")
    .all() as Product[];

```

## Einzelnes Produkt laden

Erstelle eine Route-Datei `app/routes/products.$id.tsx`. Verwende [useParams](https://remix.run/docs/en/main/hooks/use-params) um die Daten aus der URL abzufragen.


```typescript
´

    id = useParams...

  const product = db
    .prepare("SELECT * FROM products WHERE id = ?")
    .get(id);

  if (!product) {
    throw new Response("Produkt nicht gefunden", { status: 404 });
  }


```

## Aufgaben fürs Protokoll

1. Implementiere die Basisfunktionalität wie oben beschrieben in Remix
2. Erweitere die Anwendung um:
   - Ein Formular zum Hinzufügen neuer Produkte
   - Eine Suchfunktion für Produkte
   - Eine Kategorisierung von Produkten


## Bonuspunkte (freiwillig)

1. Implementiere Fehlerbehandlung für die Datenbankabfragen
2. Füge Validierung für das Produktformular hinzu
3. Implementiere eine Sortierfunktion für die Produktliste
4. Erstelle eine Shopping Cart Funktionalität

## Tipps

- Nutze die Remix-Dokumentation für [Details zur Action-Funktion](https://remix.run/docs/en/main/route/action) bei Formularen
- Denke an die Fehlerbehandlung bei Datenbankoperationen
