Tutorial - http://www.nodebeginner.org/#hello-world

NPM - http://howtonode.org/introduction-to-npm
* ls - list dependencies
* install - install dependencies

You need a package.json file to make a package

Libraries
---------

* RESTify - http://mcavage.me/node-restify/
* Option Parsing - https://github.com/substack/node-optimist


HTTP Server
-----------

    var http = require("http");

    http.createServer(function(request, response) {
      response.writeHead(200, {"Content-Type": "text/plain"});
      response.write("Hello World");
      response.end();
    }).listen(8888);

TCP Server
----------

Connect with curl localhost:8000

    var net = require('net');
    var port = 8000;
     
    net.createServer(
      function (stream) {
        stream.write('hello\r\n');
     
        stream.on('end',
          function () {
            stream.end('goodbye\r\n');
          }
        );
     
        stream.pipe(stream);
      }
    ).listen(port);
    
    console.log("Created TCP server on port " + port);
