---
layout: page
title: Dockerisierung einer Spring-Anwendung mit MySQL-Datenbank
permalink: /Assignments/5XBGM/SpringNodeContainer
menubar: false
nav_exclude: true
exclude: true
nav: false
---

## Ausgangssituation
Du hast eine bestehende Spring-Anwendung, die bisher lokal auf deinem Entwicklungsrechner läuft. Die Anwendung verwendet eine MySQL-Datenbank zur Datenspeicherung.

## Ziel
Deine Aufgabe ist es, die Spring-Anwendung in einen Docker-Container zu verpacken und sie mit einer MySQL-Datenbank in einem separaten Container zu verbinden. Dies soll mithilfe von Docker Compose geschehen.

## Anforderungen

### 1. Dockerisierung der Spring-Anwendung
- Erstelle ein Dockerfile für deine Spring-Anwendung.
- Passe die Anwendungskonfiguration an, damit sie im Container-Umfeld funktioniert.
- Stelle sicher, dass alle notwendigen Abhängigkeiten im Container vorhanden sind.

### 2. Docker Compose Konfiguration
- Erstelle eine `docker-compose.yml` Datei.
- Definiere zwei Services:
  1. Deine Spring-Anwendung
  2. MySQL-Datenbank
- Setze entsprechende Umgebungsvariablen für die Datenbankverbindung.

### 3. Anpassung der Anwendungskonfiguration
- Passe das Anwendungsprofil für die Produktionsumgebung an (`application-docker.properties`).
- Konfiguriere die Datenbankverbindung so, dass sie den Docker-Netzwerknamen verwendet.


### 4. Testen und Dokumentation
- Teste deine Dockerisierte Anwendung lokal.
- Dokumentiere die notwendigen Schritte zum Starten der Anwendung mit Docker Compose.
- Beschreibe eventuell aufgetretene Probleme und deren Lösungen.

## Abgabe

Dein Protokoll soll enthalten:

- Dockerfile
- docker-compose.yml
- Angepasste Anwendungskonfigurationsdateien
- Kurze Dokumentation (max. 1 Seite des Protokolls) mit Erklärungen und Anweisungen zum Starten der Anwendung



### Häufige Probleme und Lösungen:

1. **Container startet nicht:**
   - Logs prüfen: `sudo docker compose logs`
   - Build-Logs prüfen: `sudo docker compose build --no-cache`
   - Ports prüfen: `sudo netstat -tulpn`

2. **Statische Assets werden nicht geladen:**
   - Verifizieren Sie die Build-Ausgabe: `sudo docker exec -it <container-id> ls /<path>`

3. **Performance-Probleme:**
   - Container Ressourcen überprüfen: `sudo docker stats`
   - System-Ressourcen monitoren (nur Linux): `htop`
4. **Änderungen werden nicht übernommen**
  - Container muss bei jeder Änderung neu gebaut werden
  - Start mit `docker compose up -d --build`
