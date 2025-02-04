---
layout: page
title: Grundlagen Typescript
permalink: /prismaremix/typescript
menubar: false
nav_exclude: true
exclude: true
nav: false
---
 

In Remix-Code (bzw. in Typescript allgemein) findet man oft folgenden Ausdruck:

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