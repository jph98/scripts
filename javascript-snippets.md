Introduction
------------

* JSBooks - http://jsbooks.revolunet.com/
* Re-introduction to Javascript - https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript
* Airbnb Javascript Guide - https://github.com/airbnb/javascript
* Deferred Promises - http://blog.mediumequalsmessage.com/promise-deferred-objects-in-javascript-pt1-theory-and-semantics
* Eloquant Javascript - http://eloquentjavascript.net/print.html
* ThirdPartyJavascript - http://thirdpartyjs.com/
* Watch the Crockford lectures - http://yuiblog.com/crockford/
* Organizing Your Code - http://rmurphey.com/blog/2009/10/15/using-objects-to-organize-your-code/
* Testable Javascript:

    https://shanetomlinson.com/2013/testing-javascript-frontend-part-1-anti-patterns-and-fixes/
    https://shanetomlinson.com/2013/writing-testable-javascript-part-2-refactor-away-anti-patterns/

* Javascript Shells - https://developer.mozilla.org/en-US/docs/Web/JavaScript/Shells?redirectlocale=en-US&redirectslug=JavaScript%2FShells
* Node Beginner - http://www.nodebeginner.org/
* LimeJS Game - http://www.limejs.com/0-getting-started

* Interview - http://blog.sourcing.io/interview-questions
* Front End Developer Interview Questions - https://github.com/darcyclarke/Front-end-Developer-Interview-Questions

* Crockford Videos - http://yuiblog.com/crockford/

Debugging
---------

JSFiddle - http://jsfiddle.net/

* Inspect Element
* Console

Testing web-services:
* Advanced REST Client - chrome extension 
* Postman - chrome extension
* Poster - firefox extension

Minification
------------

	uglifyjs -o <input> <output>
	
Static Analysis
---------------

JSHint - http://www.jshint.com/docs/
* Make use of the airbnb guidelines for this
* Also there's a Sublime Text linter also

Response From Web-Services
--------------------------

Better to return JSON rather than HTML really.

Constructors
------------

Two ways of creating objects (there are no classes in Javascript - just prototypes).

Can create a simple object and assign properties with:

	var person = new Object();
	person.name = "Bob";
	person['age'] = 30;
	
The prototype is an in-built property of every object in Javascript accessed with:

	person.__proto__;

This is the same as above (n.b. this is set on Person not person):

	Person.prototype.name = "Bob";

1. Constructor style for defining an object (this is ALWAYS AN anonymous function):

 	// constructor version
	function Person(name) {
	    this.name = name;
	}
	
You can assign this as well (n.b. this is always set on Person, not person):

	var Person = function Person(name) {
	    this.name = name;
	}
	
then instantiating it with:

	person = new Person("Bob");

We can further add functions to this using the prototype as the basis for it:

	Person.prototype.getDecoratedName = function() {
	    return "-" + this.name + "-";
	};

2. Object literal style allows you to create singletons:

	var person = {
	    name: 'Jon', 
	    details: function() {
	        console.log('Name: ' + this.name + '.')
	    }
	}
	
3. Another way to create a singleton is to use the following:

	var person = new function() {
	    name: 'Jon', 
	    details: function() {
	        console.log('Name: ' + this.name + '.')
	    }	
	}
	
Scope
-----

Scope with Javascript can be in one of the following:

* Window/Tab Global Scope
* 

If we define a simple function:

	var say = function() {
		    return "Hello, I'm " + this.name;
	}
	
and call this with:

	say(); // will result in an error because it uses global scope(we don't have name there)

but if we call it within the context of a person object... we also need to assign a new property to the standalone say() function.

	var Person = function Person(name) {
		this.name = name;
	}
	
	person = new Person("Bob");
	
	person.doSomething = say;
	
	alert(person.doSomething());

n.b. Inspect a Javascript object with console.table();

Binding
-------

See: http://javascript.info/tutorial/binding

This is problematic because it refers to the wrong thing - i.e. not menu:

   function clicky(elem) {
      
     setTimeout(function() {
       alert(this);
     });
  }
  clicky();
  
  function clicky(elem) {
      
     setTimeout(function() {
       alert(this)  // object! (menu)
     }.bind(this)
  }
  clicky();


Functions
---------

Number of different function expressions:
* Anonymous - function() {}
* Named - function named() {}
* Immediately invoked - (function() {}());

Function arguments can be variadic, etc...

We can list all the arguments for a function in the following way:

	TODO
	
Javascript Prototypical Inheritance
-----------------------------------

Assign methods to the prototype object rather than overwrite the prototype with a new object (makes inheritance impossible).

Don't use:

	object.prototype = {};

Use this instead:

	object.prototype.method = function() {};
	
Use method chaining by returning this.

Call and Apply
--------------

Difference in terms of parameter passing

Javascript Game Programming
---------------------------

Templating
----------

Manipulating the JSON - use Underscore templates

	<script type="x-underscore/template" id="employee-template">
	</script>
	
Can use JQuery UI as well for templating.

Function Prototypes

Function expression and function declaration

Javascript context and this

Hoisting
--------

TODO

Loops
-----

	for (var i = 0; i < 10; i++) // for
	for (child in children(rows)) // for in

	for (var i = 0; i < rows.size(); i++) {
		console.log(rows[i]);
	}

Loop through the properties in the Javascript object.  Note, we filter out the internal properties with hasOwnProperty.

	for (var key in p) {
	  if (p.hasOwnProperty(key)) {
	    alert(key + " -> " + p[key]);
	  }
	}

You can also do the following instead of if/else:

	while(true) {
		case (y < 20)
	}
	
ECMAScript 5 also provides a .forEach() method

Equality
--------

Always use === and !==

Type Casting
------------

Perform type coercian at the beginning - '' + this.score

Naming
------

Use camel case

Events
------

When attaching data payloads to events, pass a hash instead of a raw value (for future extension)...

	$this().on('updated', function(e, data) {});

Delayed Actions
---------------

Call a function after a specified amount of time:

	setTimeout(function(){ 
	     assert( true, "Second test completed" ); 
	     resume(); 
	}, 100); 
	
Mixins
------

This can be approximated in Javascript by using extend to mix data and behaviour:

	var data = {
		name: "Jon";
	}
	
	var behaviour = {
		capitalise: function() {
			// so something with name
		}
	}
	
	extend(data, behaviour);

See - http://raganwald.com/2014/04/10/mixins-forwarding-delegation.html

Modules
-------

See:
* http://www.adequatelygood.com/JavaScript-Module-Pattern-In-Depth.html
* http://addyosmani.com/resources/essentialjsdesignpatterns/book/#modulepatternjavascript
* http://designpepper.com/blog/drips/understanding-the-module-pattern-in-javascript.html

Allows us to store private/public variables and state inside a closure:
* Variables within the closure are private (e.g. counter)
* Variables returned in the returning object are public (incrementCounter, resetCounter).

	var testModule = (function () {
 
	  var counter = 0;
	 
	  return {
	 
	    incrementCounter: function () {
	      return counter++;
	    },
	 
	    resetCounter: function () {
	      console.log( "counter value prior to reset: " + counter );
	      counter = 0;
	    }
	  };
	 
	})();

Always use strict.

JQuery Best Practices
=====================

http://gregfranko.com/jquery-best-practices/#/1

Deferreds/Promises. See - http://blog.mediumequalsmessage.com/promise-deferred-objects-in-javascript-pt1-theory-and-semantics

Cache your selectors in variables

DRY when processing events (.on)

Defer success in AJAX calls (don't inline it as part of the AJAX function call)

Design Patterns
===============

http://addyosmani.com/resources/essentialjsdesignpatterns/book
