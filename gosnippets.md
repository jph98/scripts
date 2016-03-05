#Go Snippets Cheat Sheet

Exercises: 

    https://github.com/cheeyeo/golang-exercises

* Go by example is great - https://gobyexample.com/
* Effective Go - http://golang.org/doc/effective_go.html
* Writing Web Applications - http://golang.org/doc/articles/wiki/

See: http://nathany.com/good/

###Language Overview

Packages are downloaded according to the GOPATH variable you have set up.  This consists of a pkg and src folder.

Install a package with:

    go get github.com/ant0ine/go-json-rest/rest
    go get github.com/zenazn/goji

Docs

    godoc -http=:8000
    
Compile

    go build helloworld.go
    
Running

    go run script.go

Docs

    godoc -http=:8000
    
Running as a script:  

    //usr/bin/env go run $0 $@; exit
     
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

###Variable Handing

###Variables and Types

    http://www.golang-book.com/books/intro/3

Normally:

     var x string = "Hello!
     var (x = 5; y = 6; z = 7)
     
Or shorthand:

     x := "Hello World""

Constant:

    const x string = "WORLD"

###Loops

There are only for loops in Go

    for i:= 0; i < 10; i++ { // do stuff }

or...

    for i, num := range nums { // do stuff }
  
###Functions

Write a function that takes two integers and returns two integers:

      func add(a, b int) (int, int) { return a, b }

You can also name the result:

    func f2() (r int) {}
    
Functions that can fail can also return a boolean to indicate success:

      if result, ok := functionThatCanFail(); ok {}
      
Functions can also be variadic

    func add(args ...int) int {
        for _, v := range args {}
    }
    
You can create closures within functions as follows:

    add := func(x, y int) int {
        return x + y
    }

You can also create a function that returns a generator function:

    return func() (ret uint) {
        ret = i
        i += 2
        return
    }

You can defer a function (so that it runs after something else completes:

    func main() {
        defer second()
        first()
    }    

###Error Handling

http://blog.golang.org/error-handling-and-go

Go has the concept of panic and recover:



###Data Structures

n.b. There's also a built in function called make which can be used to create the following data structures.

#####Arrays

    var a [5]int 

#####Slices

    letters := []string{"a", "b", "c", "d"}
    s.append("a")
  
#####Maps

Create with:

    var a [4]int

###Object Orientated Constructs

There are no classes.  Go is old school structs.

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

###Interfaces

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

* Goroutines are lightweight threads
* Channels provide a mechanism to communicate between goroutines, can be uni or bi directional

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

###Running OS Commands

Run with:

    cmd := exec.Command("dig", "any", "google.com")
    out, err := cmd.Output()

###Input/Output and the Command Line

Simple prompt:

    fmt.Print("Enter a number: ")
    var input float64
    fmt.Scanf("%f", &input)

Working with files:

