---
layout: page
title: Whisper.cpp und Docker
menubar: false
nav_exclude: true
exclude: true
nav: false
---



## Anleitung zur Erstellung eines Sprachrekorders mit Whisper.cpp und Docker

### Schritte

1. **Projektstruktur erstellen**
    - Erstelle die folgenden Dateien und Verzeichnisse:
      - `docker-compose.yml`
      - `init.sh`
      - `/record` (Endpunkt in Remix)
      - `nginx.conf`
      - `samples/` (Verzeichnis)

2. **Docker Compose Datei erstellen**
    - Erstelle eine `docker-compose.yml` Datei mit dem notwendigen Services für Remix und Whisper.cpp.
    - Beispielinhalt:
      ```yml
      services:
        remix:
            (freiwillig)
        whispercuda:
            image: ghcr.io/ggerganov/whisper.cpp:main-cuda
            stdin_open: true
            tty: true
            deploy:
            resources:
                reservations:
                devices:
                    - capabilities: [gpu]
            runtime: nvidia
            entrypoint: /app/server
            command: --host 0.0.0.0 -l auto --convert -m /app/models/ggml-medium-q5_0.bin  
            environment:
            - NVIDIA_VISIBLE_DEVICES=all
            - NVIDIA_DRIVER_CAPABILITIES=compute,utility
            ports:
            - "8080:8080"  # Change this to the necessary port mapping
            volumes:
            - models:/app/models  # Mount the named volume to the desired path
            - ./samples/:/app/samples

        volumes:
        models:
      ```

3. **Initialisierung**
    - gehe in den Container mit `docker compose exec whispercuda bash`
    - Lade ein Model: `sh /app/model/download-ggml-model.sh medium-q5_0`
        - Andere Modellgrößen wie small oder large sind ebenfalls möglich
    - Teste ob eine wav-Datei im container zu Text transkribiert werden kann:
      ```sh
        # convert mp3 to wav and 16khz
        ffmpeg -i samples/<file>.<mp3|wav|...> -ar 16000 samples/test16khz.wav

        # run a testfile in german using the medium model and a 16khz sample rate
        ./main -l de -m /app/models/ggml-medium-q5_0.bin  samples/test16khz.wav
      ```

4. **HTML-Datei für die Weboberfläche erstellen**
    - Erstelle eine Remix-Route, um eine einfache Weboberfläche für die Sprachaufnahme zu bieten.
    - Beispiel mit reinem JS:
      ```js
        let mediaRecorder;
        let audioChunks = [];

        document.getElementById('recordButton').addEventListener('click', async () => {
            const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
            mediaRecorder = new MediaRecorder(stream, { mimeType: 'audio/webm' });
            mediaRecorder.start();

            mediaRecorder.addEventListener('dataavailable', event => {
                audioChunks.push(event.data);
            });

            mediaRecorder.addEventListener('stop', () => {
                const audioBlob = new Blob(audioChunks, { type: 'audio/webm' });
                const audioFile = new File([audioBlob], 'recording.wav', { type: 'audio/wav' });
                sendAudioToWhisper(audioFile);
            });

            document.getElementById('recordButton').disabled = true;
            document.getElementById('stopButton').disabled = false;
            document.getElementById('status').textContent = 'Recording...';
        });

        document.getElementById('stopButton').addEventListener('click', () => {
            mediaRecorder.stop();
            document.getElementById('recordButton').disabled = false;
            document.getElementById('stopButton').disabled = true;
            document.getElementById('status').textContent = 'Stopped recording.';
        });

        async function sendAudioToWhisper(audioFile) {
            const formData = new FormData();
            formData.append('file', audioFile);
            formData.append('temperature', '0.0');
            formData.append('temperature_inc', '0.2');
            formData.append('response_format', 'json');

            const response = await fetch('/inference', {
                method: 'POST',
                body: formData
            });

            const result = await response.json();
            document.getElementById('response').textContent = JSON.stringify(result, null, 2);
        }
      ```



6. **Docker Compose starten**
    - Führe den folgenden Befehl aus, um die Docker-Container zu starten:
      ```sh
      docker-compose up -d
      ```

7. **Weboberfläche verwenden**
    - Öffne einen Webbrowser und navigiere zu `http://localhost/record`, um die Sprachrekorder-Weboberfläche zu verwenden.
    - Klicke auf "Start", um die Aufnahme zu beginnen, und auf "Stop", um die Aufnahme zu beenden und die Datei an den Whisper.cpp Service zu senden.

### Hinweise
- Stelle sicher, dass alle Pfade korrekt sind und die notwendigen Dateien vorhanden sind.
- Überprüfe die Docker-Logs, falls Probleme auftreten:
  ```sh
  docker-compose logs -f
  ```

