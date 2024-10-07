---
layout: page
title: Datenbankintegration mit Prisma
permalink: /Assignments/3XHIF/WMC/Task4
menubar: false
nav_exclude: true
exclude: true
nav: false
---

### Lernziele
- Prisma in ein Remix-Projekt einrichten und konfigurieren
- Ein einfaches Datenbankschema erstellen und migrieren
- CRUD-Operationen mit Prisma implementieren
- Remix action-Funktionen für Datenbankoperationen verwenden

### Aufgaben

1. Prisma einrichten und konfigurieren (40 Minuten)
   - Prisma in das Projekt installieren
   - Die Prisma-Konfigurationsdatei erstellen und anpassen
   - Verbindung zur Datenbank herstellen (z.B. SQLite für einfache Entwicklung)

2. Einfaches Datenbankschema erstellen (40 Minuten)
   - Ein Prisma-Schema für eine einfache Entität (z.B. "Post" mit Titel und Inhalt) definieren
   - Die erste Migration erstellen und anwenden
   - Den Prisma-Client generieren

3. CRUD-Operationen implementieren (40 Minuten)
   - Neue Route `app/routes/posts/index.tsx` für die Auflistung aller Posts erstellen
   - Eine loader-Funktion implementieren, die alle Posts aus der Datenbank abruft
   - Neue Route `app/routes/posts/new.tsx` für das Erstellen neuer Posts erstellen
   - Eine action-Funktion in `app/routes/posts/new.tsx` implementieren, die einen neuen Post in der Datenbank erstellt
   - Formular für das Erstellen neuer Posts mit der action-Funktion verbinden
