Ractive
=======

Makes use of:
* Mustache for templating
* Includes Ractive.js 
* Script for doing the application of content to the template.

Properties (very basic) - {{ name }}

    var ractive = new Ractive({
      el: 'container',
      template: '#myTemplate',
      data: { greeting: 'Hello', recipient: 'world' }
    });

Nested Properties - http://learn.ractivejs.org/nested-properties/1/
