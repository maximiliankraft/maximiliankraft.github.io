---
layout: page
title: Übung - Multiple Sequence Alignment und Phylogenetischer Baum
permalink: /Assignments/5XBGM/MGIN/Uebung3
menubar: false
nav_exclude: true
exclude: true
nav: false
---

## Zielsetzung
In dieser Übung erweiterst du deine Django-Webseite um Funktionen für Multiple Sequence Alignment (MSA) und die Erstellung eines phylogenetischen Baums. Diese Funktionen werden als Microservices in einem separaten Container implementiert. Realistische Testdaten kannst du dir z.B von der [NCBI dbVar](https://www.ncbi.nlm.nih.gov/dbvar) holen. 

## Aufgabenstellung

### 1. Erweiterung der Django-Webseite
- Füge der bestehenden Django-Webseite ein neues Formular hinzu, das mehrere Sequenzen für das MSA akzeptiert.
- Implementiere eine neue View, die die eingegebenen Sequenzen an den MSA-Service sendet.

### 2. Implementierung des MSA- und Phylogenie-Services
- Erstelle einen neuen Docker-Container für den MSA- und Phylogenie-Service.
- Verwende Biopython zur Implementierung folgender Funktionen:
  a) [Multiple Sequence Alignment](https://biopython.org/docs/1.75/api/Bio.Align.html) 
  b) [Erstellung eines phylogenetischen Baums](https://biopython.org/wiki/Phylo)

### 3. Microservice-Architektur
- Implementiere eine API für den MSA- und Phylogenie-Service (z.B. mit Flask oder FastAPI).
- Definiere Endpunkte für:
  - MSA-Durchführung
  - Phylogenetische Baum-Erstellung

### 4. Integration und Kommunikation
- Implementiere die Kommunikation zwischen der Django-Webseite und dem MSA-Service.
- Verwende HTTP-Requests für den Datenaustausch.

### 5. Datenverarbeitung und Visualisierung
- Verarbeite die vom Service zurückgegebenen Daten in Django.
- Erstelle eine Ansicht zur Darstellung des MSA (z.B. mit einer JavaScript-Bibliothek wie MSAViewer).
- Visualisiere den phylogenetischen Baum (z.B. mit ETE Toolkit oder einer JavaScript-Bibliothek wie Phylotree.js).

### 6. Fehlerbehandlung und Validierung
- Implementiere eine Fehlerbehandlung sowohl im Django-Frontend als auch im MSA-Service.
- Validiere die Eingabesequenzen, bevor sie an den Service gesendet werden.

### 7. Container-Orchestrierung
- Erstelle ein Docker-Compose-File, das sowohl den Django-Container als auch den MSA-Service-Container beinhaltet.

## Detaillierte Aufgabenschritte

1. **Django-Erweiterung:**
   - Erstelle ein neues Modell `MultipleSequenceSubmission` in Django.
   - Implementiere ein Formular, das mehrere Sequenzen akzeptiert.
   - Erstelle eine neue View `submit_msa`, die die Sequenzen entgegennimmt und an den Service sendet.

2. **MSA- und Phylogenie-Service:**
   - Verwende Biopython's `Bio.Align.MultipleSeqAlignment` für das MSA.
   - Nutzen `Bio.Phylo` für die Erstellung des phylogenetischen Baums.
   - Beispielcode für MSA:
     ```python
     from Bio import AlignIO
     from Bio.Align.Applications import ClustalwCommandline
     
     def perform_msa(sequences):
         # Führen Sie hier das MSA durch
         # Rückgabe des Alignment-Objekts
     ```
   - Beispielcode für den phylogenetischen Baum:
     ```python
     from Bio import Phylo
     from Bio.Phylo.TreeConstruction import DistanceCalculator, DistanceTreeConstructor
     
     def create_phylogenetic_tree(alignment):
         # Erstellen Sie hier den phylogenetischen Baum
         # Rückgabe des Tree-Objekts
     ```

3. **API-Implementierung:**
   - Erstelle Endpunkte wie z.B `/api/msa` und `/api/phylo_tree`.
   - Beispiel mit Flask:
     ```python
     from flask import Flask, request, jsonify
     
     app = Flask(__name__)
     
     @app.route('/api/msa', methods=['POST'])
     def msa_endpoint():
         sequences = request.json['sequences']
         alignment = perform_msa(sequences)
         return jsonify({"alignment": str(alignment)})
     
     @app.route('/api/phylo_tree', methods=['POST'])
     def phylo_tree_endpoint():
         alignment = request.json['alignment']
         tree = create_phylogenetic_tree(alignment)
         return jsonify({"tree": tree.to_json()})
     ```

4. **Visualisierung:**
   - Verwende JavaScript-Bibliotheken zur Darstellung des MSA und des phylogenetischen Baums.
   - Beispiel für die Integration von [MSAViewer](https://msa.biojs.net/index.html):
     ```html
     <div id="msaDiv"></div>
     <script>
         var msa = require("msa");
         var opts = {
             el: document.getElementById("msaDiv"),
             vis: {
                 conserv: false,
                 overviewbox: false
             },
             seqs: // Hier die Sequenzdaten einfügen
         };
         var m = msa(opts);
         m.render();
     </script>
     ```

## Zusatzaufgaben (optional)
- Implementiere verschiedene MSA-Algorithmen (z.B. ClustalW, MUSCLE) und lasse den Benutzer wählen.
- Füge Optionen für verschiedene phylogenetische Baum-Konstruktionsmethoden hinzu.
- Implementiere eine Funktion zum Exportieren der Ergebnisse in gängige Formate (z.B. Newick für Bäume, FASTA für Alignments).

## Abgabe
- Stelle sicher, dass doe Docker-Container korrekt konfiguriert und lauffähig sind
- Dokumentiere die API-Endpunkte des MSA-Services.
- Protokolliere die Durchführung und die Ergebnisse
- Verwende folgende Protokollvorlage: [Protokoll Vorlage.docx](/TeachingMaterials/General/Protokoll%20Vorlage.docx)
