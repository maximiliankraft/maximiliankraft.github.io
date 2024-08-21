---
layout: page
title: Fragen zu Docker
permalink: /TeachingMaterials/DockerTheoriefragen
menubar: false
nav_exclude: true
exclude: true
nav: false
---

 - Wann ist es deiner Meinung nach sinnvoll Docker einzusetzen? Begründe deine Antworten.
    - beim Entwicklen (developement)
    - im aktiven Einsatz (production)
    - beim manuellen Testen neuer Features (beta-tests)
    - für automatisches Testen (unit & integration tests)
    - beim installieren des Programms auf (einer vielzahl von) Maschinen (deployment)



Gegeben ist folgendes Dockerfile: 
 ```Docker
FROM openjdk:17

WORKDIR /b-app

COPY target/spengermed-0.0.1-SNAPSHOT.jar spengermed.jar

EXPOSE 8080

CMD ["java", "-jar", "spengermed.jar" ]
 ```

Welche Funktion erfüllen die folgenden Befehle? Wie ist ihre allgemeine Sytax?
> Beispiel-Notation zur Syntax: ``kommando`` parameter1 parameter2 parameter3:parameter4 etc.

- ``FROM``:

- ``WORKDIR``:

- ``COPY``:

- `EXPOSE`:

- ``CMD``:


## Fragen zu docker-compose

Wie unterscheiden sich die Aufgabenbereiche der Befehle `docker` und `docker-compose`?

<br><br><br><br>



Gegeben ist folgende docker compose konfiguration: 

```yaml
version: '3.3'

services:
  springapp:
    build: .
    ports:
      - '8080:8080'
    depends_on:
      - springdb

  springdb:
    image: mysql:latest
    restart: always
    environment:
      MYSQL_DATABASE: 'spengermed'
      MYSQL_ROOT_PASSWORD: 'root'
    cap_add:
      - ALL
    ports:
      - '3306:3306'
    volumes:
      - springdbvolume:/var/lib/mysql

volumes:
  springdbvolume:

```

Welche Aufgaben haben folgende Schlüsselwörter:

- ``version``

- ``services``
- ``volumes``
- ``build``
- ``image``
- ``restart``
- ``environment``
- ``ports``
- ``volume``
- ``depends_on``
- `cap_add`


Was sind die Standard-Dateinamen für die Konfigurationsdateien folgender Programme:

- Docker
- docker-compose
