---
layout: page
title: Einen Chatbot mit Ollama erstellen
permalink: /TeachingMaterials/Ollama/HIF
menubar: false
nav_exclude: true
exclude: true
nav: false
---

1. Docker Container herunterladen
    - [Ollama auf Docker Hub](https://hub.docker.com/r/ollama/ollama)

2. Wenn eine Nvidia Grafikkarte verbaut ist:
 - [Nvidia Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installation)

3. Compose-Datei für Ollama mit GPU-Konfiguration

```yaml
services:
  ollama:
    image: ollama/ollama
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: all
              capabilities:
              - gpu
    volumes:
      - ollama:/root/.ollama
      - ./scripts:/scripts
    ports:
      - 11434:11434
volumes:
  ollama:
```

4. Eine Shell des Containers öffnen und Ollama starten

```sh
C:/> docker compose exec ollama bash
root@containerid# ollama ...
```

5. Ein Modell herunterladen

Nimm eine Multimodales `Vision` Modell aus deren [Registry](https://ollama.com/search?c=vision). 

```
ollama pull <modellname>
```

6. Ollama Python-Schnittstelle

Verfügbar auf [PyPi](https://pypi.org/project/ollama/).

Übergabe von Bildern an das Modell: [siehe Blogpost](https://ollama.com/blog/vision-models)

7. Entwicklung einer Chat-Webanwendung 

Verwende Remix + React mit Material-UI zur Frontendentwicklung. Die Kommunikation mit dem Backend erfolgt über die REST-API von Ollama. Folgendermaßen kannst du dir ein Projekt holen:

```sh
curl https://codeload.github.com/mui/material-ui/tar.gz/master | tar -xz --strip=2  material-ui-master/examples/material-ui-remix-ts
cd material-ui-remix-ts

```
Auf der Webseite soll es ein Eingabefeld geben sowie die Möglichkeit, Bilder und PDFs hochzuladen. Wenn ein PDF hochgeladen wird, soll dieses als ein Bild je Seite übergeben werden [siehe blog](https://ollama.com/blog/vision-models).

Die gestreamte Antwort des Modells [siehe docs](https://github.com/ollama/ollama-js?tab=readme-ov-file#streaming-responses) soll dann schrittweise angezeigt werden. Antwortet der User, soll der gesamte Chatverlauf [siehe messages-Array](https://github.com/ollama/ollama-js?tab=readme-ov-file#streaming-responses) an das Modell geschickt werden, damit es den Kontext kennt und bessere Antworten liefern kann.

## Weitere Informationen

> [Material UI Installation](https://mui.com/material-ui/getting-started/installation/)

> [Material UI Komponenten](https://mui.com/material-ui/all-components/)

> [Ollama Github](https://github.com/ollama/ollama)

> [Bestehende Modelle in Ollama integrieren](https://github.com/ollama/ollama/blob/main/docs/import.md)

