---
layout: page
title: Gruppenprojekt
permalink: Assignments/4XHBGM/MGIN/Uebung4
menubar: false
nav_exclude: true
exclude: true
nav: false
---


### Zielsetzung

Jeder Schüler soll:
1. Eine FHIR-Ressource modellieren und Instanzen davon in einer Datenbank speichern.
2. Ein Formular sowie ein Template erstellen, um bestehende Einträge zu ändern, neue Einträge zu erstellen oder bestehende Einträge zu löschen (CRUD-Funktionalität).
3. Die Implementierung mit Git verwalten und durch viele kleine Commits regelmäßig dokumentieren.


### Technische Anforderungen

- **Programmiersprache**: Python
- **Framework**: Django
- **FHIR-Bibliothek**: [fhir.resources (verfügbar über PyPi)](https://pypi.org/project/fhir.resources/) 



### Vorgehensweise

0. **Repository klonen**

    - [4AHBGM](https://github.com/Die-Spengergasse/SJ2425-MGIN4A-FHIR)
    - [4BHBGM](https://github.com/Die-Spengergasse/SJ2425-MGIN4B-FHIR)

1. **Branch-Erstellung**: Jeder Schüler erstellt einen eigenen Branch für die jeweilige FHIR-Ressource. Der Branch muss folgender Namenskonvention folgen: `feature/<ressource-name>`.
   
2. **Entwicklung**: Implementiere für die Ressource, gemäß den Spezifikationen aus fhir.resources, die erforderlichen Datenbankmodelle, Formulare und Templates.

3. **Testing**: Teste deine Implementierung gründlich, um sicherzustellen, dass die CRUD-Funktionalitäten wie gewünscht funktionieren. Verwende dazu das [Unittest-Framework von Django](https://docs.djangoproject.com/en/5.1/topics/testing/overview/) Wünschenswert wäre eine Coverage von 100%. Nachdem das aber nicht praktikabel ist, reichen auch 75% - 85% Coverage. 

4. **Push auf Dev-Branch**: Sobald die Ressource vollständig implementiert und getestet ist, pushe deine Änderungen auf den `dev`-Branch.

5. **Integration**: Teste im dev-Branch ob dein Code auch nicht die Funktionalität des Codes deiner Kollegen beeinträchtigt.  Nach erfolgreichem Testen aller Ressourcen im `dev`-Branch, erfolgt der Merge in den `main`-Branch. Erstellt einen Workflow welcher bei jedem [pull-request](https://docs.github.com/en/actions/writing-workflows/choosing-when-your-workflow-runs/events-that-trigger-workflows#pull_request) einen [Django Test Workflow](https://github.com/UKnowWhoIm/django-test-action) ausführt. 

6. **Dokumentation**: Jeder Schüler erstellt ein Protokoll über die eigene Vorgehensweise und dokumentiert dabei alle wesentlichen Schritte. Achte darauf alle Punkte aus den Bewertungsgrundlagen zu erwähnen. Die Abgabe des Protokolls kann auch gerne als Text im Pull-Request auf den main-Branch erfolgen.

7. **Änderungsprotokoll**: Verwende den folgenden Git-Befehl, um die von dir erstellten Commits anzuzeigen:
```bash
git log --author="<Dein Name>"
```


### Bewertungsgrundlagen

- FHIR Ressource als Modell erstellt
- Formular erstellt
- Template erstellt
- Übersicht erstellt mit den Funktionen
    - **C**reate
    - **R**ead
    - **U**pdate
    - **D**elete
- Code via Pull-Request auf Dev-Branch gegeben
- Code via Pull-Request auf main-Branch gegeben
    - Tests erfolgreich
