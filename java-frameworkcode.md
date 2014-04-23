Evolving a framework without breaking code
==========================================

Runtime Linking for modules

Webapp - various modules linked with various libraries
* Problems with different libraries, e.g. Commons IO
* Issues with dependency resolution with Maven

Jenkins - Core (Classes + 80 libraries) and Plugins

Core provides interfaces and plugins provide extensions

Each of the plugins refer to classes in the Core (e.g. project.getScheduleBuild())

Basic Techniques
================

Field Encapsulation
-------------------

Provides getters/setters for hiding direct field access.

Interfaces vs Abstract Classes
------------------------------

Want to add a new method:
* Interface - create an overloaded method, bit painful
* Abstract Class - deprecate the older method and add a new method, less painful

Trampoline Pattern - can evolve the old one by calling the new method instead with a default for example

Java 8 - can have default void methods:

Overweight Constructor - want to enable subtyping by plugins.  Git plugin is a good example:
* Just use setters
* Also use the builder pattern

Intermediate Techniques 
=======================

Mark things as @deprecated - but nobody pays attention to compiler warnings!!!

Roll your own access modifiers:
* Custom Access Modifier - six kinds of

      class NoInstantiation extends AccessRestriction {
        public void instantiated(loc, target, listener) {
          listener.onError(null, loc, target + " internal instantiation only");
        }
      }

* Mark classes as - @Restricted(NoInstantiation.class)
* Rejected by the Maven plugin whic scans class files and reports violations - fails build

Generics will fail to compile, but will work at runtime - due to type erasure

Reference resolution rule - giant string:
* Has to match all parts apart from the access modifiers and the throw clause

    invokevirtual org.example.Bar#method1(java.lang.String,int,int) boolean
    
BridgeMethodInjector

Shading/Package Renaming:
* maven shade plugin time
* transform classes and publish as separate artifacts

Using asm as a bytecode manipulator

    @AdaptField(name="value")
    protected Foo getValue() {}
    
Finds and replaces a class that references the field directly:

    this.value();
    
Annotation Processing - http://deors.wordpress.com/2011/10/08/annotation-processors/

invokeDynamic
-------------

Allows programmable linking at runtime in Java 7

http://no-more-tears.kohsuke.org/

Custom Classloading

Workarounds instead of hacks?

Other approaches:
* JBoss Modules
* OSGi

