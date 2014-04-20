D3 Overview
===========

https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript

Examples - http://chimera.labs.oreilly.com/books/1234000002001/ch01.html#_01_selecting_elements_html

Interactive Data Visualisation - http://chimera.labs.oreilly.com/books/1230000000345/index.html

D3 - http://d3js.org/

    d3.version
    
    d3.select("p")

Changing Styles
---------------

Chaining operations:

    d3.select("p").style("color", "purple")
    d3.select("p").style("font-size", "purple")
    d3.select("p").style("font-weight", "bold")

Adding attributes
-----------------

    d3.select("p").attr("class", "special")
    
    d3.select("p").style("color, "red").style("font-weight", "bold").style("font-family", "Helvetica")
    
    var p = d3.select("p")
    p.style("color", "salmon")

    var p = d3.select("body").append("p").text("New para")
    
SVG
---

* rect
* circle
* text
* line

Define the SVG canvas:

        var svg = body.append("svg").attr("width", 100).attr("height", 100)
        
Simple circle example:

         svg.append("circle")
				.attr("cx", 230)
				.attr("cy", 150)
				.attr("r", 10)
				.attr("fill", "black");

Remove things:

        svg.select("*").remove()
        svg.selectAll("*").remove()

Select by class:

        svg.select("#barchart")
        
Binding Data/Data Joins
-----------------------

        var dataset = [5,10,15,20,18];
        d3.select("svg").selectAll("circle").data(dataset).enter().append("circle")
        
More values than elements.  Empty placeholder selections.

    d3.selectAll("circle")
        .attr("r", function(d) {
            return d;
        });
        
Lets you reference values later and prevent need to redraw elements.  Data is bound to the elements.

Select All -> Data -> Enter -> Append

See :http://knowledgestockpile.blogspot.co.uk/2012/01/understanding-selectall-data-enter.html

SVG vs Canvas

SVG Crowbar - export SVG and styles into a file

Creating an object (reminder):

	var c = { animal: "cat", type: "mammal" }
	
Transitions
-----------

Just add the transition attribute BEFORE the action you need for it to gradually happen to the given target

	.transition().duration(2000)
	.attr("cy", function(d) {
		return d.y;
	}
	.attr("cx", function(d) {
		return d.x;
	}
	
Data and index value of the circle:

	function (d, i)
	
Axes
----

	var axis = d3.svg.avis().scale()scale);
	svg.append("g").call(axis);
	

	var xAxis = d3.svg.axis()
			  .scale(xscale)
			  .orient(bottom)
			  .ticks(5)
			  
element is like a div, arbritrary way to do content

	d3.select("input").click()...
