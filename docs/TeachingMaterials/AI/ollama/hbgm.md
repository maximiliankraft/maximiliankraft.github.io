---
layout: page
title: Chatbot Ollama [HBGM]
permalink: /TeachingMaterials/Ollama/HBGM
menubar: false
nav_exclude: true
exclude: true
nav: false
---

# Einen Chatbot mit Ollama erstellen

1. Ollama-Docker Container herunterladen
    - [Ollama auf Docker Hub](https://hub.docker.com/r/ollama/ollama)

    - Oder Ollama direkt installieren: [Ollama Downloads](https://ollama.com/download/windows) 

2. Wenn eine Nvidia Grafikkarte verbaut ist:
 - [Nvidia Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installation)

3. Compose-Datei für Ollama mit GPU-Konfiguration

```yaml
services:
  ollama:
    image: ollama/ollama
    environment:
      - OLLAMA_ORIGINS="*"
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
    name: ollama
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

- Übergabe von Bildern an das Modell: [siehe Blogpost](https://ollama.com/blog/vision-models)
- Einfacher Chat: [siehe Dokumentation](https://github.com/ollama/ollama-python/blob/main/examples/chat.py)

7. Entwicklung einer Chat-Webanwendung 

Verwende Python für den Serverseitigen Code. Am Client ist JavaScript zu verwenden.

Binde die Ollama Python Schnittstelle in ein Django-Projekt ein. Du kannst aber auch ein anderes Webframework verwenden, wenn du willst. Auf der Webseite soll es ein Eingabefeld geben sowie die Möglichkeit Bilder und PDFs hochzuladen. Wenn ein PDF hochgeladen wird, soll dieses als ein Bild je Seite an das Modell `llama3.2-vision:11b` übergeben werden. Falls dein PC dieses Modell nicht ausführen kann, kannst du auch ein kleineres nehmen. [Moondream](https://ollama.com/library/moondream) z.B.  

Die [gestreamte](https://github.com/ollama/ollama-python/blob/main/examples/generate-stream.py) Antwort des Models soll dann schrittweise am Client angezeigt werden, siehe [Beispielprojekt](https://github.com/edilio/StreamingHttpResponse/tree/master). Antwortet der User, soll der gesamte Chatverlauf an das Model geschickt werden. Nur so kennt es den Kontext um bessere Antworten liefern zu können. Packe dazu das JSON und den CSRF-Token in ein [FormData](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest_API/Using_FormData_Objects)-Objekt. Die Rückmeldung des Modells soll dann dynamisch in einem div-Container hinzugefügt werden. 

### Vorgehensweise

#### In den views: 

- chat endpoint 
- serve chat ui
+ ensprechende urls für endpunkte
+ 
#### templates: 
Erstelle eine chat ui in html+js+(css)

#### compose
siehe Punkt 3
#### models
Model für speicher der Chat-Nachrichten

- Chat Message  
  - Session id  
  - message  
  - sender bzw. role  
  - timestamp

#### manage.py
- makemigrations 
- migrate

#### uuid 
```python
import uuid
str(uuid.uuid4())
```

## Weitere Informationen

> [Ollama Github](https://github.com/ollama/ollama)

> [Bestehende Modelle in Ollama integrieren](https://github.com/ollama/ollama/blob/main/docs/import.md)

> [Functions as Tools](https://ollama.com/blog/functions-as-tools)
