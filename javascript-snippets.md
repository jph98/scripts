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

Response From Web-Services
--------------------------

Better to return JSON rather than HTML really.

Constructors
------------

Two ways of creating objects:

Constructor style for creating objects

 	// constructor version
	function Person(name) {
		this.name = name;
	}

Object literal style for creating objects

	var person = {
	    name: 'Jon', 
	    details: function() {
	        console.log('Name: ' + this.name + '.')
	    }
	}

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

Functions
---------

Number of different function expressions:
* Anonymous - function() {}
* Named - function named() {}
* Immediately invoked - (function() {}());

Hoisting
--------

TODO

Loops
-----

	for (var i = 0; i < 10; i++) // for
	for (child in children(rows)) // for in

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
	
Modules
-------

See: http://www.adequatelygood.com/JavaScript-Module-Pattern-In-Depth.html

Always use strict.

JQuery Best Practices
=====================

http://gregfranko.com/jquery-best-practices/#/1

Deferreds/Promises. See - http://blog.mediumequalsmessage.com/promise-deferred-objects-in-javascript-pt1-theory-and-semantics

Cache your selectors in variables

DRY when processing events (.on)

Defer success in AJAX calls (don't inline it as part of the AJAX function call)

