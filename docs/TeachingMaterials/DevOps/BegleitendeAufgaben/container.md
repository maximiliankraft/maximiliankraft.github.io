---
layout: page
title: Begleitende Aufgabe - Containerisierung
menubar: false
nav_exclude: true
exclude: true
nav: false
---

Erstelle ein Docker-Image für deine Anwendung, um sicherzustellen, dass sie in einer isolierten Umgebung läuft. Gehe dabei wie folgt vor:

1. Erstelle eine `Dockerfile` im Hauptverzeichnis deines Projekts. Beispiel für eine Node.js-Anwendung:

    ```dockerfile
    FROM node:16
    WORKDIR /app
    COPY package*.json ./
    RUN npm install
    COPY . .
    EXPOSE 3000
    CMD ["npm", "start"]
    ```

2. Baue das Docker-Image:

    ```sh
    docker build -t <dein-image-name> .
    ```

3. Starte einen Container basierend auf deinem Image:

    ```sh
    docker run -p 3000:3000 <dein-image-name>
    ```

4. Teste, ob deine Anwendung im Container wie erwartet funktioniert.

Optional: Lade dein Docker-Image in eine Container-Registry wie Docker Hub oder Azure Container Registry hoch, um es später für das Deployment zu verwenden.
