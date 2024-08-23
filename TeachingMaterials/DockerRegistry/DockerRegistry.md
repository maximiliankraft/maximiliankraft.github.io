---
layout: page
title: Verteilung von Containern
permalink: /TeachingMaterials/DockerRegistry
menubar: false
nav_exclude: true
exclude: true
nav: false
---

In *Registries* (de: Register) kann man Images hochladen um sie öffenlich mit anderen Personen zu teilen oder privat mit verschiedenen Geräten.

Ursprünglich wurden die Registries von Docker [erfunden](https://docs.docker.com/registry/). Mittlerweile wurde deren API und Implementierung aber als Open-Source Projekt an die CNCF übergeben und hat nun den Namen [distribution](https://distribution.github.io/distribution/), Man kann also nun aus mehreren Quellen Container herunterladen. 

Ein Beispiel für ein bereits bekanntes Image aus einem Register wäre `mysql`. Dabei fügt Docker jedoch implizit noch einiges an Zusatzinformation hinzu. Eine längere Schreibweise wäre: ``docker.io/library/mysql:latest``. <a href="http://docker.io">docker.io</a> ist das Standardregister welches verwendet wird wenn kein anderes angegeben ist. Häufige Alternativen wären <a href="http://registy.gitlab.com">registy.gitlab.com</a> oder <a href="http://ghcr.io">ghcr.io</a> von Github. ``library`` ist der Username welcher das Image veröffentlicht hat. Auch dieser ist der Standardname wenn kein anderer angegeben wurde. Alle Container von diesem Usernamen wurden von der Docker Foundation veröffentlicht und geprüft. Auch tragen sie immer das Abzeichen `Docker official image`. Am Schluss wenn kein anderer tag spezifiziert wurde, nimmt Docker immer den tag `latest`. Dieser ist per Definition immer der neueste Tag und wird bei jedem build neu herunterlgeladen, unabhängig davon ob er sich geändert hat oder nicht seit dem letzten Build. 

## Selbst Images veröffentlichen

Docker Hub bietet einem die Möglichkeit dass man auf deren Platform Images hochladen kann. Github und Gitlab verfolgen hier einen etwas anderen Ansatz. Neben der Bereitstellung von Git-Repositories bieten sie auch Container-Registries sowie eine Build-Infrastruktur an. Docker Hub bietet ausschließlich an bereits fertige Images zu veröffentlichen. 

Erstelle dir für unsere einen User auf <a href="https://hub.docker.com">hub.docker.com</a>. Dannach hast du die Möglichkeit lokale Images dort hochzuladen. Auf deinem Rechner musst du dich dann noch mit dem Kommando ``docker login`` in der Konsole einloggen. Username uns Passwort sind die gleichen wie auf Docker Hub.

Zu dem bereits bekannten Kommando `docker pull` zum Herunterladen von Images gibt es auch ein Gegenstück. Mit ``docker push`` ist es möglich Images in ein Registry hochzuladen. 

Um ein Image zu bauen muss man ``docker build`` ausführen. Dabei bekommt man ein Image mit einem Hashwert als Namen. Möchte man es auch benennen ist das mit der Option ``-t localname`` möglich. ``t`` steht für tag. Hat man ein benanntes lokales Image kann man  dieses mit ``docker push localname registry/username/imagename:tag`` hochladen. 

### Veröffentlichtes Image in Compose verwenden
Um dein eigenes Image nicht immer dort bauen zu müssen wo du es brauchst kannst du in compose auf ein Register verweisen. Für unsere Datenbank haben wir das mit `image: mysql` bereits verwendet. Für deine Spring-Anwendung kannst du `build: ...` ersetzen mit `image: <dein-dockerhub-name>/<dein-imagename>`. Ist alles fertig aufgesetzt kannst du mit dieser Datei alleine deine Anwendung auf jedem Host mit Docker verwenden. Vorausgesetzt dein Image ist öffentlich zugänglich. Ansonsten müsstest du dich auch auf dem ensprechenden Rechner zuerst wieder mit `docker login` einloggen. 

<!-- todo latest erklären und ergänzen -->

### Quellen und weitere Infos 
><a href="https://stackoverflow.com/questions/28349392/how-to-push-a-docker-image-to-a-private-repository">Anleitung auf Stackoverflow</a>

><a href="https://docs.docker.com/docker-hub/official_images/">Offizielle Docker Images</a>

><a href="https://docs.gitlab.com/ee/user/packages/container_registry/">Gitlabs Container Registry erklärt</a>

><a href="https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry">GitHubs Container Registry erklärt</a>
