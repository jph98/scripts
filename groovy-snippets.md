Intro and Tools
===============

Cheatsheets:
* http://geek.starbean.net/?page_id=202

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

Language
========

Data Structures
---------------

Defining data structures:

Map

    def storage = [:]
    
List

    list = []
    
Looping
-------

    [2, 3, 5, 7, 11].each { 
        println it 
    }
    
    storage.each() { key, value -> 
        println "${key} == ${value}" 
    };
    
I/O
---

Read a file line by line:

    new File("test.txt").eachLine { 
        println it 
    }

