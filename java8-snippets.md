Overview and Articles
---------------------

* Features - http://ttux.net/post/java-8-new-features-release-performance-code/

Interfaces
----------

Default/Defender methods are optional methods on interfaces that don't have to be overriden

    default public void doSomeOtherWork(){
      System.out.println("DoSomeOtherWork implementation in the interface");
    }

Interfaces can also now have static methods within

New annotation called @FunctionalInterface - defines exactly one abstract method

Method Calls
------------

Can call a static method with the following:

    Utils::compareByLength

Lambdas
-------

Lambda Expressions - http://docs.oracle.com/javase/tutorial/java/javaOO/lambdaexpressions.html

Simple example:

    btn.setOnAction(
      event -> System.out.println("Hello World!")
    ); 

Collections
-----------

There's now a parallelSort in the Array class that makes use of fork join.

Filter/map/reduce functionality with:

    List<Person> anyMatch = people.stream().filter(p -> (
    
      names.stream().anyMatch(p.name::contains))
      
    ).collect(Collectors.toList()); 
    
Date and Times
--------------

* Clock
* ZoneId
* LocalDate
* Period

