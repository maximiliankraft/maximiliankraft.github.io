---
layout: page
title: React Remix und Github OAuth
permalink: /prismaremix/githuboauth
menubar: false
nav_exclude: true
exclude: true
nav: false
---

## Aufgabe: "Login with GitHub" Button in einer Remix-Anwendung hinzufügen

In dieser Aufgabe lernst du, wie du in einer neu erstellten Remix-Anwendung einen "Login with GitHub"-Button hinzufügst. Folge den untenstehenden Schritten:

### 1. Neue Remix-Anwendung erstellen
Erstelle eine neue Remix-Anwendung mit folgendem Befehl:

```bash
npx create-remix@latest
```

Folge den Anweisungen im Terminal, um die Anwendung zu konfigurieren. Wähle z. B. `Remix App Server` als Deployment-Target.

### 2. GitHub OAuth-App einrichten
1. Gehe zu [GitHub Developer Settings](https://github.com/settings/developers).
2. Klicke auf "New OAuth App".
3. Fülle die Felder aus:
    - **Application name**: `Remix GitHub Login`
    - **Homepage URL**: `http://localhost:3000`
    - **Authorization callback URL**: `http://localhost:3000/auth/github/callback`
4. Speichere die App und notiere dir die **Client ID** und **Client Secret**.

### 3. Abhängigkeiten installieren
Installiere die benötigten Pakete:

```bash
npm install passport passport-github2 express-session
```

### 4. Middleware für GitHub OAuth hinzufügen
Erstelle eine Datei `auth.github.ts` im Ordner `routes` und füge folgenden Code hinzu:

```ts
import { Strategy as GitHubStrategy } from "passport-github2";
import passport from "passport";

passport.use(
  new GitHubStrategy(
     {
        clientID: process.env.GITHUB_CLIENT_ID!,
        clientSecret: process.env.GITHUB_CLIENT_SECRET!,
        callbackURL: "http://localhost:3000/auth/github/callback",
     },
     function (accessToken, refreshToken, profile, done) {
        return done(null, profile);
     }
  )
);

passport.serializeUser((user, done) => {
  done(null, user);
});

passport.deserializeUser((obj, done) => {
  done(null, obj);
});
```
### 5. Session-Handling einrichten
In Remix wird das Session-Handling über Loader und Actions in Kombination mit Session-Storage-Mechanismen wie Cookies oder Datenbanken implementiert. Hier ist ein Beispiel für die Einrichtung von Session-Handling mit Cookies:

#### a) Session-Storage einrichten
Erstelle eine Datei `session.server.ts` im Ordner `app` und füge folgenden Code hinzu:

```ts
import { createCookieSessionStorage } from "@remix-run/node";

export let sessionStorage = createCookieSessionStorage({
    cookie: {
        name: "__session",
        secrets: ["your-secret-key"],
        sameSite: "lax",
        path: "/",
        httpOnly: true,
        secure: process.env.NODE_ENV === "production",
    },
});

export let { getSession, commitSession, destroySession } = sessionStorage;
```

#### b) Session in Loaders und Actions verwenden
Du kannst die Session in deinen Loaders und Actions verwenden, um Benutzerdaten zu speichern oder abzurufen. Beispiel:

```ts
import { redirect } from "@remix-run/node";
import { getSession, commitSession } from "~/session.server";

export async function loader({ request }: { request: Request }) {
    let session = await getSession(request.headers.get("Cookie"));
    let user = session.get("user");

    if (!user) {
        return redirect("/login");
    }

    return { user };
}

export async function action({ request }: { request: Request }) {
    let session = await getSession(request.headers.get("Cookie"));
    session.set("user", { id: "123", name: "GitHub User" });

    return redirect("/", {
        headers: {
            "Set-Cookie": await commitSession(session),
        },
    });
}
```

#### c) Session in der Anwendung nutzen
In deinen Komponenten kannst du die Daten aus dem Loader verwenden, um den Benutzerstatus anzuzeigen oder zu verarbeiten.

```tsx
import { useLoaderData } from "@remix-run/react";

export default function Dashboard() {
    let { user } = useLoaderData();

    return (
        <div>
            <h1>Willkommen, {user.name}!</h1>
        </div>
    );
}
```

#### d) Login route implementieren

<!-- todo login route beschreiben -->

### 6. Routen für GitHub-Login erstellen
Erstelle in `routes/auth/github.tsx` folgende Routen:

```tsx
import { LoaderFunction } from "@remix-run/node";
import { redirect } from "@remix-run/node";
import passport from "~/auth/github";

export let loader: LoaderFunction = async ({ request }) => {
  return new Promise((resolve, reject) => {
     passport.authenticate("github", (err, user) => {
        if (err || !user) {
          return reject(redirect("/login"));
        }
        resolve(redirect("/"));
     })(request);
  });
};
```

### 7. "Login with GitHub"-Button hinzufügen
Füge in deiner `index.tsx` oder einer anderen Seite folgenden Button hinzu:

```tsx
export default function Index() {
  return (
     <div>
        <h1>Willkommen bei Remix!</h1>
        <a href="/auth/github">
          <button>Login with GitHub</button>
        </a>
     </div>
  );
}
```

### 8. Umgebungsvariablen konfigurieren
Erstelle eine `.env`-Datei und füge deine GitHub-Credentials hinzu:

```
GITHUB_CLIENT_ID=your-client-id
GITHUB_CLIENT_SECRET=your-client-secret
```

### 9. Anwendung starten
Starte die Anwendung mit:

```bash
npm run dev
```

Öffne [http://localhost:3000](http://localhost:3000) und teste den "Login with GitHub"-Button.

Viel Erfolg!