# ToDo Liste mit CSV persisitieren

Unter "persistieren" versteht man das dauerhafte Speichern von Daten. Aktuell ist es so dass wenn man die Seite mit der ToDo Liste neu lädt alle Daten verloren gegangen sind. Nicht sehr Sinnvoll wenn man eigentlich später daran erinnert werden möchte. 

Um das zu ändern kann man eine eigene Klasse schreiben welche einen Service startet der sich um das lesen und schreiben der Daten auf die Festplatte (in Dateien) kümmert. 

Im Beispielcode ist bereits ein Service enthalten. Der `WeatherForecastService`. Dieser generiert am Server zufällige Daten und sendet diese dann zum Client. 

## Schritt 1

Lege im Ordner `/Data` eine neue Klasse an mit dem Namen `CSVService`. Diese Klasse wird Daten laden, speichern, ändern und löschen können. Das UML Diagramm dafür könnte z.B so aussehen:

<!--

class TodoItem
{
    public int Id { get; set; }
    public string? Title { get; set; }
    public bool IsDone { get; set; }
}


class CSVService {
  - List<TodoItem> loadItems()
  - bool storeNewItem(TodoItem item)
  - bool deleteOneItem(int id)
  - bool updateOneItem(TodoItem item)
}

@enduml
-->

Lesen einer CSV-Datei kannst du von einer bestehenden Abgabe ableiten [hier](https://github.com/maximiliankraft/WienerLinienEchtzeitdaten/blob/main/WienerLinienEchtzeitdaten/Program.cs#L12). Zum schreiben von CSV-Dateien gibt es auf Stackoverflow schöne [Einträge](https://stackoverflow.com/a/18757340). Um Daten aus der CSV Datei zu ändern oder zu löschen kannst du die komplette CSV-Datei in eine Liste lesen die Änderung bei der entsprechenden Id anwenden und die neue Liste wieder in die CSV-Datei speichern.


