---
layout: page
title: Backups mit rclone erstellen
permalink: /TeachingMaterials/Backup
menubar: false
nav_exclude: true
exclude: true
nav: false
---

# Backups mit rclone erstellen 

[rclone](https://rclone.org/) ist ein Programm zur Syncronisation von diversen Cloudspeicher-Anbietern. Es gibt einige Cloud-Syncronisationsprogramme wie z.B Cyberduck o.ä, aber keines welches mir bekannt ist, ist komatibel zu [70!](https://rclone.org/#providers) anbietern. Interessant hierbei sind neben normalen Anbietern wie OneDrive, Google Drive etc. auch die `virtual provider`. Diese können die `storage provider` weiterverarbeiten. Mit dem *virtual provider* `Crypt` kann man z.B alle seine Dateien verschlüsselt auf einen `storage provider` hochladen. Erstellt man Backups von fremden personenbezogenen Daten welche der DSGVO unterliegen kann das Hilfreich sein um die darin enthaltenen Bestimmungen einzuhalten. Dann sind Serverstandorte außerhalb der EU weniger problematisch. 

Benötigen bestimmte Services Datei-Übertragunsprotokolle wie FTP oder Webdav, kann man mit dem *virtual provider* `union` die Daten umleiten. Wobei es in den meisten Fällen ausreichend sein wird die Dateien lokal zu speichern. Dazu gibt es den `Local File System` provider. 


## rclone einrichten

Auch wenn rclone vorwiegend ein Kommandozeilen basiertes Programm ist, bietet es seit einiger Zeit eine [GUI](https://rclone.org/gui/) an. Mit dem Kommando:

```sh
rclone rcd --rc-web-gui
```

kann man die GUI starten. Im Bereich `Configs` in der Seitenleiste:

![enter configs](enterconfigs.png)

Dort dann auf `Create a New Config` klicken:

![button to create a new config](createnewconfig.png)

- Anleitungen für jeden *storage provider* gibt es [hier](https://rclone.org/docs/). 
- Eine Anleitung zum verschlüsselten hochladen [hier](https://rclone.org/crypt/)


## Aufgabe 1:

Erstelle eine Konfiguration welche einen beliebigen Ordner verschlüsselt auf einen *storage provider* deiner Wahl hochlädt. Protokollliere deine Vorgehensweise. 

## Aufgabe 2:
Erstelle ein verschlüsseltes Backup von einem MySQL Container. Dazu kannst du das [rclone Docker image](https://hub.docker.com/r/rclone/rclone) verwenden. Mounte das selbe Volume in dem sich auch die MySQL Daten befinden in einem Container von diesem Volume und führe beim hochfahren des Containers einen Upload der Daten durch.
