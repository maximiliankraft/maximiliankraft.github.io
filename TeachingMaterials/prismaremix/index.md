---
layout: page
title: Webentwicklung mit Remix und Prisma
permalink: /prismaremix/index
menubar: false
nav_exclude: true
exclude: true
nav: false
---

Remix (siehe [remix.run](https://remix.run/)) ist ein komponentenbasiertes Webentwicklungs-Framework welches auf React (siehe [react.dev](https://react.dev/)) basiert. React ist das am meisten heruntergeladene Komponentenbasierte Framework auf npm (siehe [npm-stats.com](https://npm-stat.com/charts.html?package=react&package=angular&package=vue&from=2023-01-01&to=2024-06-30)). Damit lassen sich bereits viele Webseiten gestalten. Jedoch benötigt man für viele Webanwendungen auch einen Weg die Daten zu speichern. Dazu gibt es das ORM (Object Relational Mapper) Prisma (siehe [prisma.io](https://www.prisma.io/)).ORMs ermöglichen einem dass man Datenbanken ansteuert ohne SQL-Statements oder andere Datenbank-Spezifische Kommandos verwendet. Jeder Eintrag in der Datenbank wird zu einem Objekt im Programm. Sie mappen Objekte zu Relationalen Umgebungen, deswegen ORM. Damit kann man mit der Datenbank arbeiten wie wenn es eine gewöhnliche Sammlung von Objekten wäre. Viele ORMs (Prisma eingeschlossen) ermöglichen es auch mehrere Datenbanken zu verwenden. Man muss also wenn man die Datenbank wechselt nicht im Code an unzähligen Stellen SQL-Statements ändern. Das übernimmt das ORM im Hintergrund mit Datenbank-Treibern die die Prisma-Aufrufe in den jewiligen Datenbank-Aufruf transponieren. 

Von Prisma gibt es auch einen schönen mehrteiligen Blogartikel wie man Remix, React und Prisma gemeinsam verwendet: [https://www.prisma.io/blog/fullstack-remix-prisma-mongodb-1-7D0BfTXBmB6r](https://www.prisma.io/blog/fullstack-remix-prisma-mongodb-1-7D0BfTXBmB6r)

> Eine Einführung was Prisma ist gibt es [hier](https://www.prisma.io/docs/orm/overview/introduction/what-is-prisma)

Diesen fünfteiligen Blogartikel bitte ich euch durchzugehen. Jedoch ist der Artikel aus 2022, seit dem haben sich in Prisam und den anderen Technologien einige Kleinigkeiten geändert. Ich versuche hier alle aufzulisten die mir aufgefallen sind. Auch werden in dem Tutorial viele Proeritäre Cloud-Angebote verwendet. Ich habe weiter unten beschrieben welche offeneren Ansätze man stattdessen verwenden kann. Wenn der Code von deren Webseite mit den aktuellen Versionen nicht funktioniert, einfach in den Prisma Docs nachsehen wie es heute umgesetzt wird. Oder Lehrer oder eine KI fragen. 

## Änderungen zu Punkt 1

Als Datenbank wird in dieser Tutorialreihe MongoDB verwendet. Da MongoDB einen eigenen Service zum laufen braucht und es auch kein relationales Datenbanksystem ist, bitte ich euch stattdessen SqLite (siehe [prisma.io/docs](https://www.prisma.io/docs/getting-started/quickstart)) zu verwenden. Auch andere Datenbanken die ohne Service auskommen wären in Ordnung. Du kannst auch eine Datenbank mit Serivce, wie Postgres (oder auch MongoDB) verwenden. Jedoch ist es wichtig dass die Datenbank bei dir lokal funktioniert und auch bei einem Deployment auf einem Server zuverlässig funktioniert. Wir werden uns alles selbst hosten. 

Um zu gewährleisten dass alles funktioniert im Zweifel bitte nicht aus dem Tutorial alles 1:1 in eure Anwendung kopieren. Ein Beispiel ist z.B Tailwind CSS. 

In dem Tutorial wird folgende Dateistruktur abgebildet:

```
│── app
│   ├── entry.client.tsx
│   ├── entry.server.tsx
│   ├── root.tsx
│   └── routes
│       ├── README.md
│       └── index.tsx
├── node_modules
├── package-lock.json
├── package.json
├── public
├── remix.config.js
├── remix.env.d.ts
├── server.js
├── tsconfig.json
├── README.md
└── vercel.json
```


Im aktuellen Stand (2024) sieht diese aber so aus:

```
├── app
├── node_modules
├── package.json
├── package-lock.json
├── postcss.config.js
├── public
├── README.md
├── tailwind.config.ts // tailwind config bereits vorhanden
├── tsconfig.json
└── vite.config.ts
```

Achtet genau darauf welche Dinge es schon gibt und was sich geändert hat. So kann man z.B in der aktuellen Version (2024) die komplette Tailwind-Konfiguration weglassen. Diese ist mittlerweile im Start-Projekt bereits enthalten. Auch das `package.json` hat sich verändert. Früher wurde noch das Kommando `remix dev` genutzt um die Webanwendung zu starten. MIttlerweile wird in der `package.json` Konfiguration [vite](https://vitejs.dev/) verwendet. Das kommando lautet jetzt `remix vite:dev`. 

Für den Punkt `Set up prisma` gibt es für SQLite ein eignees Tutorial [hier](https://www.prisma.io/docs/getting-started/quickstart).

Im Punkt `Model the Data` muss man sich an den geänderten Datenbank-Treiber anpassen. Die Konfiguration

```ts
id String @id @default(auto()) @map("_id") @db.ObjectId
```

macht Sinn für MongoDb. Jedoch kann man diese nicht 1:1 mit SQLite verwenden. `@db.ObjectId` unterstützt dieser Treiber z.B nicht. Hier ein Verweis auf das vorher erwähnte Tutorial, wie es in SQLite gehen kann:

```ts
id    Int     @id @default(autoincrement())
```
> [Quelle: Prisma Quickstart SQLite](https://www.prisma.io/docs/getting-started/quickstart#2-model-your-data-in-the-prisma-schema)


## Änderungen zu Punkt 2

Das Benennungsschema für automatisches Routing wurde geändert. Um den Pfad `/new/post` zu routen musste man früher einen neuen Ordner `/new/` anlegen. Jetzt muss man die einzelnen Ordner durch einen Punkt trennen. Die Datei sieht dann so aus: `/new.post.tsx`. 


## Änderungen zu Punkt 4
Beim Hochladen von Profilbildern wird in der Tutorialreihe ein Amazon AWS S3 Bucket verwendet. Kann man verwenden, aber viel einfacher ist es, die Daten lokal zu speichern und bereitzustellen. Auch wird das als deprecated markierte Paket `cuid` verwendet. Es wird stattdessen empfohlen dass sicherere `@paralleldrive/cuid2` zu verwenden. Damit kann man ebenfalls zufällige Dateinamen erstellen. Nachdem S3 nicht verwendet werden soll muss man sich einen anderen Weg überlegen wie man die Bilder speichern kann. Hierbei kann es helfen einen Schritt zurück zu gehen und sich zu überlegen welche Technologien einem zur Verfügung stehen. Da wäre zum einen Remix, welches auf React basiert. Remix hat zwar Werkzeuge zum Dateiupload (siehe [remix.run/docs](https://remix.run/docs/en/main/guides/file-uploads)). Jedoch sind die noch nicht sehr ausgereift. Da React nur ein Komponentenbasiertes Framework ist und nur Clientseitig läuft, hat es keine Möglichkeit zum Upload von Bildern auf einen Server. Remix läuft mittels nodejs. Einer Laufzeitumgebung welche **serverseitig** Javascript Code ausführt. Hier kann man ansetzen um den Upload und das Speichern der Bilder vorzunehmen. und mittles des `fs` Pakets gibt es auch eine Möglichkeit dies direkt durchzuführen (siehe [nodejs.org/learn](https://nodejs.org/en/learn/manipulating-files/writing-files-with-nodejs)). In dem Tutorial wurde eine eigene Komponente erstellt zum Anzeigen und Hochladen des Profilbildes. 

Als vereinfachte Variante habe ich es mit einem File-Input umgesetzt. es würde sich aber zum Üben anbieten diesen File-Input in eine Komponente zu verfrachten. 

```html
<form method="POST" encType="multipart/form-data">
	<!-- firstName, lastName.... -->
	<input type="file" name="profilePicture" />
	<!-- submit -->
</form>
```

Das File-Objekt bekommt man aus dem Formular dann folgendermaßen:

```typescript
export const action: ActionFunction = async (args: ActionFunctionArgs) => {

    const formData = await args.request.formData();

    const profilePicture = formData.get("profilePicture"); 
	await uploadProfilePicture(profilePicture);
```

Ebenfalls serverseitig kann man das Profilbild dann auf dem Server mit folgender Funktion speichern:

```typescript

import fs from "fs"
import path from 'path';

// needs `npm i @paralleldrive/cuid2`
import { createId } from "@paralleldrive/cuid2";

/***
 * @returns path of the uploaded file, undefined if an invalid file got provided
 */
export async function uploadProfilePicture(file: File): Promise<string | undefined> {

	// check if a new file was uploaded
    if(file.size === 0 || file.name === ""){
        return undefined;
    }
    
    // go up two folders from the current script location
    const __dirname = path.dirname("~")
    
    // Define the directory where the file will be saved
    const uploadDir = path.join(__dirname, 'public', 'pps');

    // Ensure the directory exists
    if (!fs.existsSync(uploadDir)) {
        fs.mkdirSync(uploadDir, { recursive: true });
    }

    // Define the full path for the new file
	// todo choose file extension based on provided mime type
    const fileName = createId()+'.jpg'
    const filePath = path.join(uploadDir, fileName);

    try {
        // Convert the file to a Buffer
        const buffer = Buffer.from(await file.arrayBuffer());

        // Write the file to the specified path
        fs.writeFileSync(filePath, buffer);

        // Return the file path or URL as needed
        return fileName; // Or return a URL if serving via a web server
    } catch (error) {
        console.error('Error saving file:', error);
        throw new Error('Failed to upload profile picture');
    }
}
```

## Änderungen zu Punkt 5
Den 5. Punkt bezüglich Deployment lasst ihr bitte ganz weg. Vercel ist keine eigenständige Technologie, sondern ein Produkt. Es nimmt einem zwar viel ab, jedoch hat man auch weniger Kontrolle wie das eigene Deployment arbeitet. Wir werden stattdessen mit Azure arbeiten. Dort bekommt man als Schüler ein Kontingent von 100$ um auf deren Platform alle möglichen Ressourcen zu verwenden. 

Eine eigene Anleitung dazu findest du [hier](/TeachingMaterials/AzureAnleitungNode).

## Weitere Infos

> [Grundlagen Typescript](/prismaremix/typescript)
> [Grundlagen React](/prismaremix/react)
> [Grundlagen Remix](/prismaremix/remix)


