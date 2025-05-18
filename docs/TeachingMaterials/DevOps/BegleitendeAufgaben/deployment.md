---
layout: page
title: Begleitende Aufgabe - Deployment
menubar: false
nav_exclude: true
exclude: true
nav: false
---

Nachdem deine Webanwendung nun lokal läuft, sorge dafür dass diese im Internet aufrufbar ist. Nutze dafür die Azure App Services. Gehe dabei wie folgt vor:

1. Melde dich im [Azure Portal (portal.azure.com) ](https://portal.azure.com) mit deinem Schulaccount an.

2. Erstelle eine neue Ressourcengruppe für dein Projekt:
    - Wähle im Portal "Ressourcengruppe" und klicke auf "Erstellen"
    - Benenne sie nach deinem Projekt (z.B. "meine-webapp-rg")
    <!-- Hier Screenshot von der Ressourcengruppen-Erstellung einfügen -->

3. Erstelle einen neuen App Service:
    - Suche nach "App Services" und klicke auf "Erstellen"
    - Wähle deine Ressourcengruppe aus
    - Gib einen Namen für deine Web-App ein (dieser wird Teil der URL: deinname.azurewebsites.net)
    - Wähle den passenden Runtime Stack für deine Anwendung (z.B. Node.js, .NET, Python)
    - Wähle den kostenfreien F1-Tarif für Testzwecke
    <!-- Hier Screenshot vom App Service Erstellungsdialog einfügen -->

4. Konfiguriere das Deployment:
    - Unter "Deployment" kannst du verschiedene Optionen wählen:
      - GitHub-Integration (falls dein Code auf GitHub liegt)
      - Azure DevOps (für CI/CD-Pipelines)
      - Lokales Git-Repository
      - FTP-Upload
    - Wähle die für dich passendste Methode und konfiguriere sie nach den Anweisungen

5. Dokumentiere in deinem Projektbericht:
    - Die URL deiner Webanwendung
    - Die gewählte Deployment-Methode
    - Herausforderungen und Lösungen beim Deployment-Prozess
    - Screenshot deiner laufenden Anwendung im Internet

6. Optional: Konfiguriere eine benutzerdefinierte Domain, wenn du eine besitzt.

Hinweis: Stell sicher, dass alle Umgebungsvariablen und Konfigurationen, die deine Anwendung benötigt, im App Service richtig eingestellt sind. Diese können unter "Konfiguration" im App Service angepasst werden.
