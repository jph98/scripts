JQuery
======

* JQuery Learning Centre - https://learn.jquery.com/
* Selectors Lab - http://codylindley.com/jqueryselectors/
* JQote Templating - http://aefxx.com/jquery-plugins/jqote/

bind vs live vs delegate vs on - http://www.elijahmanor.com/differences-between-jquery-bind-vs-live-vs-delegate-vs-on/
* bind - attached to every anchor (for example), wasteful and performance intensive.  Avoid.
* live - attached to the ROOT level document, event is bubbled up from the children.  Performance hit in terms of the event bubbling (especially if there's a deep hierarchy).  Deprecated as of 1.7
* delegate - same as live, but you choose where this is anchored
* on - 1.7 preferred method that makes use of the above.

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

You can loop through the elements for a selector with each.  You can refer to the current element in the loop with $this().

    $("input").each(function() {
        console.log($this());
    });

Deferred, Promise and When
--------------------------

Main problem solved - AJAX request/XMLHttpRequest only supports one callback.

See:
* http://www.bitstorm.org/weblog/2012-1/Deferred_and_promise_in_jQuery.html
* http://css-tricks.com/multiple-simultaneous-ajax-requests-one-callback-jquery/

Promises are a little different in the way you call them, you can also call done and fail multiple times:

    var promise = $.ajax({
      url: "/myServerScript"
    });
     
    promise.done(myFunction);
    promise.done(otherFunction);
    promise.fail(myErrorFunction)
    
* You can combine them also so syncrhonise a callback.  
* Can also chain them one after the other

Promises are returned from async calls.

You need a deferred when you write such a function yourself.

TODO: Deferred.
    
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

Select all rows (with a checkbox), then find all SIBLINGS in that row and display their name (via attr):

    $("input:checkbox.itemcheckbox").each(function() {
        $(this).parent().siblings("input:hidden").each(function() {
            console.log("Name " + $(this).attr("name"));
        });
    });
