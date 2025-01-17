---
layout: page
title: PACS einrichten und ansteuern
permalink: Assignments/4XHBGM/MGIN/Uebung5
menubar: false
nav_exclude: true
exclude: true
nav: false
---

Entwickle einen Webservice mit Django, der es ermöglicht, DICOM-Daten anzuzeigen, hochzuladen und zu löschen. Als Backend soll das PACS `dcm4chee` verwendet werden. Schau dir die bereitgestellten Jupyter-Notebooks an, wie diese Daten an das PACS senden und von dort abfragen. Integriere folgenden Funktionen in eine Webanwendung:

- Hochladen von DICOM-Daten
- Abfragen von DICOM-Daten
    - Sowohl Voxel(3D)/Pixel(2D) Daten als auch Metadaten
- Ändern und ergänzen der Metadaten

## Anforderungen
1. **Projektstruktur**: Erstelle ein neues Django-Projekt und eine App innerhalb dieses Projekts.
2. **DICOM-Daten**: Verwende die bereitgestellten DICOM-Daten aus der [zip-Datei](/Assignments/4XHBGM/MGIN/PACS.zip).
    - Auch ein Beispielcode in Form von Jupyter-Notebooks ist dort enthalten.
4. **Views**: Implementiere Views, die es ermöglichen, die DICOM-Daten in einer HTML-Seite anzuzeigen und zu bearbeiten.
5. **Templates**: Erstelle Templates für die Darstellung der DICOM-Daten.

Protokolliere die Implementierung sowie die Tests der Funktionen. 