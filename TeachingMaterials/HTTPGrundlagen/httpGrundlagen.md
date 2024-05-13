---
layout: page
title: Azure Anleitung ASP
permalink: /TeachingMaterials/HTTPGrundlagen
menubar: false
nav_exclude: true
exclude: true
nav: false
---

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

### Exkurs Steuerzeichen
`\n` bzw. `\r` ist eine Darstellung von Steuerzeichen in plain text. In ASCII sind die ersten 32 Zeichen steuerzeichen. `\n` ist das 13. und `\r` das 10. Zeichen. Sie sind dafür Zuständig dass beim drücken der Enter-Taste auch eine neue Zeile erzeugt wird. Es gibt noch viele andere Zeichen `\0` ist das Ende eines Strings, das letzte Zeichen ist zum löschen vorheriger Zeichen usw. `\r\n` bedeutet also das eine spezielle Art von Enter notwendig ist in HTTP. `\n` alleine wäre auch möglich, ist aber nicht HTTP-Konform. Texteditoren unter Windows benutzen für Enter automatisch `\r\n`. Unter Linux nur `\n`.

<table class="wikitable float-right" style="text-align:center; font-family:monospace, monospace;">
<caption style="font-family:sans-serif;">ASCII-Zeichentabelle, <a href="/wiki/Hexadezimalsystem" title="Hexadezimalsystem">hexadezimale</a> Nummerierung
</caption>
<tbody><tr class="hintergrundfarbe6">
<th><a href="/wiki/Hexadezimalsystem" title="Hexadezimalsystem">Code</a></th>
<th>…0</th>
<th>…1</th>
<th>…2</th>
<th>…3</th>
<th>…4</th>
<th>…5</th>
<th>…6</th>
<th>…7</th>
<th>…8</th>
<th>…9</th>
<th>…A</th>
<th>…B</th>
<th>…C</th>
<th>…D</th>
<th>…E</th>
<th>…F
</th></tr>
<tr>
<th class="hintergrundfarbe6">0…
</th>
<td title="Null"><i><a href="/wiki/Nullzeichen" title="Nullzeichen">NUL</a></i>
</td>
<td title="Start of Heading"><i><a href="/wiki/Start_of_Heading" class="mw-redirect" title="Start of Heading">SOH</a></i>
</td>
<td title="Start of Text"><i><a href="/wiki/Start_of_Text_(Steuerzeichen)" class="mw-redirect" title="Start of Text (Steuerzeichen)">STX</a></i>
</td>
<td title="End of Text"><i><a href="/wiki/End_of_Text_(Steuerzeichen)" class="mw-redirect" title="End of Text (Steuerzeichen)">ETX</a></i>
</td>
<td title="End of Transmission"><i><a href="/wiki/End_of_Transmission" class="mw-redirect" title="End of Transmission">EOT</a></i>
</td>
<td title="Enquiry"><i><a href="/wiki/ENQ_(Steuerzeichen)" class="mw-redirect" title="ENQ (Steuerzeichen)">ENQ</a></i>
</td>
<td title="Acknowledge"><i><a href="/wiki/ACK_(Signal)" title="ACK (Signal)">ACK</a></i>
</td>
<td title="Bell"><i><a href="/wiki/Bell_(Steuerzeichen)" title="Bell (Steuerzeichen)">BEL</a></i>
</td>
<td title="Back Space"><i><a href="/wiki/Backspace" title="Backspace">BS</a></i>
</td>
<td title="Horizontal Tab"><i><a href="/wiki/Tabulatorzeichen" title="Tabulatorzeichen">HT</a></i>
</td>
<td title="Line Feed"><i><a href="/wiki/Zeilenvorschub" title="Zeilenvorschub">LF</a></i>
</td>
<td title="Vertical Tab"><i><a href="/wiki/Tabulatorzeichen" title="Tabulatorzeichen">VT</a></i>
</td>
<td title="Form Feed"><i><a href="/wiki/Seitenvorschub" title="Seitenvorschub">FF</a></i>
</td>
<td title="Carriage Return"><i><a href="/wiki/Wagenr%C3%BCcklauf" title="Wagenrücklauf">CR</a></i>
</td>
<td title="Shift Out"><i><a href="/wiki/Shift_Out" class="mw-redirect" title="Shift Out">SO</a></i>
</td>
<td title="Shift In"><i><a href="/wiki/Shift_In" class="mw-redirect" title="Shift In">SI</a></i>
</td></tr>
<tr>
<th class="hintergrundfarbe6">1…
</th>
<td title="Data Link Escape"><i><a href="/wiki/Data_Link_Escape" class="mw-redirect" title="Data Link Escape">DLE</a></i>
</td>
<td title="Device Control 1"><i><a href="/wiki/XON/XOFF" class="mw-redirect" title="XON/XOFF">DC1</a></i>
</td>
<td title="Device Control 2"><i>DC2</i>
</td>
<td title="Device Control 3"><i><a href="/wiki/XON/XOFF" class="mw-redirect" title="XON/XOFF">DC3</a></i>
</td>
<td title="Device Control 4"><i>DC4</i>
</td>
<td title="Negative Acknowledge"><i><a href="/wiki/ACK_(Signal)" title="ACK (Signal)">NAK</a></i>
</td>
<td title="Synchronous Idle"><i><a href="/wiki/Idle" title="Idle">SYN</a></i>
</td>
<td title="End of Transmission Block"><i><a href="/wiki/Transmission_Block" class="mw-redirect" title="Transmission Block">ETB</a></i>
</td>
<td title="Cancel"><i><a href="/wiki/Cancel" class="mw-redirect" title="Cancel">CAN</a></i>
</td>
<td title="End of Medium"><i><a href="/wiki/Medienende" class="mw-redirect" title="Medienende">EM</a></i>
</td>
<td title="Substitute"><i><a href="/wiki/Zeichenersetzung" class="mw-redirect" title="Zeichenersetzung">SUB</a></i>
</td>
<td title="Escape"><i><a href="/wiki/Escape_(Steuerzeichen)" title="Escape (Steuerzeichen)">ESC</a></i>
</td>
<td title="File Separator"><i><a href="/wiki/Datei-Separator" class="mw-redirect" title="Datei-Separator">FS</a></i>
</td>
<td title="Group Separator"><i>GS</i>
</td>
<td title="Record Separator"><i><a href="/wiki/Datensatz" title="Datensatz">RS</a></i>
</td>
<td title="Unit Separator"><i><a href="/wiki/Entit%C3%A4t_(Informatik)" title="Entität (Informatik)">US</a></i>
</td></tr>
<tr>
<th class="hintergrundfarbe6">2…
</th>
<td title="Leerzeichen"><i><a href="/wiki/Leerzeichen" title="Leerzeichen">SP</a></i>
</td>
<td title="Ausrufezeichen"><a href="/wiki/Ausrufezeichen" title="Ausrufezeichen">!</a>
</td>
<td title="Anführungszeichen"><a href="/wiki/Anf%C3%BChrungszeichen" title="Anführungszeichen">"</a>
</td>
<td title="Doppelkreuz"><a href="/wiki/Doppelkreuz_(Schriftzeichen)" title="Doppelkreuz (Schriftzeichen)">#</a>
</td>
<td title="Dollarzeichen"><a href="/wiki/Dollarzeichen" class="mw-redirect" title="Dollarzeichen">$</a>
</td>
<td title="Prozentzeichen"><a href="/wiki/Prozentzeichen" title="Prozentzeichen">%</a>
</td>
<td title="Et-Zeichen"><a href="/wiki/Et-Zeichen" title="Et-Zeichen">&amp;</a>
</td>
<td title="Apostroph"><a href="/wiki/Apostroph" title="Apostroph">'</a>
</td>
<td title="Klammer"><a href="/wiki/Klammer_(Zeichen)" title="Klammer (Zeichen)">(</a>
</td>
<td title="Klammer"><a href="/wiki/Klammer_(Zeichen)" title="Klammer (Zeichen)">)</a>
</td>
<td title="Sternchen"><a href="/wiki/Sternchen_(Schriftzeichen)" title="Sternchen (Schriftzeichen)">*</a>
</td>
<td title="Pluszeichen"><a href="/wiki/Pluszeichen" title="Pluszeichen">+</a>
</td>
<td title="Komma"><a href="/wiki/Komma" title="Komma">,</a>
</td>
<td title="Bindestrich-Minus"><a href="/wiki/Bindestrich-Minus" class="mw-redirect" title="Bindestrich-Minus">-</a>
</td>
<td title="Punkt"><a href="/wiki/Punkt_(Satzzeichen)" title="Punkt (Satzzeichen)">.</a>
</td>
<td title="Schrägstrich"><a href="/wiki/Schr%C3%A4gstrich" title="Schrägstrich">/</a>
</td></tr>
<tr>
<th class="hintergrundfarbe6">3…
</th>
<td title="Null"><a href="/wiki/Null" title="Null">0</a>
</td>
<td title="Eins"><a href="/wiki/Eins" title="Eins">1</a>
</td>
<td title="Zwei"><a href="/wiki/Zwei" title="Zwei">2</a>
</td>
<td title="Drei"><a href="/wiki/Drei" title="Drei">3</a>
</td>
<td title="Vier"><a href="/wiki/Vier" title="Vier">4</a>
</td>
<td title="Fünf"><a href="/wiki/F%C3%BCnf" title="Fünf">5</a>
</td>
<td title="Sechs"><a href="/wiki/Sechs" title="Sechs">6</a>
</td>
<td title="Sieben"><a href="/wiki/Sieben" title="Sieben">7</a>
</td>
<td title="Acht"><a href="/wiki/Acht" title="Acht">8</a>
</td>
<td title="Neun"><a href="/wiki/Neun" title="Neun">9</a>
</td>
<td title="Doppelpunkt"><a href="/wiki/Doppelpunkt" title="Doppelpunkt">:</a>
</td>
<td title="Semikolon"><a href="/wiki/Semikolon" title="Semikolon">;</a>
</td>
<td title="Kleiner als"><a href="/wiki/Vergleichszeichen" title="Vergleichszeichen">&lt;</a>
</td>
<td title="Gleichheitszeichen"><a href="/wiki/Gleichheitszeichen" title="Gleichheitszeichen">=</a>
</td>
<td title="Größer als"><a href="/wiki/Vergleichszeichen" title="Vergleichszeichen">&gt;</a>
</td>
<td title="Fragezeichen"><a href="/wiki/Fragezeichen" title="Fragezeichen">?</a>
</td></tr>
<tr>
<th class="hintergrundfarbe6">4…
</th>
<td title="At-Zeichen"><a href="/wiki/At-Zeichen" title="At-Zeichen">@</a>
</td>
<td title="A"><a href="/wiki/A" title="A">A</a>
</td>
<td title="B"><a href="/wiki/B" title="B">B</a>
</td>
<td title="C"><a href="/wiki/C" title="C">C</a>
</td>
<td title="D"><a href="/wiki/D" title="D">D</a>
</td>
<td title="E"><a href="/wiki/E" title="E">E</a>
</td>
<td title="F"><a href="/wiki/F" title="F">F</a>
</td>
<td title="G"><a href="/wiki/G" title="G">G</a>
</td>
<td title="H"><a href="/wiki/H" title="H">H</a>
</td>
<td title="I"><a href="/wiki/I" title="I">I</a>
</td>
<td title="J"><a href="/wiki/J" title="J">J</a>
</td>
<td title="K"><a href="/wiki/K" title="K">K</a>
</td>
<td title="L"><a href="/wiki/L" title="L">L</a>
</td>
<td title="M"><a href="/wiki/M" title="M">M</a>
</td>
<td title="N"><a href="/wiki/N" title="N">N</a>
</td>
<td title="O"><a href="/wiki/O" title="O">O</a>
</td></tr>
<tr>
<th class="hintergrundfarbe6">5…
</th>
<td title="P"><a href="/wiki/P" title="P">P</a>
</td>
<td title="Q"><a href="/wiki/Q" title="Q">Q</a>
</td>
<td title="R"><a href="/wiki/R" title="R">R</a>
</td>
<td title="S"><a href="/wiki/S" title="S">S</a>
</td>
<td title="T"><a href="/wiki/T" title="T">T</a>
</td>
<td title="U"><a href="/wiki/U" title="U">U</a>
</td>
<td title="V"><a href="/wiki/V" title="V">V</a>
</td>
<td title="W"><a href="/wiki/W" title="W">W</a>
</td>
<td title="X"><a href="/wiki/X" title="X">X</a>
</td>
<td title="Y"><a href="/wiki/Y" title="Y">Y</a>
</td>
<td title="Z"><a href="/wiki/Z" title="Z">Z</a>
</td>
<td title="Eckige Klammer"><a href="/wiki/Eckige_Klammer" class="mw-redirect" title="Eckige Klammer">[</a>
</td>
<td title="Umgekehrter Schrägstrich"><a href="/wiki/Umgekehrter_Schr%C3%A4gstrich" class="mw-redirect" title="Umgekehrter Schrägstrich">\</a>
</td>
<td title="Eckige Klammer"><a href="/wiki/Eckige_Klammer" class="mw-redirect" title="Eckige Klammer">]</a>
</td>
<td title="Zirkumflex"><a href="/wiki/Zirkumflex" title="Zirkumflex">^</a>
</td>
<td title="Unterstrich"><a href="/wiki/Unterstrich" title="Unterstrich">_</a>
</td></tr>
<tr>
<th class="hintergrundfarbe6">6…
</th>
<td title="Gravis"><a href="/wiki/Gravis_(Typografie)" title="Gravis (Typografie)">`</a>
</td>
<td title="a"><a href="/wiki/A" title="A">a</a>
</td>
<td title="b"><a href="/wiki/B" title="B">b</a>
</td>
<td title="c"><a href="/wiki/C" title="C">c</a>
</td>
<td title="d"><a href="/wiki/D" title="D">d</a>
</td>
<td title="e"><a href="/wiki/E" title="E">e</a>
</td>
<td title="f"><a href="/wiki/F" title="F">f</a>
</td>
<td title="g"><a href="/wiki/G" title="G">g</a>
</td>
<td title="h"><a href="/wiki/H" title="H">h</a>
</td>
<td title="i"><a href="/wiki/I" title="I">i</a>
</td>
<td title="j"><a href="/wiki/J" title="J">j</a>
</td>
<td title="k"><a href="/wiki/K" title="K">k</a>
</td>
<td title="l"><a href="/wiki/L" title="L">l</a>
</td>
<td title="m"><a href="/wiki/M" title="M">m</a>
</td>
<td title="n"><a href="/wiki/N" title="N">n</a>
</td>
<td title="o"><a href="/wiki/O" title="O">o</a>
</td></tr>
<tr>
<th class="hintergrundfarbe6">7…
</th>
<td title="p"><a href="/wiki/P" title="P">p</a>
</td>
<td title="q"><a href="/wiki/Q" title="Q">q</a>
</td>
<td title="r"><a href="/wiki/R" title="R">r</a>
</td>
<td title="s"><a href="/wiki/S" title="S">s</a>
</td>
<td title="t"><a href="/wiki/T" title="T">t</a>
</td>
<td title="u"><a href="/wiki/U" title="U">u</a>
</td>
<td title="v"><a href="/wiki/V" title="V">v</a>
</td>
<td title="w"><a href="/wiki/W" title="W">w</a>
</td>
<td title="x"><a href="/wiki/X" title="X">x</a>
</td>
<td title="y"><a href="/wiki/Y" title="Y">y</a>
</td>
<td title="z"><a href="/wiki/Z" title="Z">z</a>
</td>
<td title="Geschweifte Klammer"><a href="/wiki/Geschweifte_Klammer" class="mw-redirect" title="Geschweifte Klammer">{</a>
</td>
<td title="Senkrechter Strich"><a href="/wiki/Senkrechter_Strich" title="Senkrechter Strich">|</a>
</td>
<td title="Geschweifte Klammer"><a href="/wiki/Geschweifte_Klammer" class="mw-redirect" title="Geschweifte Klammer">}</a>
</td>
<td title="Tilde"><a href="/wiki/Tilde" title="Tilde">~</a>
</td>
<td title="DEL"><i><a href="/wiki/Delete" title="Delete">DEL</a></i>
</td></tr></tbody></table>



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

## Besonderheiten bei HTTPS

HTTPS (offizieller Name: HTTP Over TLS) hat zwischen TCP und HTTP noch TLS dazwischen. Das ermöglicht es zum einen dass die Daten verschlüsselt übertragen werden, jedoch kann man so nicht mehr ohne weiteres rein textbasierte Daten an einen HTTPS Server schicken. Man muss sich mit dem darunterliegenden TLS-Protokoll einen Schlüssel ausmachen mit dem alle weiteren Daten verschlüsselt werden. 

Eine TLS-Verbindung mit einem beliebigen Port kann man mit folgendem Befehl aufmachen:

```sh
openssl s_client -connect <someserver>:443
```

Nach dem Austausch der Zertifikaten und dem Schlüsselaufbau wartet das Programm auf rein textbasierte Eingaben. Gibt man nun `GET /` ein während man mit den Google-Servern verbunden ist bekommt man (über TLS) HTTP-Daten zurück.


Auf Ubuntu (bzw. Linux generell) kann man auch mit `sudo apt install ncat -y` einen Nachfolger von `nc` installieren welcher `TLS` unterstützt. 

Einen einfachen HTTPS/1.1 Request kann man dann ausführen mit: 
```sh
printf 'GET / HTTP/1.1\r\nHost: google.com\r\n\r\n' | ncat --ssl google.com 443
```


## Fragen

> Finde herraus wo du in deinem Browser dir anschauen kannst welche Requests an die HTTP-Server geschickt werden. Tipp: Es ist auch dort wo sich die Entwicklerkonsole befindet.

> Wofür stehen die Response Codes 200, 201, 400, 404, 500? 

> Welche Request-Methoden neben `GET` gibt es noch? Wie müsste man die Requestdatei umbauen um einen Post o.ä mit Daten abzusetzen?


> Wie sieht deine Textdatei aus die zu einem erfolgreichen Request geführt hat? Worauf musstest du achten? Gibt es Einstellungen die du noch weglassen kannst?

> Führe einen Request auf [http://httpbin.org](httpbin.org) aus. Wie müssen header und body aussehen damit du im body ein JSON mit einem POST-Request übertragen kannst? Wie sieht die Response aus? 

> Kann man HTTP über UDP ausführen?


<br><br>

**Jeder der mir diese Fragen am Ende der Stunden beantworten kann bekommt ein Plus.** Allerdings sind die Fragen auch unabhängig davon wichtig. Bei der nächsten PLF werden die Fragen sehr ähnlich zu den hier gestellten sein. 


Quellen:
> [Carriage Return](https://unix.stackexchange.com/a/398188)

> [HTTP RFC2616](https://www.rfc-editor.org/rfc/rfc2616)

> [HTTPS RFC2818](https://www.rfc-editor.org/rfc/rfc2818)


