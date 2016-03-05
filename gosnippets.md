#Go Snippets Cheat Sheet

TODO: Channel Buffering, Synchronization and Directions.

Go by example is great

    https://gobyexample.com/
    
Effective Go

    http://golang.org/doc/effective_go.html

Exercises: 

    https://github.com/cheeyeo/golang-exercises

Writing Web Applications

    http://golang.org/doc/articles/wiki/

###Language Overview

Packages are downloaded according to the GOPATH variable you have set up.  This consists of a pkg and src folder.

Install a package with:

    go get github.com/ant0ine/go-json-rest/rest
    go get github.com/zenazn/goji

Packages:

    https://golang.org/pkg/
    
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

###Conversion

See: 

    https://gobyexample.com/number-parsing

Integers to string:

    strconv.Itoa()
    
Strings to integers:

    strconv.Atoi()

Other parse methods exist as well:

    ParseInt
    ParseFloat

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
* Panic will be called
* Deferred functions are called
* Returned to caller

    defer func() {
        if r := recover(); r != nil {
            fmt.Println("Recovered in f", r)
        }
    }()


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

####Pointers

Passing by parameter doesn't change the actual value, it's a copy of the variable instead.

    https://gobyexample.com/pointers

You should pass a pointer with:

    example(iptr *name) {
        *iptr = 0
    }
    example(&name);

###Object Orientated Programming

See:

    http://nathany.com/good/

There are no classes.  Go is old school structs.

      type Coordinate struct {
        x, y int
      }
      
    https://gobyexample.com/structs
    
Instantiate one of these with:

    Coordinate{1, 2}

Structs are typed collections of fields that are mutable.  You can use a pointer to get to one.  They are automatically dereferenced.
      
You can add a method by passing a receiver:

        type coord struct {
        	x, y int
        }
        
        // Define a function and add it to the receiver c
        func (c *coord) pretty() (string) {
        	strcoord := strconv.Itoa(c.x) + "," + strconv.Itoa(c.y)
        	fmt.Printf("My pretty coordinate [%s]", strcoord);
        	return strcoord
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

    https://gobyexample.com/interfaces
    
Interfaces are named collections of methods declarations:

     type geometry interface {
        area() float64
        perim() float64
    }

We must define two functions for the receiver for these, otherwise we will get a compile error:

    type circle struct {
        radius float64
    }
    func (r rect) area() float64 {
        return r.width * r.height
    }
    func (r rect) perim() float64 {
        return 2*r.width + 2*r.height
    }


###Errors

    https://gobyexample.com/errors
    
Idiomatic to communicate errors via an explicit, separate return value

###Concurrency with Goroutines

    https://gobyexample.com/goroutines
    
* Goroutines are lightweight threads
* Channels provide a mechanism to communicate between goroutines, can be uni or bi directional

Simple example:

    go example("argument")

Example with an anonymous function call:

    package main
    import "fmt"
    
    func main() {
    
        go anonDefinedFunction(msg string) {
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

    file, _ := os.Open(filename)
    defer file.Close()
    reader := bufio.NewReader(file)
    scanner := bufio.NewScanner(reader)
    lineCount := 1
    for scanner.Scan() {
        if (lineCount == randomLineNumber) {
            return scanner.Text()
        }
        lineCount++
    }

## Miscellanous Cookbook Stuff

###Random numberNumber

    rand.Seed(time.Now().Unix())
    return rand.Intn(max - min) + min

###Web Service Calls

Example of making a web-service call to a URL then transforming JSON to a struct:

    sunrise_url := "http://api.sunrise-sunset.org/json"
    resource := sunrise_url + "?lat=" + latstr + "&lng=" + longstr + "&date=" + date 
    fmt.Printf("\tURL: \t\t%s\n", resource)
    res, err := http.Get(resource)
    defer res.Body.Close()
    var sunresults SunResults
    decoder := json.NewDecoder(res.Body)
    err = decoder.Decode(&sunresults)

### Microservices and Building Services

* MicroServices - https://github.com/harlow/go-micro-services
* Uber Engineering on Go - https://eng.uber.com/go-geofence/
