ClojureScript
=============

Useful Exercise Sites
---------------------

4clojure.com

Overview
--------

Dialect of Lisp, runs on the JVM.

Web based REPL - http://clojurescript.net/

Compiled down to Javascript using Closure compiler.

    (defn my-function [x,y]
      (let [xs (* x x) ys (* y y)
        (Math/sqrt (+ xs ys))
      )
    )

compiles down to this in Javascript:

    var my-function = function(x, y) {
        var xs = x * x;
        var ys = y * y;
        return sqrt(xs + ys);
    }
    
prefix notation
[] - vector
() - list

Functions:
* Standard (defn add[x,y])
* Anonymous (fn [x])

Call the latter with - ((fn [x]), 3)

Constant:

    (def gravity 8.1)

Let works inside a function.

Lists, vectors and hashmaps.

Don't recall have loops, have to use recursion instead.  Doesn't have tail first recursion.  

    recur

map, reduce, filter functions.

Macros
------

Can add new features to your language effectively.

Building Games
--------------

* https://github.com/cblop/live-cljs
* http://bristolclojure.herokuapp.com

Entity/Component/System:
* Composition instead of inheritance
* Each game object is a bunch of components

ClojureScript game/engine - git@github.com:alexkehayias/chocolatier.git
* Runs a game engine called pixie.js

* Entity - unique id and list of component
* Component - describes behaviour
* System - draw/update loop that runs on every entity (one for collision detection, drawing etc...)

