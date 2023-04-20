# Spring in Verbindung mit weiteren Services nutzen

Aktuell läuft unser Spring-Projekt komplett eigenständig. Das macht das Entwickeln leichter, während der Ausführung kann das aber zu Schwierigkeiten führen. 
Z.b löscht die H2-Datenbank alle Daten wenn sich das Programm beendet. Es gibt keine Backups der Daten und der Server kann nur lokal erreicht werden, zudem ohne TLS-Verschlüsselung.

Eure Aufgabe ist es zunächst von H2 auf eine "richtige" Datenbank, nämlich Postgres, umzusteigen. 

Dabei könnt ihr schon auf Docker zurückgreifen
- erstellt zunächst mit einem `Dockerfile` euren eigenen Container
- und schaltet den dann mit einem bestehenden Postgres Container in `compose` zusammen

Erstellt ein Protokoll darüber wie ihr vorgegangen seid. Ihr könnt alleine oder in 2er-Gruppen arbeiten. 

In dem Protokoll soll enthalten sein:
 - Eine Anleitung wie man das safeapi-Projekt auf postgres umstellt
 - Wie man die Postgres-Version in einen Container packt
 - Wie man den loaklen Container mit einem externen Postgres Container zusammenarbeiten lässt
 - Aufgekommene Probleme und Lösungsstrategien
 - Mit Quellenangaben zu den Lösungen bzw. verwendeten Anleitungen
