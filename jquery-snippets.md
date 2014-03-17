JQuery
======

* JQuery Learning Centre - https://learn.jquery.com/
* Selectors Lab - http://codylindley.com/jqueryselectors/

* JQote Templating - http://aefxx.com/jquery-plugins/jqote/
* 
Best Practices
--------------

* Specificity with selectors
* Don't overuse selectors, use a variable and reuse

Constructs
----------

ready():
* $( document ).ready(function() {}
* .noConflict()

attr()
* Return the attributes or set the attributes on an element

delegate
* https://api.jquery.com/delegate/
* jQuery 1.7, .delegate() has been superseded by the .on()

extend
* http://api.jquery.com/jquery.extend/
* Merge the contents of two objects together

addClass/RemoveClass

Get and set HTML for a given element:

    element.html()
    element.html("blah")
    
Adding multiple elements using a variety of element type, class and id.

    $('code, #myid, .myclass')
    
Create an element and append:

    var $new = $( "<p>New element</p>" );
    $new.appendTo( "#content" );

Modifying elements:

    .appendTo()
    .detach()

Find siblings for an element

    .siblings()
    
Snippets
--------

Selecting an element based on the value of a specific attribute

    input[value='text input']
    
You can also select based on other equality:

    input[value!='text'] 
    input[value^='text'] // starts with
    
Select all text fields in a given form:

    $( "form :text" );

Select all headers and replace all questions marks (using regex rather than replace) with a !

    $("h1,h2,h3,h4,h5,h6").each(function() {
      	var htmltext = $(this).html();
    		htmltext = htmltext.replace(/\?/g, '\!');
    		$(this).html(htmltext);
    });
  
Display a tag name, when debugging 

    $(*).each(function() {
      console.log(this.tagName)
    }

