Intro
------

Console can be started with Scala, you can import a script defined using:

    :load script.scala

Scripts should be suffixed with .sh if they are to be run as scala scripts as follows:

    #!/bin/sh
    exec scala $0 $@
    !#
    println("Hello, " + args(0) + "!")

Alternatively you can create a Scala Application then compile and run it.  You have to define object/class here.

hello.scala

       object GreeterApp {
          def main(args: Array[String]) {
            println("Hello World")
          }
       }

compile with:
    scalac hello.scala

run with:
    scala hello

Types
------

* val - assigned once and never change
* var - standard variable
    
Console Output
------

Simples:

    println("Hello World")

Functions
------

You don't need to specify the parenthesis for the method

    def greet() = println("Hello World")
    
    def max(x: Int, y: Int) = if (x < y) println("y> " + y) else println("x> " + x)
    
Collections
------

Array

    val arr: Array[String] = new Array[String](3)

List has filter, forall, foreach, map

    num = List(1, 2, 3)
    num.filter(s => s.length == 4)

Also has init (all but last), head (first), drop (lose the first), dropRight (lose the last), tail (lose the first)

Tuple is as follows:

    num = (1,2,3)
  
HashSet has both immutable and mutable collections

    val jets = new HashSet[String]
    jets += "Airbus"
    
same with HashMap

    val boats = new HashMap[String, String]
    boats += "toy" -> "My first boat"
    val boats = Map("toy" -> "My first boat")

Loops
------

    args.foreach(arg => println(arg))
    for (arg <- args)
      println(args)
      
    for (i - 0 to 2)
    
Prefix and Suffix Concat

    :: - prepend
    ::: - append
    
Classes
------

There's a basic companion (Singleton) object which is defined as a module here:

    object Greeter {
      def greet(greeting: String) = "Greetings " + greeting
    }

and is called like a static method here in this class definition:

    class Boat {
      def getname() = "My First Boat"
      
      def other(msg: String) = {
        val greeting = Greeter.greet(msg)
        println(greeting)
      }
    }
    val b = new Boat()
    b.other("earthling")

Create an application (stand alone object) with:

    object BoatApp {
      def main(args: Array[String]) {
        val wg = new Greeter("bozo")
        wg.greet()
      }
    }
    
* Have to define the default constructor if there are multiple, the others become auxillary constructors
* There are no static methods/variables

Scripts NEED to end in a result otherwise you can't run them with scala
* Instead you need to compile them with scalac
* You can run the fsc program (fast scala compiler), this will create a daemon (that is slow to start at first) for compilation.

    fsc WApp.scala WGreeter.scala
    scala WApp
    
Traits
------

Traits can contain method definitions which can be extended and overridden:

    trait Animal {
      def greet() = "Hello"
    }
    
    class Dog extends Animal {
      override def greet() = "Aroo"
    }
    
You cannot instantiate a trait (since it's abstract), but you can do this:

    val d = new Dog()
    val a: Animal = new Dog()
  
You can also mixin behaviour at instantiation time allowing to override methods like injection and create a synthetic type which can be invoked:

      trait Woofer extends Animal {
        override def greet() = "Woof"
      }
      val a: Animal = new Dog with Woofer

