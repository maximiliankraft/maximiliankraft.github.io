---
layout: page
title: Django-Projekt auf MySQL mit Docker umstellen
permalink: /Assignments/4XHBGM/MGIN/Uebung3A
menubar: false
nav_exclude: true
exclude: true
nav: false
---

## Einführung
In den bisherigen Projekten habt ihr SQLite als Datenbank für eure Django-Anwendungen verwendet. In der professionellen Entwicklung werden jedoch häufig leistungsfähigere Datenbanksysteme wie MySQL, Postgres, Vitess oder CockroachDB eingesetzt. In diesem Arbeitsauftrag werdet ihr:
1. Einen MySQL-Datenbankserver in einem Docker-Container aufsetzen
2. Euer bestehendes Django-Projekt von SQLite auf MySQL umstellen

## Hintergrundinformationen - Was ist Docker?
Docker ist eine Plattform, die es ermöglicht, Anwendungen in isolierten Umgebungen (genannt "Container") laufen zu lassen. Ein Container ist wie ein eigenständiger Mini-Computer, der nur das enthält, was die Anwendung braucht. Der Vorteil: Egal auf welchem Computer ihr den Container startet, die Anwendung läuft immer gleich. Man Programmiert als nicht das Verhalten eines Programmes sondern dessen Umgebung. Auch genannt `IaC` *Infrastrucutre as Code*. 

## Voraussetzungen
- Euer funktionierendes Django-Projekt mit SQLite
- Docker Desktop (Installation unter [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop))

## Aufgaben

### Teil 1: Docker und MySQL einrichten

1. **Docker Installation überprüfen**
    Starte Docker Desktop und gib in der Konsole folgenden Befehl ein:
   ```bash
   docker --version
   ```
   Dies sollte eine Versionsnummer ausgeben.

2. **Docker Compose File erstellen**
   - Erstellt im Hauptverzeichnis eures Projekts eine neue Datei namens `docker-compose.yml`
   - Fügt folgenden Inhalt ein:
   ```yaml
   
   services:
     db:
       image: mysql:latest
       environment:
         MYSQL_ROOT_PASSWORD: meinpasswort
         MYSQL_DATABASE: meinprojekt
         MYSQL_USER: djangouser
         MYSQL_PASSWORD: djangopasswort
       ports:
         - "3306:3306"
       volumes:
         - mysql_data:/var/lib/mysql
   
   volumes:
     mysql_data:
   ```

   **Erklärung der wichtigsten Elemente:**
   - `image: mysql:latest`: Verwendet MySQL, die neueste Version 
   - `environment`: Setzt wichtige Umgebungsvariablen wie Passwörter und Datenbankname
   - `ports`: Macht MySQL auf Port 3306 erreichbar
   - `volumes`: Speichert die Datenbank-Dateien dauerhaft

All diese Erklöreungen findet ihr für Verschiedenste Container auch auf [Docker Hub](https://hub.docker.com/_/mysql)

### Teil 2: Django-Projekt anpassen

1. **MySQL-Treiber installieren**
   ```bash
   pip install mysqlclient
   ```

2. **settings.py anpassen**
   Sucht in eurer `settings.py` den `DATABASES`-Bereich und ersetzt ihn durch:
   ```python
   DATABASES = {
       'default': {
           'ENGINE': 'django.db.backends.mysql',
           'NAME': 'meinprojekt',
           'USER': 'djangouser',
           'PASSWORD': 'djangopasswort',
           'HOST': 'localhost',
           'PORT': '3306',
       }
   }
   ```

   wichtig ist dass hier die selben Usernamen, Passwörter und andere Einstellungen verwendet werden wie in der Compose-Datei wenn der Container erstellt wird. 

> Quelle dazu aus den [Django Docs](https://docs.djangoproject.com/en/5.1/ref/databases/#mysql-notes)

### Teil 3: Datenbank starten und Projekt testen

1. **Docker Container starten**
   ```bash
   docker-compose up -d
   ```
   - Das `-d` bedeutet "detached mode" - der Container läuft im Hintergrund
   - Wartet etwa 30 Sekunden, bis MySQL vollständig gestartet ist. 
    - Du kannst auch dem Container zusehen was er alles beim Start macht. Mit `docker compose logs -f` werden alle logs so lange ausgegeben bis du den Befehl mit `Strg + C` abbrichst.

2. **Migrations ausführen**
   ```bash
   python manage.py migrate
   ```

3. **Superuser erstellen**
   ```bash
   python manage.py createsuperuser
   ```

4. **Server starten und testen**
   ```bash
   python manage.py runserver
   ```

## Zusatzaufgaben 

1. **Datenbank-Logs anzeigen**
   ```bash
   docker-compose logs db
   ```
   Analysiert die Logs - was seht ihr?

2. **Container Status überprüfen**
   ```bash
   docker-compose ps
   ```
   Was bedeuten die verschiedenen Spalten?

## Hilfreiche Docker-Befehle

- Container stoppen: `docker-compose down`
- Container neustarten: `docker-compose restart`
- Alle Container und deren Status anzeigen: `docker ps -a`
- In den MySQL-Container einsteigen:
  ```bash
  docker compose exec db bash
  ```


## Abgabe
1. Dokumentiert in einem Protokoll eure Schritte und eventuelle Probleme
2. Erstellt Screenshots von:
   - Erfolgreich laufendem Docker Container
   - Django Admin-Interface mit neuer MySQL-Datenbank
   - Einem erfolgreichen Datenbankzugriff über eure Anwendung

## Bewertungskriterien
- Funktionalität (40%)
  - MySQL-Container läuft fehlerfrei
  - Django-Anwendung verbindet sich erfolgreich
  - Daten werden korrekt gespeichert
- Dokumentation (30%)
  - Nachvollziehbare Beschreibung der Umsetzung
  - Erklärung aufgetretener Probleme und deren Lösung
- Zusatzaufgaben (30%)
  - Verständnis der Docker-Logs
  - Eigenständige Erkundung und Erklärung weiterer Docker-Befehle

## Hilfestellung
- Bei Problemen erst die Docker-Logs überprüfen
- Sicherstellen, dass der MySQL-Container vollständig gestartet ist
- Überprüfen, ob die Datenbank-Zugangsdaten in Django und Docker-Compose übereinstimmen
