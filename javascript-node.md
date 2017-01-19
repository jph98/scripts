# Node Notes

* Can use ES6, Typescript to write apps
* Non-blocking commands
* Callback heavy
* Each incoming connection is a small heap allocation

npm commands:
* npm init
* npm i package --save

https://gist.github.com/martinheidegger/5554941

## Libraries

RESTful Libraries
* RESTify - http://mcavage.me/node-restify/
* Unirest - http://unirest.io/nodejs.html

Command Line
* Commander
* Option Parsing - https://github.com/substack/node-optimist

Webapp Framework:
* Express
* hapi.js

Process Management:
* pm2 

## Commonly Used Constructs

Not exclusive to Node at all, but commonly used constructs.

* const for initial module imports
* let/var difference in terms of scoping - let is scoped to the nearest block rather than function
* ES6 Arrow Function Expression

## RESTful Calls with Unirest

Example get request:

    unirest.get(url)
        .set('Accept', 'application/json')
        .set('Content-Type', 'application/json')
        .set('User-Agent', userAgent)
        .end(function (response) {
            console.log(response.body['response']);
        }

JSON display:

    JSON.stringify(baseResponse, null, 2)
    
## Networking

### HTTP Server

Create a simple HTTP server with:

    var http = require("http");

    http.createServer(function(request, response) {
      response.writeHead(200, {"Content-Type": "text/plain"});
      response.write("Hello World");
      response.end();
    }).listen(8888);

### TCP Server

Connect with curl localhost:8000 for the following TCP server:

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
