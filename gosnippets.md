#Go Snippets Cheat Sheet

* Go by example is great - https://gobyexample.com/
* Effective Go - http://golang.org/doc/effective_go.html

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
      
      var c *Coordinate = new(Coordinate)
      // or var c *Coordinate = Coordinate(3,4)
      c.x = 1
      c.y = 2

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
