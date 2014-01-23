Introduction
------------

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

Debugging
---------

* Inspect Element
* Console

Testing web-services:
* Advanced REST Client - chrome extension 
* Postman - chrome extension
* Poster - firefox extension

Response From Web-Services
--------------------------

Better to return JSON rather than HTML really.

Manipulating the JSON - use Underscore templates

	<script type="x-underscore/template" id="employee-template">
	</script>

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
		details: function(){
	        console.log('Name: ' + this.name + '.')
	    }
	}

Javascript Game Programming
---------------------------

