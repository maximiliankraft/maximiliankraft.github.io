---
layout: page
title: Dev Container
permalink: /TeachingMaterials/DevContainers
menubar: false
nav_exclude: true
exclude: true
nav: false
---

Mit Dev-Containern kann man eine einheitliche Umgebung herstellen in der alle Programme, Umgebungsvariablen, Bibliotheken etc. installiert sind die man braucht um eine Software zu entwickeln. 

Damit mein PC nicht mit zu vielen Programmen zugemüllt wird, entwickle ich gerne in [Dev-Containern](https://containers.dev/). Eine Vorlage für Javascript und Node gibt es [hier](https://github.com/devcontainers/templates/tree/main/src/javascript-node), Infos aus der Registry [hier](https://mcr.microsoft.com/en-us/product/devcontainers/javascript-node/about). 

Mein devcontainer.json für nodejs:

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

Eine Allgemeine Anleitung gibt es [hier (code.visualstudio.com/docs)](https://code.visualstudio.com/docs/devcontainers/tutorial).