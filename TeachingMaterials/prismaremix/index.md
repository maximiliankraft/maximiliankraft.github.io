---
layout: page
title: Webentwicklung mit Remix und Prisma
permalink: /prismaremix/index
menubar: false
nav_exclude: true
exclude: true
nav: false
---

Remix (siehe [remix.run](https://remix.run/)) ist ein komponentenbasiertes Webentwicklungs-Framework welches auf React (siehe [react.dev](https://react.dev/)) basiert. React ist das am meisten heruntergeladene Komponentenbasierte Framework auf npm (siehe [npm-stats.com](https://npm-stat.com/charts.html?package=react&package=angular&package=vue&from=2023-01-01&to=2024-06-30)). Damit lassen sich bereits viele Webseiten gestalten. Jedoch benötigt man für viele Webanwendungen auch einen Weg die Daten zu speichern. Dazu gibt es das ORM (Object Relational Mapper) Prisma (siehe [prisma.io](https://www.prisma.io/)). 

Von Prisma gibt es auch einen schönen mehrteiligen Blogartikel wie man Remix, React und Prisma gemeinsam verwendet: [https://www.prisma.io/blog/fullstack-remix-prisma-mongodb-1-7D0BfTXBmB6r](https://www.prisma.io/blog/fullstack-remix-prisma-mongodb-1-7D0BfTXBmB6r)

> Eine Einführung was Prisma ist gibt es [hier](https://www.prisma.io/docs/orm/overview/introduction/what-is-prisma)

Diesen fünfteiligen Blogartikel bitte ich euch durchzugehen. Jedoch ist der Artikel aus 2022, seit dem haben sich in Prisam und den anderen Technologien einige Kleinigkeiten geändert. Ich versuche hier alle aufzulisten die mir aufgefallen sind. Wenn der Code von deren Webseite mit den aktuellen Versionen nicht funktioniert, einfach in den Prisma Docs nachsehen wie es heute umgesetzt wird. Oder Lehrer oder eine KI fragen. 

Als Datenbank wird in dieser Tutorialreihe MongoDB verwendet. Da MongoDB einen eigenen Service zum laufen braucht und es auch kein relationales Datenbanksystem ist, bitte ich euch stattdessen SqLte (siehe [prisma.io/docs](https://www.prisma.io/docs/getting-started/quickstart)) zu verwenden. Auch andere Datenbanken die ohne Service auskommen wären in Ordnung. Du kannst auch eine Datenbank wie Postgres (oder auch MongoDB) verwenden. Jedoch ist es wichtig dass die Datenbank bei dir lokal funktioniert und auch bei einem Deployment auf einem Server zuverlässig funktioniert. Wir werden uns alles selbst hosten. 

Den 5. Punkt bezüglich Deployment lasst ihr bitte ganz weg. Vercel ist keine eigenständige Technologie, sondern ein Produkt. Es nimmt einem zwar viel ab, jedoch hat man auch weniger Kontrolle wie das eigene Deployment arbeitet. Wir werden stattdessen mit Azure arbeiten. Dort bekommt man als Schüler ein Kontingent von 100$ um auf deren Platform alle möglichen Ressourcen zu verwenden. 

Eine eigene Anleitung dazu findest du [hier]().

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

Das nennt sich `Destructuring assignment`, mehr dazu findest du in der Dokumentation von Typescript [hier](https://www.typescriptlang.org/docs/handbook/variable-declarations.html#destructuring). Funktioniert mit Arrays auch z.B. 

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

```json
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
			"bradlc.vscode-tailwindcss", 	// tailwind suggestions
			"Prisma.prisma", 				// prisma schema support
			"dbaeumer.vscode-eslint", 		// esling
			"esbenp.prettier-vscode", 		// preety print
			"formulahendry.auto-rename-tag",// rename start and closing tag at the same time
			"graphql.vscode-graphql", 		// graphql support
			"miguelsolorio.symbols", 		// fancy symbols
		  ]
		}
	  },
	"remoteUser": "root"
}

```

Für die ersten Schritte mir React gibt es [hier](https://react.dev/learn/tutorial-tic-tac-toe) ein Tutorial in dem eine kleine Tic-Tac-Toe App erstellt wird. 

### Grundlagen Remix

