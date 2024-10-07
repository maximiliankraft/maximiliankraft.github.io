---
layout: page
title: Authentifizierung in Remix
permalink: /Assignments/3XHIF/WMC/Task5
menubar: false
nav_exclude: true
exclude: true
nav: false
---

### Lernziele
- Benutzerregistrierung und Login mit Remix und Prisma implementieren
- Geschützte Routen erstellen
- Session-Management in Remix verstehen und anwenden

### Aufgaben

1. Benutzerregistrierung implementieren (40 Minuten)
   - Prisma-Schema um ein User-Modell erweitern
   - Neue Route `app/routes/auth/register.tsx` erstellen
   - Registrierungsformular erstellen
   - action-Funktion für die Benutzerregistrierung implementieren, die Benutzerdaten in der Datenbank speichert

2. Login implementieren (40 Minuten)
   - Neue Route `app/routes/auth/login.tsx` erstellen
   - Login-Formular erstellen
   - action-Funktion für den Login implementieren, die Benutzerdaten überprüft und eine Session erstellt
   - Session-Cookie mit Remix-Funktionen setzen

3. Geschützte Routen und Session-Management (40 Minuten)
   - Hilfsfunktion zum Überprüfen der Benutzerauthentifizierung erstellen
   - Geschützte Route (z.B. `app/routes/dashboard.tsx`) erstellen
   - loader-Funktion für die geschützte Route implementieren, die die Authentifizierung überprüft
   - Logout-Funktionalität implementieren, die die Session beendet
