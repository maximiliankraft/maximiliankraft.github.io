### remix-pwa
Progressive Web Apps (PWAs) sind Webanwendungen, die wie native Apps funktionieren. Sie bieten Offline-Funktionalität, schnelle Ladezeiten und können auf dem Startbildschirm eines Geräts installiert werden. In Remix kannst du PWAs erstellen, indem du Service Worker, Cache-API und andere Technologien nutzt.

### clientLoader / clientAction
In Remix werden `clientLoader` und `clientAction` verwendet, um Daten auf dem Client zu laden und Aktionen auszuführen. Diese Funktionen ermöglichen es, Daten vom Server zu holen und auf dem Client zu verarbeiten, was besonders wichtig für Offline-Funktionalität ist.

### service worker
Ein Service Worker ist ein Skript, das vom Browser im Hintergrund ausgeführt wird und Netzwerkanfragen abfangen kann. Er ermöglicht das Caching von Ressourcen und die Bereitstellung von Offline-Funktionalität. In Remix kannst du einen Service Worker registrieren, um deine Anwendung offline verfügbar zu machen.

### manifest
Das Web App Manifest ist eine JSON-Datei, die Metadaten über deine PWA enthält, wie Name, Icons und Start-URL. Es ermöglicht das Hinzufügen deiner Webanwendung zum Startbildschirm eines Geräts und sorgt für ein natives App-ähnliches Erlebnis.

### cache api
Die Cache API ermöglicht das Speichern von Netzwerkantworten im Cache, sodass sie später offline verwendet werden können. Du kannst die Cache API in deinem Service Worker verwenden, um Ressourcen wie HTML, CSS, JavaScript und Bilder zu cachen.

### fetch interceptor
Ein Fetch Interceptor ist ein Mechanismus, der Netzwerkanfragen abfängt und modifiziert. In einem Service Worker kannst du Fetch-Events abfangen, um Ressourcen aus dem Cache bereitzustellen oder alternative Inhalte anzuzeigen, wenn der Benutzer offline ist.

### Beispiel:

https://github.com/maximiliankraft/angular-pouchdb/