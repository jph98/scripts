# Intro

* Basics - https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html
* Migrating from Javascript - https://www.typescriptlang.org/docs/handbook/migrating-from-javascript.html

## Basics

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
