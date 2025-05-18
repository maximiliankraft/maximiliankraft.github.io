---
layout: page
title: Begleitende Aufgabe - Logging
menubar: false
nav_exclude: true
exclude: true
nav: false
---

Implementiere ein professionelles Logging-System für deine Anwendung, um Fehler und Nutzerverhalten zu überwachen. Folge dafür dieser Schritt-für-Schritt-Anleitung:

1. Erstelle eine Application Insights Ressource in Azure:
    - Gehe im Azure Portal zu deiner Ressourcengruppe
    - Klicke auf "Hinzufügen" und suche nach "Application Insights"
    - Wähle einen Namen (z.B. "meine-app-insights")
    - Weise sie derselben Ressourcengruppe zu, in der dein App Service läuft
    - Klicke auf "Überprüfen + erstellen" und dann auf "Erstellen"
    
2. Verbinde deinen App Service mit Application Insights:
    - Öffne deinen App Service im Azure Portal
    - Wähle im linken Menü unter "Einstellungen" die Option "Application Insights"
    - Klicke auf "Application Insights aktivieren"
    - Wähle die zuvor erstellte Application Insights-Ressource aus
    - Klicke auf "Übernehmen"

3. Installiere die notwendigen Pakete in deinem Projekt:
    ```bash
    # Für Node.js Anwendungen
    npm install @opentelemetry/api @opentelemetry/sdk-node @opentelemetry/auto-instrumentations-node @opentelemetry/exporter-trace-otlp-http
    ```

4. Erstelle eine Datei `instrumentation.js` im Hauptverzeichnis deines Projekts:
    ```javascript
    const { NodeSDK } = require('@opentelemetry/sdk-node');
    const { getNodeAutoInstrumentations } = require('@opentelemetry/auto-instrumentations-node');
    const { OTLPTraceExporter } = require('@opentelemetry/exporter-trace-otlp-http');
    
    const sdk = new NodeSDK({
      instrumentations: [getNodeAutoInstrumentations()],
      traceExporter: new OTLPTraceExporter({
         url: process.env.APPLICATIONINSIGHTS_CONNECTION_STRING,
      }),
    });
    
    sdk.start();
    ```

5. Implementiere manuelles Logging in deinem Code:
    ```javascript
    const { trace } = require('@opentelemetry/api');
    
    // Irgendwo in deinem Code, z.B. in einer Route-Handler-Funktion
    function handleUserRequest(req, res) {
      const tracer = trace.getTracer('user-operations');
      
      // Erstelle einen Span (Logging-Block) für diese Operation
      const span = tracer.startSpan('handle-user-request');
      
      // Füge wichtige Informationen hinzu
      span.setAttribute('user.id', req.user?.id || 'anonymous');
      span.setAttribute('request.path', req.path);
      
      try {
         // Deine normale Geschäftslogik
         const result = processUserData(req.body);
         
         // Logge erfolgreiche Ergebnisse
         span.addEvent('data_processed_successfully', {
            items_processed: result.length
         });
         
         res.json(result);
      } catch (error) {
         // Logge Fehler mit Details
         span.recordException(error);
         span.setStatus({ code: SpanStatusCode.ERROR });
         res.status(500).send('Internal Server Error');
      } finally {
         // Schließe den Span
         span.end();
      }
    }
    ```

6. Füge die Instrumentierung zu deiner App hinzu:
    - Für Node.js: Ändere deinen Startbefehl so, dass er zuerst die Instrumentierung lädt:
      ```
      node -r ./instrumentation.js app.js
      ```
    - Oder in package.json:
      ```json
      "scripts": {
         "start": "node -r ./instrumentation.js app.js"
      }
      ```

7. Teste dein Logging-System:
    - Starte deine Anwendung lokal oder deploye sie in Azure
    - Führe einige Operationen aus, die geloggt werden sollten
    - Öffne im Azure Portal deine Application Insights Ressource
    - Überprüfe unter "Überwachung" → "Anwendungsverfolgung" deine Logs

8. Erweitere dein Logging für mindestens drei wichtige Bereiche deiner Anwendung:
    - Benutzerauthentifizierung (Login/Logout-Versuche)
    - Kritische Geschäftsoperationen (z.B. Datenbankänderungen)
    - Fehlerbehandlung (mit detaillierten Informationen zur einfacheren Fehlersuche)

9. Erstelle ein benutzerdefiniertes Dashboard:
    - Gehe in Application Insights zu "Dashboards" → "Neu"
    - Füge relevante Metriken für deine Anwendung hinzu (z.B. Anfragerate, Fehlerrate)
    - Speichere dieses Dashboard für die zukünftige Überwachung

10. Dokumentiere in deinem Projektbericht:
     - Wie du Application Insights eingerichtet hast
     - Welche Arten von Ereignissen du loggst und warum
     - Ein Screenshot deines Dashboards mit realen Monitoring-Daten
     - Wie Logging bei der Fehlerbehebung helfen kann (mit einem konkreten Beispiel)

**Hinweise:**
- Achte darauf, keine sensiblen Daten (Passwörter, persönliche Informationen) zu loggen!
- Die Connection String für Application Insights findest du im Azure Portal unter deiner Application Insights Ressource → "Übersicht" → "Verbindungszeichenfolge"
- In Produktionsumgebungen sollten Log-Levels beachtet werden (DEBUG, INFO, WARN, ERROR)
