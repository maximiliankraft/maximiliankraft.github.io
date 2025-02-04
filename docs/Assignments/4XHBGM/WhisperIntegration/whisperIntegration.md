---
layout: page
title: KI-Integration in eine Webapplikation
permalink: /Assignments/4XHBGM/WhisperIntegration
menubar: false
nav_exclude: true
exclude: true
nav: false
---

Ziel dieser Aufgabe ist es ein bestehendes Modell auszuführen und die Ein-/Ausgaben in eine neue Anwendung zu integrieren. Es soll eine Webanwendung erstellt werden in welcher man via dem Browser auf das Mikrofon zugreifen kann. Der aufgenommene Sound soll dann an einen Server gesendet werden welcher diese Daten an das Modell `whisper-small` weitergibt. Der Output des Modells soll dann als Antwort zum Client der Webanwendung geschickt werden.

Die einzelnen Modelle/Technologien kann man ggf. auch einfach für Zukünftige Projekte austauschen. Auf Huggingface gibt es ein riesige [Sammlung](https://huggingface.co/models) an Modellen die man so oder so ähnlich in Anwendungen integrieren kann. Es gibt spezialisierte Modelle für:
- Semantische Segmentierung
- Bildtext zu Text
- Bild zu Text
- Objekt-Erkennung
- Text-Klassifikation
- Zusammenfassungen von Text
- Text-Ähnlichkeit
- uvm. 


Auch immer mehr multimodale Modelle für z.B:
- Fragen zu einem Dokument beantworten
- Text zu Video
- uvm. 

## Benötigte Libraries
Um diese Aufgabe zu implementieren benötigt man 
1. Eine Umgebung zum ausführen des neuronalen Netzes
2. Einen JavaScript-Code welcher Sound aufnehmen kann
3. Einen JavaScript-Code welcher Dateien an einen Server schicken kann
4. Einen Server der Audiodateien annimmt, und via HTTP mit Text antwortet

### Zu Punkt 1:
Das bereitgestellte Jupyter-Notebook bzw. die [Infoseite auf Huggingface](https://huggingface.co/openai/whisper-small) beschreibt wie man Whisper-Small ausführen kann. 

Modelle von Huggingface kann man mit deren [transformers](https://pypi.org/project/transformers/) library für Python ausführen. Diese hat [PyTorch](https://pytorch.org/) als eine dependency. Eine Umfangreiche library änlich wie Tensorflow oder JAX zum erstellen, trainieren und ausführen von neuronalen Netzen. PyTorch hat eine größe von ca. 3 GB und muss daher zuhause schon vorinstalliert werden. Wenn man das nur in der Schule runterlädt mit dem langsamen WLAN dort, dann geht sich das innerhalb einer Unterrichtseinheit nicht aus. Hat man eine Nvidia oder AMD Grafikkarte kann man Pytorch auch so installieren dass es einige Berechnungen (vorwiegend Matrix-Multiplikationen) auf die GPU auslagert. Dazu gibt es von den Herstellern der GPUs Programme womit man allgemeine Befehle an die GPU schicken kann. Diese Programme sind CUDA für Nvidia bzw. ROCm für AMD. Bei der installation von PyTorch steht dabei welches Programm damit kompatibel ist. Für CUDA ist das aktuell noch die Version 12.1, ROCm (nur auf Linux/WSL) braucht die Version 6. Installiert euch je nach Grafikkarte eine dieser Beschleuniger vor der Installation von PyTorch, dann ist die Ausführung von den neuronalen Netzen ca. 10 mal schneller. Hat man keine der beiden Karten im Laptop kann man auch auf Colab ausweichen oder man führt es auf der CPU aus. Beides ist nicht ideal, die CPU ist langsam und Colab muss man viel (wiederholt) konfigurieren. Auch wird es dann nicht lokal ausgeführt. CUDA 12.1 findet ihr [hier](https://developer.nvidia.com/cuda-12-1-0-download-archive), ROCm 6 [hier](https://rocm.docs.amd.com/projects/install-on-linux/en/latest/tutorial/quick-start.html). 

### Zu Punkt 2:
Um Sound aufzunehmen gibt es einen Beispielcode in folgendem [Repository](https://github.com/Mido22/MediaRecorder-sample). 

### Zu Punkt 3:
Der Soundrekorder aus Punkt 2 erzeugt ein JavaScript `Blob`-Objekt. Wie man dieses auf einem Server hochladen kann siehe [dieses Tutorial](https://www.geeksforgeeks.org/how-can-javascript-upload-a-blob/).

### Zu Punkt 4:
Um die Sounddaten annehmen zu können und an die Transformer-Library weitergeben zu können würde sich ein Webserver in Python anbieten. In der FastAPI-Dokumentation gibt es eine [Anleitung](https://fastapi.tiangolo.com/tutorial/request-files/) wie dieser Server Dateien annehmen kann. Für die ersten Schritte in FastAPI gibt es ein Tutorial [hier](https://fastapi.tiangolo.com/tutorial/first-steps/). 

