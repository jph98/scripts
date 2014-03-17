Ractive
=======

Makes use of:
* Mustache for templating
* Includes Ractive.js 
* Script for doing the application of content to the template.

Properties
----------

Properties (very basic) - {{ name }}

    var ractive = new Ractive({
      el: 'container',
      template: '#myTemplate',
      data: { greeting: 'Hello', recipient: 'world' }
    });

Nested Properties - http://learn.ractivejs.org/nested-properties/1/

Can use contexts to refer to propeties within a specific namespace, e.g:

    {{#country}}
        {{ name }}
    {{/country}}
    
refers to the nested object country.name.

Can also set the property in a nested manner:

    ractive.set( 'country.climate.rainfall', 'very high' );

Expressions
-----------

http://learn.ractivejs.org/expressions/1/

Events
------

Event delegation isn't used in ractive (where the listener is attaced ot the paretn adn the target is tested).

    ractive.on( activate: function() {} );
    ractive.on( {} ); // subscribe to multiple
    reactive.off(); // unsubscribe from all
    listener.cancel(); // cancel, must have a reference to it

Custom events can be used (e.g. tap).

Instead it reuses the event handler created for the proxy event.

Conditionals
------------

If - {{#notSignedIn}}
Not - {{^signedIn}}

Triple-stache
-------------

Insert content via triple {{{ }}}

Views
-----

Same sort of idea as Backbone.  Ractive.extend() provies the 

Two-way Data Binding
--------------------

Basic:

    var ractive = new Ractive({
      el: output,
      template: template
    });
    
    lazy: true // only happens on change/blur
    twoway: false; // disable completely
    
Can also use observe:

    ractive.observe( 'name', function ( newValue, oldValue ) {
      app.user.name = newValue; // or whatever
    });
    
