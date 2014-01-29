#Go Snippets Cheat Sheet

* Go by example is great - https://gobyexample.com/
* Effective Go - http://golang.org/doc/effective_go.html
* Writing Web Applications - http://golang.org/doc/articles/wiki/

See: http://nathany.com/good/

###Language Overview

Packages are downloaded according to the GOPATH variable you have set up.  This consists of a pkg and src folder.

Install a package with:

    go get github.com/ant0ine/go-json-rest

###Simple Program

Note that most methods start with an uppercase letter

    package main
    import "fmt"
    
    func main() {
      fmt.Println("Hello World")
    }

Writing a simple webserver with http

    import ("fmt"
      "net/http"
    )
    
    func main() {
      http.HandleFunc("/",
            func(w http.ResponseWriter, req *http.Request) {
                fmt.Fprintln(w, "Hello World!")
            })
        if err := http.ListenAndServe(":8080", nil); err != nil {
            fmt.Println(err)
        }
    }

###Object Orientation makes use of Structs

      type Coordinate struct {
        x, y int
      }
      
which you can add a method to by using the pointer:

      func (c Coordinate) pretty {
        fmt.Println("My pretty coordinate " + x + " " + y);
      }

then construct with the folowing:
      
      var c *Coordinate = new(Coordinate)
      // or var c *Coordinate = Coordinate(3,4)
      c.x = 1
      c.y = 2
      
You can also pass pointers:

     cp = &p
     fmt.Println(cp)

#####Interfaces

Interfaces provide a simple way to group methods declarations:

     type Animal interface {
         Speak() string
     }

to be used in terms of composition:

     func (d Dog) Speak() string {
         return "Woof!"
     }

###Errors

There are no exceptions.  Explicit separate return value.

###Concurrency with Goroutines

    package main
    import "fmt"
    
    func main() {
    
        go func(msg string) {
            fmt.Println(msg)
        }("going, press enter to exit")
        
        var input string
        fmt.Scanln(&input)
        fmt.Println("done")
    }
    
#####Channels

Channels provide a way to connect concurrent goroutines into a pipeline

A good example of using channels and workers is to define a worker pool for processing jobs and outputting results

    https://gobyexample.com/worker-pools

###Variable Handing

###Loops

    for i:= 0; i < 10; i++ { // do stuff }

or...

    for i, num := range nums { // do stuff }

###Functions

Write a function that takes two integers and returns two integers:

      func add(a, b int) (int, int) {
        return a, b
      }

Functions that can fail can also return a boolean to indicate success:

      if result, ok := functionThatCanFail(); ok {
        // do something on success
      }
      
Functions can also be variadic
  
###Data Structures

#####Arrays

    var a [5]int 
    b := [5]int{1, 2, 3, 4, 5}


#####Slices

    s := make([]string, 3)
    s.append("a")
  
#####Maps

    mymap := make(map[string]int)
    mymap["key" = 1
