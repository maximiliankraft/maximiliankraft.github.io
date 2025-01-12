---
layout: page
title: Einen Chatbot mit Ollama erstellen
permalink: /TeachingMaterials/Ollama
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

Entscheide selbst, wie du Ollama von einer Webanwendung aus ansteuerst. Entweder über Javascript. In dem Fall wird von einem Webserver eine Anfrage an einen anderen Server geschickt. Man muss also entweder die CORS-Header richtig einrichten, oder beide Server über einen reverse Proxy bündeln, so dass es am Client wie ein einzelner Server aussieht. 

Oder du bindest die Ollama Python Schnittstelle in ein Python-Webframework ein. Anbieten würden sich z.B Django oder FastAPI. Du kannst aber auch ein anderes verwenden. Auf der Webseite soll es ein Eingabefeld geben sowie die Möglichkeit Bilder und PDFs hochzuladen. Wenn ein PDF hochgeladen wird, soll dieses als ein Bild je Seite übergeben werden. 

Die gestreamte Antwort des Models soll dann schrittweise angezeigt werden. Antwortet der User, soll der gesamte Chatverlauf an das Model geschickt werden. Nur so kennt es den Kontext um bessere Antworten liefern zu können. 


## Weitere Informationen

> [Ollama Github](https://github.com/ollama/ollama)

> [Bestehende Modelle in Ollama integrieren](https://github.com/ollama/ollama/blob/main/docs/import.md)