JQuery
######

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
