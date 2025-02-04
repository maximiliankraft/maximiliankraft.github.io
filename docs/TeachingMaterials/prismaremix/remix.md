---
layout: page
title: Grundlagen Remix
permalink: /prismaremix/remix
menubar: false
nav_exclude: true
exclude: true
nav: false
---

Remix baut auf React auf. React kann aber nur lokal auf dem Browser der Benutzer ausgeführt werden. Remix kümmert sich zusätzlich um alles was serverseitig passiert. Basierend auf dem Dateinamen z.B das Routing. Heißt eine Datei `home.profile.tsx` ist deren Komponente unter `/home/profile` aufrufbar. Ausnahme: Mit `_index.tsx` wird der oberste Pfad `/` beschrieben. In einer solchen TSX-Datei kann es 3 Funktionen geben. Eine Funktion die eine Komponente beschreibt:

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
