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

Als Datenbank wird in dieser Tutorialreihe MongoDB verwendet. Da MongoDB einen eigenen Service zum laufen braucht und es auch kein relationales Datenbanksystem ist, bitte ich euch stattdessen SqLite (siehe [prisma.io/docs](https://www.prisma.io/docs/getting-started/quickstart)) zu verwenden. Auch andere Datenbanken die ohne Service auskommen wären in Ordnung. Du kannst auch eine Datenbank mit Serivce, wie Postgres (oder auch MongoDB) verwenden. Jedoch ist es wichtig dass die Datenbank bei dir lokal funktioniert und auch bei einem Deployment auf einem Server zuverlässig funktioniert. Wir werden uns alles selbst hosten. 


## Änderungen zu Punkt 4
Beim Hochladen von Profilbildern wird in der Tutorialreihe ein Amazon AWS S3 Bucket verwendet. Kann man verwenden, aber viel einfacher ist es, die Daten lokal zu speichern und bereitzustellen. Auch wird das als deprecated markierte Paket `cuid` verwendet. Es wird stattdessen empfohlen dass sicherere `@paralleldrive/cuid2` zu verwenden. Damit kann man ebenfalls zufällige Dateinamen erstellen. Nachdem S3 nicht verwendet werden soll muss man sich einen anderen Weg überlegen wie man die Bilder speichern kann. Hierbei kann es helfen einen Schritt zurück zu gehen und sich zu überlegen welche Technologien einem zur Verfügung stehen. Da wäre zum einen Remix, welches auf React basiert. Remix hat zwar Werkzeuge zum Dateiupload (siehe [remix.run/docs](https://remix.run/docs/en/main/guides/file-uploads)). Jedoch sind die noch nicht sehr ausgereift. Da React nur ein Komponentenbasiertes Framework ist und nur Clientseitig läuft, hat es keine Möglichkeit zum Upload von Bildern auf einen Server. Remix läuft mittels nodejs. Einer Laufzeitumgebung welche **serverseitig** Javascript Code ausführt. Hier kann man ansetzen um den Upload und das Speichern der Bilder vorzunehmen. und mittles des `fs` Pakets gibt es auch eine Möglichkeit dies direkt durchzuführen (siehe [nodejs.org/learn](https://nodejs.org/en/learn/manipulating-files/writing-files-with-nodejs)). In dem Tutorial wurde eine eigene Komponente erstellt zum Anzeigen und Hochladen des Profilbildes. 

Als vereinfachte Variante habe ich es mit einem File-Input umgesetzt. es würde sich aber zum Üben anbieten diesen File-Input in eine Komponente zu verfrachten. 

``html
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

## Grundlagen Typescript 

In dem Tutorial findet man oft folgenden Ausdruck:

```ts

interface FnProps{
    attr1: string;
    attr2: string;
}


const fn: (FnProps) => void = ({attr1, attr2}): void => {
    console.log(attr1, attr2)
}
```

Das ist eine kurze Schreibweise von:

```ts
const fn: (FnProps) => void = (props): void => {
    console.log(props.attr1, props.attr2)
}
```

Das nennt sich `Destructuring assignment`, mehr dazu findest du in der Dokumentation von Typescript [hier](https://www.typescriptlang.org/docs/handbook/variable-declarations.html#destructuring). Funktioniert mit Arrays auch z.B. Destructuring ist keine Typescript-Eigenschaft sondern von JavaScript. Man kann auch mehrere ineinander verschaltelte Objekte durch destructuring ansteuren, mehr dazu auf [MDN hier](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment#:~:text=Nested%20objects%20can%20also%20be%20unpacked).

Andere wichtige Bereiche aus der Dokumentation sind:
- [Type Annotations on Variables](https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#type-annotations-on-variables)
- [More on Functions](https://www.typescriptlang.org/docs/handbook/2/functions.html)
- [Object Types](https://www.typescriptlang.org/docs/handbook/2/objects.html)
- [Modules](https://www.typescriptlang.org/docs/handbook/2/modules.html)

Diese bitte alle durchlesen. 

### Grundlagen React

Zunächst ist es wichtig React zu installieren. Dazu gibt es [hier](https://react.dev/learn/start-a-new-react-project) eine Anleitung. Dort wird auch erklärt warum man React am besten mit einem anderen Framework wie Remix oder Next.js einsetzt. Mit dem Befehl `npx create-remix` kann man sich ein Projekt generieren lassen. Falls noch nicht installiert, benötigt man [nodejs](https://nodejs.org/en) dafür. 

> Damit mein System nicht mir zu vielen Programmen zugemüllt wird, entwickle ich gerne in [Dev-Containern](https://containers.dev/). Eine Vorlage für Javascript und Node gibt es [hier](https://github.com/devcontainers/templates/tree/main/src/javascript-node), Infos aus der Registry [hier](https://mcr.microsoft.com/en-us/product/devcontainers/javascript-node/about). 

Mein devcontainer.json:

```js
// For format details, see https://aka.ms/devcontainer.json. For config options, see the
// README at: https://github.com/devcontainers/templates/tree/main/src/javascript-node
{
	"name": "Node.js",
	// Or use a Dockerfile or Docker Compose file. More info: https://containers.dev/guide/dockerfile
	"image": "mcr.microsoft.com/devcontainers/javascript-node:1-22-bookworm",
	"forwardPorts": [
		5173, 	// vite
		5555 	// prisma studio
	],
	"privileged": true,
	"customizations": {
		"vscode": {
		  "extensions": [
			"bradlc.vscode-tailwindcss",		// tailwind suggestions
			"Prisma.prisma",					// prisma schema support
			"dbaeumer.vscode-eslint",			// esling
			"esbenp.prettier-vscode", 			// pretty print
			"formulahendry.auto-rename-tag",	// rename start and closing tag at the same time
			"graphql.vscode-graphql",			// graphql support
			"miguelsolorio.symbols",			// fancy symbols
		  ]
		}
	  },
	"remoteUser": "root"
}

```

Für die ersten Schritte mir React gibt es [hier](https://react.dev/learn/tutorial-tic-tac-toe) ein Tutorial in dem eine kleine Tic-Tac-Toe App erstellt wird. 

### Grundlagen Remix

Remix baut auf React auf. React kann aber nur lokal auf dem Rechner der Benutzer ausgeführt werden. Remix kümmert sich um alles was serverseitig passiert. Basierend auf dem Dateinamen z.B das Routing. Heißt eine Datei `home.profile.tsx` ist deren Komponente unter `/home/profile` aufrufbar. Ausnahem: Mit `_index.tsx` wird der oberste Pfad `/` beschrieben. In einer solchen TSX-Datei kann es 3 Funktionen geben. Eine Funktion die eine Komponente beschreibt:

```tsx
export function MyComponent(){

	return <div>
		<p>Welcome to my Component<p>
	</div>

}
```

Die Funktion `loader` wird auf dem Server ausgeführt bevor die Komponente ausgeliefert wird. Wichtig ist hier zu unterscheiden dass die Funktion `MyComponent()` auf dem Client ausgeführt wird. Man kann also nicht ohne weiteres eine Variable definieren die dann in beiden Funktionen verfügbar ist. Dazu müssen zusätzliche Daten vom Server zum Client übertragen werden. Das kann z.B so funktionieren: 

```tsx
export const loader: LoaderFunction = async (args: LoaderFunctionArgs) => {

	return json({"data". "server-generated data"})

}

export function MyComponent(){

	const {data} = useLoaderData();

	return <div>
		<p>Welcome to my Component<p>
		{data}
	</div>

}

```

Die dritte Funktion `action` ist dafür zuständig dass in die andere Richtung Daten vom Benutzer zum Server gesendet werden können. Natürlich kann man auch immer - wie in klassischen React Anwednungen - die fetch-API (siehe [MDN fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API)) verwenden. Der Name der Funktion leitet sich aus dem Attributsnamen action des `<form>`-Tags ab.

```tsx

export const action: ActionFunction = async (args: ActionFunctionArgs) => {
	const storyData = await args.request.formData();

	console.log(storyData)
	// returns (on the server)
	/*
		{
			"title": "<entered title>",
			"content": "<entered content>"
		}
	*/
}

export function MyComponent(){

	return <form method="POST">
		<input type="text" name="title" />
		<textarea name="content" ></textarea>
		<input type="Submit" />
	</form>

}

``` 
