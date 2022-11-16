# Manuelles durchführen von HTTP-Requests

Ein HTTP-Request besteht aus `Header` sowie `Body`. Im Header werden Daten übertragen die das Protokoll zum arbeiten braucht. 

Der Aufbau eines HTTP-Requests besteht aus 3 Teilen im groben. Hier eine Beispielhafte Anfrage:

```http
GET / HTTP/1.0
Host: www.spengergasse.at

```

Wichtig hierbei ist das eine neue Zeile nicht nur aus einem `Newline \n` bzw. Linefeed besteht, sondern zusätzlich auch ein `Carriage-Return \r` dabei haben. Streng genommen sieht das obere Paket also so aus:

```http
GET / HTTP/1.0\r\n
Host: www.spengergasse.at\r\n
\r\n
```



> Aufgabe: Finde herraus wo du in deinem Browser dir anschauen kannst welche Requests an die HTTP-Server geschickt werden. Tipp: Es ist auch dort wo sich die Entwicklerkonsole befindet.

## HTTP Request selbst erstellen
Auf Linux gibt es das Programm *netcat* bereits vorinstalliert. Ausführbar mit dem Befehl `nc`. Um es auszuführen kannst du dir WSL2 herunterladen oder dir die für Windows kompilierte Version [hier](https://eternallybored.org/misc/netcat/) herunterladen. 

Das Programm läuft in der Konsole und nimmt als Argument einen Host sowie einen Port. Darauf öffnet es dann einen Socket. Das Programm nimmt nun Eingaben entgegen die es wenn eine neue Zeile kommt an den Server schickt. Probier mal das Programm mit folgenden Argumenten zu starten: `nc www.google.at 80`. 

Dann baut *netcat* eine Socket-Verbindung zu den Google-Servern auf Port 80 (dem Standard HTTP-Port) auf. In der Eingabemaske kannst du jetzt einen GET-Request absetzen indem du `GET / HTTP/1.0` schreibst. Die Google-Server sind hier sehr tolerant in dem was für Anfragen sie annhemen. `GET /` reicht auch schon. 

### Request auf spengergasse.at
Der Server unserer Schule (und so gut wie alle anderen) ist hier weit weniger tolerant. Das selbst zusammengebaute Paket muss exakt den HTTP-Spezifikationen entsprechen. 

Setze dafür zunächst einen HTTP-Request mit deinem Browser ab und speichere die Anfrage als Textdatei. Was steht sonst noch in dem Header aus GET ...?
 > Liste die Einstellungen auf und erkläre wofür sie gut sind. 

Den Dateiinhalt kannst du nun über *netcat* an den Server schicken. Wenn alles passt kommt der Response-Code 200 zurück. Ist beim Request was falsch kommt 400 zurück. 

Die Request-Kommandos sehen ca. so aus: 

Linux:
```bash
cat request.txt | nc www.spengergasse.at 80
```
Windows:
```ps
type request.txt | .\nc.exe www.spengergasse.at 80
```

Die Befehle `cat` bzw. `type` geben den Dateiinhalt auf `stdout` aus. Statt das wir ihn auf der Konsole anzeigen übergeben wir ihn jedoch als `stdin` an ein weiteres Programm -natcat. Dies Funktioniert mit dem Pipe-Operator `|`. Dort rufen wir dann netcat mit Host, Port, und bereits bestehenden Eingaben auf. 

## Fragen

> Wofür stehen die Response Codes 200, 201, 400, 404, 500? 

> Welche Request-Methoden neben `GET` gibt es noch? Wie müsste man die Requestdatei umbauen um einen Post o.ä mit Daten abzusetzen?


> Wie sieht deine Textdatei aus die zu einem erfolgreichen Request geführt hat? Worauf musstest du achten? Gibt es Einstellungen die du noch weglassen kannst?

> Kann man HTTP über UDP ausführen?


<br><br>

**Jeder der mir diese Fragen am Ende der Stunden beantworten kann bekommt ein Plus.** Allerdings sind die Fragen auch unabhängig davon wichtig. Bei der nächsten PLF werden die Fragen sehr ähnlich zu den hier gestellten sein. 


Quellen:
> [Carriage Return](https://unix.stackexchange.com/a/398188)

> [HTTP RFC](https://www.rfc-editor.org/rfc/rfc2616)



