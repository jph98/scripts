# Intro and Manual

https://www.typescriptlang.org/docs/handbook/intro.html

1. Basics - https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html
2. Migrating from Javascript - https://www.typescriptlang.org/docs/handbook/migrating-from-javascript.html

## 1. Basics

* parameter: type;
* import foo = require("foo");
* Need to have declaration files available if your moving over from Javascript
* function overloads can be declared to indicate the different ways of calling a function
* object parameters need to be assigned as follows
* Don't use Object or {} to declare a flexible type, you should use 'any' instead

```
let options = {
    color: "red"
};
```

Exporting:

```
function foo() {}
export = foo;
```

## Classes and Interfaces 

Classes and interfaces can be defined as follows:

```
class Student {
    name: string;
    constructor(public name: string) {
        this.name = name;
    }
}

interface Person {
    name: string;
}```
