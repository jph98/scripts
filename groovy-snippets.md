Intro and Tools
===============

Resources
---------

* Cheatsheets - http://geek.starbean.net/?page_id=202
* Devops in the cloud - http://www.slideshare.net/aestasit/groovy-dev-ops-in-the-cloud
* Groovy JavaOne - http://www.slideshare.net/jimdriscoll/groovy-dsls-javaone-presentation
* Going to Mars - http://www.slideshare.net/glaforge/going-to-mars-with-groovy-domainspecific-languages

Libraries
---------

* Groovy Rules - http://www.slideshare.net/paulk_asert/groovy-rules
* Concurreny (GPars) - http://www.slideshare.net/paulk_asert/concurrency-gpars
* Popper (Junit Theories) - http://groovy.codehaus.org/Using+Popper+with+Groovy
* Instinct (BDD) - http://groovy.codehaus.org/Using+Instinct+with+Groovy
* Choco (Constraint Programming) - http://groovy.codehaus.org/Constraint+Programming
* 
Build Tools
-----------

* Grape - dependency management - http://groovy.codehaus.org/Grape
* Install gvm - Groovy Environment Manager (http://gvmtool.net/)

and use that to install Gradle, Grails etc...

* IDE - http://grails.org/products/ggts

Sample build.gradle

    apply plugin: 'java'

    repositories {
        mavenCentral()
    }
    
    dependencies {
        testCompile group: 'junit', name: 'junit', version: '4.+'
    }

REPL - groovysh  
Compile with:

    gradle build
    gradle tasks
    
http://www.gradle.org/docs/current/userguide/tutorial_using_tasks.html

Integration
-----------

http://groovy.codehaus.org/Embedding+Groovy

Integration occurs through a number of mechanisms:

* GroovyShell - use Binding to pass variables
* GroovyClassLoader - dynamic loading of scripts http://groovy.codehaus.org/api/groovy/lang/GroovyClassLoader.html
* GroovyScriptEngine - most complete solution
* Eval

Java 6 provides a JSR-233 implementation for script loading

Dynamic Language Scripts in Spring - http://groovy.codehaus.org/Dynamic+language+beans+in+Spring

Embedding a Groovy Console - http://groovy.codehaus.org/Embedding+a+Groovy+Console+in+a+Java+Server+Application

Bindings and Compiler Customisations
------------------------------------

* ImportCustomizer
* ASTTransformationCustomizer
* SecureASTCustomizer

Scripts
-------

Extending BaseScript (adding default methods) - http://jamesgdriscoll.wordpress.com/2012/04/22/adding-default-methods-with-a-groovy-basescript/
* Use Compilerconfiguration to set this

invokeMethod - allows for interception of a method call
* Can also implement GroovyInterceptable
* For property interception you can override getProperty() and setProperty()

Language
========

Data Structures
---------------

Defining data structures:

Map

    def storage = [:]
    
List

    list = []

Filtering
---------

Find all matching a predicate:

    [2, 3, 5, 7, 11].findAll { 
        it > 6 
    }
    
Perform a map operation:

    [2, 3, 5, 7].collect { 
        it+1 
    }
    
Join all elements together:

    [2, 3, 5, 7].join(" ")
    
Looping
-------

List:

    [2, 3, 5, 7, 11].each { 
        println it 
    }
    
Map:

    storage.each() { key, value -> 
        println "${key} == ${value}" 
    };
    
With an index:

    [2, 3, 5].eachWithIndex { p, i -> 
        println "$i: $p" 
    }
    
I/O
---

Read a file line by line:

    new File("test.txt").eachLine { 
        println it 
    }

Strings and Pattern Matching
----------------------------

~ - pattern
~= - find
==~

MarkupBuilder
-------------

MarkupBuilder provides a way to output XML/HTML:

        import groovy.xml.*

        def page = new MarkupBuilder()
        page.html {
        	head {title 'Hello'}
        	body {
        		ul {
        			for (count in 1..5) {
        				li "world $count"
        			}
        		}
        	}
        }

Closures
--------

See - http://groovy.codehaus.org/Closures

        def printsum = { a,b -> print a + b}

You can define a free variable (variable not listed in the parameter list) also with a closure:

        def amount = 5
        def incAmount = { num -> num + amount }
        incAmount(10)
        
Single argument, you can omit the parameter

        def incAmount = { num -> num + amount }

this, owner, delegate

        TODO 
        
Can define a method as having a closure as the last thing with:

        def clos = { it.toUpperCase() }
        list.collect( newlist, clos )

shorthand, this is much cleaner though, although implicit:

        list.collect( newlist ) {
            it.toUpperCase()
        }
        
Annotations
-----------

Processing annotations - http://groovy.codehaus.org/Annotations+with+Groovy

There are a number of ways of doing AST's as well with the following examples:

    @Immutable class Person {
        String firstname, surname
    }
    
    @Singleton
    @Lazy - mark a field so that any complex computation can be done as late as possible
    @Delegate - (awesome).  Specify that a object inherit methods from another class - @Delegate Date when
    @Newify - new way of constructing new objects
    @Category - specify an operation, then use @Mixin to include your categories
    @PackageScope - 
    
Category and Mixin Transformations
----------------------------------

http://groovy.codehaus.org/Category+and+Mixin+transformations
