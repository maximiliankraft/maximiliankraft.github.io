---
layout: page
title: Docker & Django - Deine erste containerisierte Webanwendung
permalink: /Assignments/4XHBGM/MGIN/Uebung3A
menubar: false
nav_exclude: true
exclude: true
nav: false
---

## Einführung
In unseren bisherigen Projekten habt ihr Django-Anwendungen direkt auf eurem Computer entwickelt. In der echten Welt müssen medizinische Anwendungen aber auf vielen verschiedenen Systemen laufen - vom Entwicklungs-Laptop bis zum Krankenhaus-Server. Hier kommt Docker ins Spiel! 

Mit Docker können wir sicherstellen, dass unsere Anwendung überall gleich läuft, egal wo sie gestartet wird. Das ist besonders wichtig bei medizinischen Anwendungen, wo Zuverlässigkeit an erster Stelle steht.

## Was ist Docker?
Stellt euch Docker wie eine transportable Mini-Umgebung vor. Ähnlich wie ihr vielleicht schon virtuelle Umgebungen (venv) in Python kennt, geht Docker noch einen Schritt weiter: Es verpackt nicht nur die Python-Pakete, sondern die gesamte Ausführungsumgebung in einen "Container". Das ist wie ein eigenständiger Mini-Computer, der alles enthält, was eure Anwendung braucht.

## Voraussetzungen
- Euer funktionierendes Django-Projekt
- Docker Desktop (Installation: [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop))
- VS Code oder PyCharm

## Aufgaben

### Teil 1: Docker vorbereiten und testen

> Kann übersprungen werden falls es in der vorherigen Übung bereits funktioniert hat

1. Installiert Docker Desktop
2. Startet Docker Desktop
3. Öffnet ein Terminal und prüft mit `docker --version`, ob alles funktioniert

### Teil 2: Django-Projekt containerisieren
1. **Dockerfile erstellen**
   - Erstellt im Hauptverzeichnis eures Projekts eine neue Datei namens `Dockerfile`
   - Fügt folgenden Inhalt ein:
   ```dockerfile
   FROM python:3.11-slim
   
   WORKDIR /app
   
   COPY requirements.txt .
   RUN pip install -r requirements.txt
   
   COPY . .
   
   CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
   ```

2. **Docker Compose erstellen**
   - Erstellt eine Datei `docker-compose.yml`
   - Fügt folgenden Inhalt ein:
   ```yaml
   version: '3.8'
   
   services:
     web:
       build: .
       ports:
         - "8000:8000"
       volumes:
         - .:/app
       environment:
         - DEBUG=1
         - DJANGO_SETTINGS_MODULE=myproject.settings
   ```

### Teil 3: Container starten und testen

1. **Container bauen und starten**
   ```bash
   docker compose up --build
   ```
   - Wartet, bis ihr die Meldung seht, dass der Django-Server läuft
   - Öffnet [http://localhost:8000](http://localhost:8000) im Browser

2. **Fehlersuche**
   Falls etwas nicht funktioniert:
   - Schaut euch die Konsolen-Ausgabe an
   - Prüft mit `docker compose logs web`, was im Container passiert
   - Vergleicht eure Dateien mit den Vorlagen
   - Es fehlt noch die Integration um MySQL-Server aus der vorherigen Aufgabe, recherchiere selbst wie du diese in Compose integrieren kannst und was man in Django umändern muss

## Zusatzaufgaben für Schnelle

1. **Container erkunden**
   ```bash
   docker compose exec web bash
   ```
   Schaut euch um - was findet ihr in `/app`?

2. **Logs verstehen**
   - Startet den Container mit `docker compose up`
   - Macht ein paar Anfragen an eure Webseite
   - Was seht ihr in den Logs?

## Abgabe
Erstellt ein kurzes Protokoll mit:
1. Screenshots von:
   - Eurem laufenden Container (Docker Desktop)
   - Eurer Django-Anwendung im Browser
2. Kurze Erklärung (3-4 Sätze), was ihr gemacht habt
3. Falls ihr Probleme hattet: Wie habt ihr sie gelöst?

## Bewertung
- Funktionalität (40%)
  - Container läuft
  - Django-Anwendung ist erreichbar
  - Code ist sauber und folgt den Vorlagen
- Dokumentation (30%)
  - Protokoll ist vollständig
  - Probleme und Lösungen sind dokumentiert
- Zusatzaufgaben (30%)
  - Erfolgreiche Durchführung
  - Verständnis der Docker-Umgebung

## Hilfe
- Schaut euch die Log-Ausgaben genau an - oft steht dort schon die Lösung
- Überprüft, ob Docker Desktop läuft
- Fragt eure Mitschüler oder mich, wenn ihr nicht weiterkommt

### Hilfreiche Docker-Befehle

- Container stoppen: `docker-compose down`
- Logs anzeigen: `docker compose logs -f`
- Container neustarten: `docker-compose restart`
- Alle Container und deren Status anzeigen: `docker ps -a`
- In den Container einsteigen:
  ```bash
  docker compose exec <containername> bash
  ```
