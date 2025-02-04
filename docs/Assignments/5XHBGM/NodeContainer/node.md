---
layout: page
title: Dockerisierung einer Angular-Frontend-Anwendung
permalink: /Assignments/5XBGM/NodeContainer
menubar: false
nav_exclude: true
exclude: true
nav: false
---

## Ausgangssituation
Du hast eine bestehende Angular-Anwendung, die das Frontend für eine Webanwendung bereitstellt. Bisher läuft diese Anwendung lokal auf deinem Entwicklungsrechner.

## Ziel
Deine Aufgabe ist es, die Angular-Anwendung in einen Docker-Container zu verpacken, sodass sie einfach deployed und in verschiedenen Umgebungen ausgeführt werden kann.

## Anforderungen

### 1. Vorbereitung der Angular-Anwendung
- Stelle sicher, dass deine Angular-Anwendung fertig entwickelt und lauffähig ist.
    - Es sollte keine Warnungen oder Fehler in der Konsole am Server geben
    - Auch keine in der Javascript Konsole im Browser
- Optimiere die Anwendung für den Produktivbetrieb (Production Build).c
    - Siehe [ng build](https://v17.angular.io/start/start-deployment)

### 2. Erstellung des Dockerfiles
- Erstelle ein Dockerfile für deine Angular-Anwendung.
- Verwende ein geeignetes Basis-Image (z.B. node:lts für den Build-Prozess und nginx:alpine für das Bereitstellen der statischen Dateien).
- Implementiere einen mehrstufigen Build-Prozess (Multi-stage build):
  1. Stage 1: Baue die Angular-Anwendung mit Node.js.
  2. Stage 2: Kopiere die gebauten Dateien in ein nginx-Image zum Bereitstellen.

### 3. Konfiguration des Webservers
- Konfiguriere nginx, um deine Angular-Anwendung korrekt zu servieren.
- Stelle sicher, dass das Routing für Single Page Applications (SPA) korrekt funktioniert.

### 4. Optimierung des Docker-Images
- Minimiere die Größe des finalen Docker-Images, z.B durch Nutzung von Alpine
- Implementiere Best Practices für Dockerfiles
    - weniger Layer
    - Nutzung von .dockerignore (selbes Prinzip wie .gitignore)

### 5. Testen und Dokumentation
- Teste deine dockerisierte Anwendung lokal.
- Dokumentiere die notwendigen Schritte zum Bauen und Starten des Containers.
- Beschreibe eventuell aufgetretene Probleme und deren Lösungen.

## Abgabe
Im Protokoll soll enthalten sein:
- Dockerfile
- Angepasste nginx-Konfiguration (falls notwendig)
- Kurze Dokumentation (max. 1 Seite des Protokolls) mit Erklärungen und Anweisungen zum Bauen und Starten des Containers

## Zusatzaufgabe (freiwillig)
- Implementiere einen einfachen Gesundheitscheck (Health Check) für deinen Container.