---
layout: page
title: Azure Anleitung ASP
permalink: /Assignments/2XHBGM/CSV
menubar: false
nav_exclude: true
exclude: true
nav: false
---

# ToDo Liste mit CSV persisitieren

Unter "persistieren" versteht man das dauerhafte Speichern von Daten. Aktuell ist es so dass wenn man die Seite mit der ToDo Liste neu lädt alle Daten verloren gegangen sind. Nicht sehr Sinnvoll wenn man eigentlich später daran erinnert werden möchte. Werden die Daten länger gespeichert kommen wir dem Funktionsumfang einer normalen Webseite immer näher. 

Um das zu ändern kann man eine eigene Klasse schreiben welche einen Service startet der sich um das lesen und schreiben der Daten auf die Festplatte (in Dateien) kümmert. 

Im Beispielcode ist bereits ein Service enthalten. Der `WeatherForecastService`. Dieser generiert am Server zufällige Daten und sendet diese dann zum Client. Auch die bisherige ToDo-App generierte (wenn auch nur temporär) eine Liste am Server. 

## Schritt 1: Service erstellen

Lege im Ordner `/Data` eine neue Klasse an mit dem Namen `CSVService`. Diese Klasse wird Daten laden, speichern, ändern und löschen können. Das UML Diagramm dafür könnte z.B so aussehen:

![](https://www.planttext.com/api/plantuml/svg/TO-n2eD038RtUugCTkWJjBI5kWZI3jhkwWK9d1UvY-qWldllB58HcY44lY_XZsfCvJsKh3aJxDIe85G_r8OQ82kGQHYXHJc0ZsrQSo-ER7k6aiJWVwrcDf3vbErMcfHItm3NubcWUr4JbB2xXvoy79TO9yYvqd7ooMx6yyr2sE4Dtn4aYmiKsafAqQ3WtU9inPT8h_2ZrzKFRuw4V1UqUkZC1m00)

<!--

class TodoItem
{
    public int Id { get; set; }
    public string? Title { get; set; }
    public bool IsDone { get; set; }
}


class CSVService {
  - List<TodoItem> LoadItems()
  - bool StoreNewItem(TodoItem item)
  - bool DeleteOneItem(int id)
  - bool UpdateOneItem(TodoItem item)
}

@enduml
-->

Lesen einer CSV-Datei kannst du von einer bestehenden Abgabe ableiten [hier](https://github.com/maximiliankraft/WienerLinienEchtzeitdaten/blob/main/WienerLinienEchtzeitdaten/Program.cs#L12).  Zum schreiben von CSV-Dateien gibt es auf StackOverflow schöne [Einträge](https://stackoverflow.com/a/18757340). Um Daten aus der CSV Datei zu ändern oder zu löschen kannst du die komplette CSV-Datei in eine Liste lesen die Änderung bei der entsprechenden Id anwenden und die neue Liste wieder in die CSV-Datei speichern.


## Schritt 2: Service zugänglich machen

Um den fertig programmierten Service verwenden zu können musst du in der Datei `Program.cs` ein Singelton hinzufügen mit `builder.Services.AddSingleton<servicename>();`. In deinem Fall lautet der Servicename wahrscheinlich CSVService. Wenn du die Klasse anders genannt hast musst du das entsprechend anpassen. 

## Schritt 3: Service in Razorpages aufrufen

In der `ToDo.razor` um den Singleton verwenden zu können musst du den Service injecten. Das geht mit `@inject servicename variablenname`. Im Code-Behind `@code{...}`. Kannst du dann mit z.B `variablenname.LoadItems()` auf den Service zugreifen. Die von `LoadItems()` zurückgegebene Liste kan dann verwendet werden um sie in einer foreach-Schleife wie in der vorherigen abgabe anzuzeigen. 

