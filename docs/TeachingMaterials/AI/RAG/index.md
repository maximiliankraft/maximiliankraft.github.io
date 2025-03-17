---
layout: page
title: RAG mit Langchain
menubar: false
nav_exclude: true
exclude: true
nav: false
---

# RAG mit Langchain

`RAG` steht für Retrieval-Augmented Generation. Es ist ein Ansatz, der die Leistungsfähigkeit von großen Sprachmodellen (LLMs) mit der Fähigkeit kombiniert, relevante Informationen aus externen Datenquellen abzurufen. Dies ermöglicht es dem Modell, präzisere und kontextuell relevantere Antworten zu generieren, indem es auf aktuelle und spezifische Informationen zugreift, anstatt sich nur auf das im Modell gespeicherte Wissen zu verlassen.

RAG wird häufig in Anwendungen eingesetzt, bei denen es wichtig ist, aktuelle und genaue Informationen zu liefern, wie z.B. in Frage-Antwort-Systemen, Chatbots und anderen NLP-Anwendungen.

> [RAG Tutorial von IBM](https://www.ibm.com/think/tutorials/agentic-rag)

## Schritt-für-Schritt-Anleitung zur Umsetzung von RAG mit Langchain

### Schritt 1: Installation der benötigten Bibliotheken

Stelle sicher, dass du die erforderlichen Bibliotheken installiert hast. Du kannst dies mit pip tun:

```bash
pip install langchain
pip install ollama
pip install faiss-cpu  # Für die Vektorsuche
```

### Schritt 2: Initialisierung des Sprachmodells

Importiere das Sprachmodell und initialisiere es:

```python
from langchain.llms import Ollama

llm = Ollama(model='deepseek-r1') # kann auch ein anderes Modell sein
```

### Schritt 3: Einrichten der Datenquelle

Bereite eine Datenquelle vor. Dies kann eine Datenbank, eine Dokumentation, Gesetzestexte etc. sein. 

### Schritt 4: Implementierung der Retrieval-Komponente

Verwende FAISS oder eine ähnliche Bibliothek, um eine Vektorsuche zu implementieren:

```python
from langchain.vectorstores import FAISS
from langchain.embeddings import OllamaEmbeddings

# Erstelle Embeddings für deine Daten
embeddings = OllamaEmbeddings(model='nomic-embed-text') # hat nur 300MB
vector_store = FAISS(embeddings)

# Füge deine Daten zur Vektorsuche hinzu
vector_store.add_texts(["Dein Text hier", "Noch ein Text"])
```

### Schritt 5: Kombination von Retrieval und Generation

Erstelle eine Pipeline, die die abgerufenen Informationen mit dem Sprachmodell kombiniert:

```python
from langchain.chains import RetrievalQA

qa_chain = RetrievalQA(llm=llm, retriever=vector_store.as_retriever())
```

### Schritt 6: Abfrage stellen

Stelle eine Abfrage und erhalte eine Antwort:

```python
frage = "Was ist RAG?"
antwort = qa_chain.run(frage)
print(antwort)
```

### Schritt 7: Integration und Testen

Integriere die RAG-Pipeline in deine Chatbot-Anwendung und teste sie gründlich, um sicherzustellen, dass sie wie erwartet funktioniert.

Gib auch aus welche Quellen dem Chatbot von der Vektordatenbank zur Verfügung gestellt wurden um nachverfolgen zu können wie er zu seinen Antworten kam. 