Intro and Tools
===============

Resources
---------

* Cheatsheets - http://geek.starbean.net/?page_id=202
* Devops in the cloud - http://www.slideshare.net/aestasit/groovy-dev-ops-in-the-cloud
* Groovy JavaOne - http://www.slideshare.net/jimdriscoll/groovy-dsls-javaone-presentation
* Going to Mars - http://www.slideshare.net/glaforge/going-to-mars-with-groovy-domainspecific-languages

Tools
-----

* Grape - dependency management - http://groovy.codehaus.org/Grape
* 
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

