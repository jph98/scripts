Intro and Tools
-------------

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
  
