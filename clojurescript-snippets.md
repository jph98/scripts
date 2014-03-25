ClojureScript
=============

Dialect of Lisp, runs on the JVM.

Compiled down to Javascript using Closure compiler.

    (defn my-function [x,y]
      (let [xs (* x x) ys (* y y)
        (Math/sqrt (+ xs ys))
      )
    )
    
