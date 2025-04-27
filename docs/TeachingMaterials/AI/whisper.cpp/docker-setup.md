---
layout: page
title: Whisper.cpp Container verbessern
menubar: false
nav_exclude: true
exclude: true
nav: false
---

# Whisper.cpp Container verbessern


Der container `ghcr.io/ggerganov/whisper.cpp:main` lässt einige Wünsche an einen guten Container offen. 

Wenn man sich die Struktur des Containers mit `docker history ghcr.io/ggerganov/whisper.cpp:main` ansieht, bekommt man folgenden output:


```sh
IMAGE          CREATED        CREATED BY                                      SIZE      COMMENT
d10e2be76ea5   4 weeks ago    ENTRYPOINT ["bash" "-c"]                        0B        buildkit.dockerfile.v0
<missing>      4 weeks ago    COPY /app /app # buildkit                       187MB     buildkit.dockerfile.v0
<missing>      4 weeks ago    RUN /bin/sh -c apt-get update &&   apt-get i…   843MB     buildkit.dockerfile.v0
<missing>      4 weeks ago    WORKDIR /app                                    0B        buildkit.dockerfile.v0
<missing>      2 months ago   /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B        
<missing>      2 months ago   /bin/sh -c #(nop) ADD file:1b6c8c9518be42fa2…   77.9MB    
<missing>      2 months ago   /bin/sh -c #(nop)  LABEL org.opencontainers.…   0B        
<missing>      2 months ago   /bin/sh -c #(nop)  LABEL org.opencontainers.…   0B        
<missing>      2 months ago   /bin/sh -c #(nop)  ARG LAUNCHPAD_BUILD_ARCH     0B        
<missing>      2 months ago   /bin/sh -c #(nop)  ARG RELEASE                  0B        

```

Dabei ist besonders der `ENTRYPOINT` `bash` spannend. Dieser Container kann also nur eine shell öffnen.
Öffnet man eine mit `docker run -it  ghcr.io/ggerganov/whisper.cpp:main bash` hat man Zugriff auf den sourcecode von whisper.cpp. 

## Vorbereitung

Um jedoch ausführbare Dateien zu bekommen muss man diese SELBST compilieren. Um den Compiler herunterladen zu können muss man zunächst die Paketquellen aktualisieren.
```sh
apt update -y
```

Dannach muss man den Compiler und andere Build-Tools installieren:
```sh
apt install -y build-essential
```

Sobald das erledigt ist kann man mit Cmake den Sourcecode compilieren:
```sh
cmake -S /app/ -B build
```

Im Ordner `/app/build/bin` werden dann mehrere ausführbare Dateien erstellt. Z.b `whisper-cli` für das transkribieren lokaler Dateien, oder `whisper-server` Diese können dann z.b mit dem Befehl
```
./build/whisper-cli
```
gestart werden.

Führt man den Befehl 
```sh
/app/build/whisper-cli
```

aus bekommt man folgende Ausgabe:
```sh
error: no input files specified

usage: ./whisper-cli [options] file0 file1 ...
supported audio formats: flac, mp3, ogg, wav

options:
  -h,        --help              [default] show this help message and exit
  -t N,      --threads N         [4      ] number of threads to use during computation
  -p N,      --processors N      [1      ] number of processors to use during computation
  -ot N,     --offset-t N        [0      ] time offset in milliseconds
  -on N,     --offset-n N        [0      ] segment index offset
  -d  N,     --duration N        [0      ] duration of audio to process in milliseconds
  -mc N,     --max-context N     [-1     ] maximum number of text context tokens to store
  -ml N,     --max-len N         [0      ] maximum segment length in characters
  -sow,      --split-on-word     [false  ] split on word rather than on token
  ...
```

damit kann man dann arbeiten. Der Container ist also nicht wirklich für den produktiven Einsatz geeignet. 

### Modelle
Die Modelle sind in `/app/models` gespeichert. Diese werden mit dem Skript `/app/model/download-ggml-model.sh` heruntergeladen. Führt man es direkt im Container aus, bekommt man folgenden Output:
```sh
Usage: ./download-ggml-model.sh <model> [models_path]

Available models:
  tiny tiny.en tiny-q5_1 tiny.en-q5_1 tiny-q8_0
  base base.en base-q5_1 base.en-q5_1 base-q8_0
  small small.en small.en-tdrz small-q5_1 small.en-q5_1 small-q8_0
  medium medium.en medium-q5_0 medium.en-q5_0 medium-q8_0
  large-v1 large-v2 large-v2-q5_0 large-v2-q8_0 large-v3 large-v3-q5_0 large-v3-turbo large-v3-turbo-q5_0 large-v3-turbo-q8_0

____________________________________
.en = english-only -q5_[01] = quantized -tdrz = tinydiarize

```


## Aufgabe

Erstelle einen neuen Container, der die Whisper.cpp CLI, Server und andere compilierte Dateien enthält. Erstelle ein Init-Skript welches, basierend auf den Umgebungsvariablen ein passendes Modell herunterlädt. Achte in compose darauf dass dieses Modell dann auch in einem Volume gespeichert wird. Ansonsten wird der Container bei jedem Start das Modell neu herunterladen.
Der Container soll dann die Möglichkeit bieten, eine Audio-Datei in Text umzuwandeln. Sobald das Init-Skript ausgeführt wird, soll der Container die Audio-Datei in Text umwandeln und das Ergebnis auf der Konsole ausgeben.

## Beispiel für Compose

```yaml
version: '3.8'

services:
    whisper:
        image: my-whisper.cpp-improved
        environment:
            - MODEL=medium
        volumes:
            - ./models:/app/models
```

