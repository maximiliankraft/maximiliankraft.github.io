---
layout: page
title: Routing und Datenmanagement
permalink: /Assignments/3XHIF/WMC/Task3
menubar: false
nav_exclude: true
exclude: true
nav: false
---

### Lernziele
- Dynamische Routen in Remix erstellen und verwenden
- Daten mit Remix-spezifischen Funktionen wie `loader` laden
- Formulare und Aktionen in Remix implementieren

### Aufgaben

1. Dynamische Routen in Remix (40 Minuten)
   - Neue dynamische Route `app/routes/users/$userId.tsx` erstellen
   - Die `useParams`-Hook verwenden, um die `userId` aus der URL zu extrahieren
   - Benutzerdetails basierend auf der `userId` von der JSONPlaceholder API laden
   - Links zu den Benutzerdetailseiten auf der Benutzerübersichtsseite hinzufügen

2. Daten laden mit loader-Funktionen (40 Minuten)
   - In der `app/routes/users.tsx` und `app/routes/users/$userId.tsx` loader-Funktionen implementieren
   - Die geladenen Daten mit der `useLoaderData`-Hook in den Komponenten verwenden
   - Den Unterschied zwischen client- und serverseitigem Daten-Fetching in Remix erklären

3. Formulare und Aktionen in Remix (40 Minuten)
   - Neue Route `app/routes/create-user.tsx` erstellen
   - Ein Formular zur Erstellung eines neuen Benutzers implementieren
   - Eine action-Funktion erstellen, die die Formulardaten verarbeitet
   - Nach erfolgreicher Erstellung zur Benutzerübersichtsseite umleiten
