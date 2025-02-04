---
layout: page
title: Azure Anleitung ASP
permalink: /TeachingMaterials/AzureAnleitungASP
menubar: false
nav_exclude: true
exclude: true
nav: false
markdown: kramdown
kramdown:
  parse_block_html: true
---

## Virtuellen Computer anlegen

1. Auf [portal.azure.com](https://portal.azure.com) mit der Spengergasse-Email anmelden

> WICHTIG: Während der Anmeldung niemals Kreditkartendaten angeben. Falls Azure das verlangt nochmal prüfen ob ihr ein Studentenkonto erstellt habt. 

2. Zum `Virtuelle Computer` Menü gehen

![](2022-03-21-09-25-37.png)

Auf erstellen klicken, dannach auf `Azure VM`

![](2022-03-21-09-26-34.png)

Wähle eine bestehende Ressourcengruppe aus oder erstelle ggf. eine neue. Leg einen beliebigen Namen fest. Am besten mit deinem Kürzel oder intialen um doppelte Benennungen zu vermeiden. 

![](2024-04-16-07-28-50.png)

Erstelle eine VM entweder mit Ubuntu oder alternativ mit einer Distribution mit der du dich gut auskennst. Zum authentifizieren ist ein SSH-Schlüssel empfehlenswert da man sich kein Passwort merken muss.

![](2024-04-16-07-29-42.png)

Bei den Eingangsport brauchen wir SSH (22) und HTTP (80). Über Port 80 werden wir später auf unsere Webanwendung zugreifen. Über Port 22 können wir eine Konsole der VM erreichen. Wenn du willst kannst du auch versuchen HTTPS einzurichten, ist aber für diese Übung nicht notwendig. 

![](2024-04-16-07-30-11.png)

Klicke dann auf `Überprüfen + erstellen` die Zusammenfassung sollte folgendermaßen aussehen: 

![](2024-04-16-07-32-05.png)

Nachdem die Ressource erstellt wurde bekommt man folgende Bestätigung:

![](2024-04-16-07-33-45.png)

> **WICHTIG** beim Klick auf `Erstellen` erstellt Azure uns einen privaten Schlüssel in einer pem-Datei. Diesen brauchen wir um uns einloggen zu können. Unbedingt herunterladen!

![](2022-03-21-09-33-10.png)

In der Übersichtsseite können wir zum einen die aktuelle IP unserer VM einsehen, als auch einen DNS-Namen festlegen:

![](2024-04-16-07-35-02.png)

Mit folgendem Befehl können wir uns jetzt in eine Konsole der VM einloggen:

`ssh -i <dein-schlüsselname>.pem azureuser@<ip-deiner-vm>`

In meinem Fall (**bei dir anders**) sieht der Befehl so aus:

`ssh -i asphost_key.pem azureuser@108.143.154.216`

Bevor man sich zum ersten mal einloggt fragt einen SSH ob man 
der Gegenseite vertraut. 

```console
The authenticity of host '108.143.154.216 (108.143.154.216)' can't be established.
ED25519 key fingerprint is SHA256:gspN+LirQ+6X4C3m9EX1Fc6fbMxv/GQ66FPvyFnXYUU.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

Hier muss man `yes` eingeben bevor eine Verbindung aufgebaut wird. Für den am Anfang häufigen Fehler `Unprotected Key file` gibt es hier: [https://superuser.com/questions/1296024/windows-ssh-permissions-for-private-key-are-too-open](https://superuser.com/questions/1296024/windows-ssh-permissions-for-private-key-are-too-open) Lösungsansätze.


Erscheint dann eine Konsole mit grünem Text, hat der Login funktioniert. Für den nächsten Schritt müssen wir kurz zurück auf den eigenen Rechner wechseln. Das geht mit dem Befehl `exit`.

##### Daten übertragen in die VM

Im nächsten Schritt müssen wir user Projekt in die VM übertragen. Dazu eignet sich der Befehl `sftp`. Der Name steht für SSH File Transfer Protocol. Da FTP unverschlüsselt ist sollte man davon absehen es in seiner normalen Form zu verwenden. 

Ähnlich wie bei SSH ist die Befehlsstruktur hier:

`sftp -i <dein-schlüsselname>.pem azureuser@<ip-deiner-vm>`

Dannach erschreint der Prompt `sftp>` welcher FTP-Befehle entgegen nimmt. Mit `put <dateiname>.zip` können wir eine Datei von einem lokalen Ordner in die VM verschieben. Sobald alles verschoben wurde kann man auch hier mit `exit` wieder das Programm verlassen.

Nachdem die Projektdateien verschoben sind können wir uns wieder mit SSH auf der VM einloggen (`ssh -i ...`) und mit der Installation beginnen. Zunächst sollte man wie bei jeder neuen Linux-Installation ein update durchführen. Das funktioniert unter Ubuntu mit

`sudo apt-get update -y`

Ist das Update fertig können wir diverse Programme installieren. Wir benötigen Docker fürs Ausführen sowie unzip um die zip-Datei zu entpacken. Als kleines Hilfsprogramm noch dos2unix.

`sudo apt install  unzip dos2unix -y`

`sudo snap install docker`

Nun können wir mit `unzip <dateiname>.zip` unser Projekt auspacken. Um in den darin erstellen Ordner zu wechseln gibt es das Kommando `cd <dein-projektordner>`.

## Installation mit Docker
> Nachdem wir mit Docker noch nicht gearbeitet haben ist dieser Schritt freiwillig. Du kannst auch nur mit `dotnet` die Installation vornehmen. Es ist jedoch in der IT eine moderne und übliche Vorgehensweise Docker zu verwenden. Für ein Praktikum im Sommer o.ä wäre das ein großer Pluspunkt hier schon erste Erfahrungen zu haben.  

### compose ausführen
Das funktioniert - wie unter Windows auch - mit `docker-compose up`. Innerhalb des Containers wird dann das `Dockerfile` aufgebaut und ausgeführt. 

#### Port 8080 in compose ummappen

Wie in einem oberen Screenshot ersichtlich werden in Azure nur die Ports 22, 80 und 443 veröffentlicht. Da unsere Anwendung jedoch auf dem Port 8080 arbeitet müssen wir den Netzwerkverkehr umleiten.

Durch verändern der docker-compose.yml-Datei ist das ganz einfach möglich. Wie der innere auf den äußeren Port umgeleitet wird, wird immer foldendermaßen angegeben: `<aussenport>:<innenport>`. Statt `8080:8080` müssen wir also `80:8080` schreiben.

So könnte in deinem Projektordner die Datei docker-compose.yml aussehen: 

```yml
version: "3"
services: 
  dotnet:
    build: .
    ports:
      - "80:8080"
      
```

## Installation mit dotnet

So wie man unter Windows mit dem Kommando `dotnet` eine ASP-Anwendung ohne IDE ausführen kann, geht das auch unter Linux. Wenn man nur einen Konsolen-Zugriff hat geht es auch garnicht anders. Das Programm `dotnet` muss aber erst mit dem Paketmanager installiert werden. Dazu gibt es das Kommando:

```console
sudo apt-get install -y dotnet-sdk-6.0
```

> [Quelle](https://learn.microsoft.com/de-de/dotnet/core/install/linux-ubuntu-install?pivots=os-linux-ubuntu-2404&tabs=dotnet6) mit weiterführenden Anleitungen z.B für andere OS-Versionen bzw. für .NET 8

Mit dem Kommando:

```console
sudo dotnet run --urls=http://*:80/
```

kann man dann den Webserver starten. Dabei ist wichtig dass in dem Ordner in dem der Befehl ausgeführt wird sich die `.csproj`-Datei befindet. Was genau macht dieser Befehl? Mit `sudo` (superuser do) wird der nachfolgende Befehl als Administrator ausgeführt. `dotnet run` startet das ASP-Projekt. Genau der Befehl wird ausgeführt wenn man in einer IDE auf den Play-Button klickt. Mit dem Parameter `--urls` wird festgelegt wie der Server erreichbar sein soll. `http://*:80/` ist ein etwas komplizierterer Ausdruck. Mit `http` wird das Übertragungsprotokoll festgelegt. Der Stern `*` bedeutet dass der Name der Seite egal ist. Standardmäßig werden nur Anfragen beantwortet die an `localhost` gerichtet sind. Der Port 80 ist der Standardport von HTTP. Man könnte jede Seite mit :80 dahinter aufrufen. Standardmäßig kann man ihn aber auch weglassen. 


</details>


## Webservice aufrufen

Rufe die aktuelle IP (oder in meinem Fall habe ich eine Domain hinterlegt) auf und sieh nach ob eine Antwort zurückkommt. Bei mir wird folgendes JSON retourniert:

![](2024-04-15-20-59-22.png)