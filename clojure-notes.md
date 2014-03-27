Clojure
=======

http://www.infoq.com/presentations/Simple-Made-Easy

Read the joy of clojure

4Clojure - take a look at:
* https://www.4clojure.com/problem/22#prob-title

Projects
--------

* Om/web dev - http://zaiste.net/2014/02/web_applications_in_clojure_all_the_way_with_compojure_and_om/
* Quill - http://r4vi.tumblr.com/post/28482467571/berlin-hackntell-13-quill-a-processing-wrapper-in
* Overtone - http://overtone.github.io/
* Prismatic Schemas for Maps - https://github.com/prismatic/schema

Overview
--------

conj - adds an item to the front

List

    (:a :b :c)
    
Vector

    [1 2 3]
    
Set

    #(:b :c :d)
    
Maps

    {:a 10, :b 20, :c 30}


first, second, last, rest

Functions
---------

    (defn getthing [x] (+ x 2))
    
    (fn helloworld [n] (str "Hello, " n "!" ))
    
    str: s-expression

Specify a single argument:

    (+ % 5)
    
Map

    (map #(+ % 5) '(1 2 3))

Filter

    (filter #(> % 5) '(3 4 5 6 7)
    
Return last element of a list without using last:

    (fn [x] (first (reverse x)))
  
Second but last

    (fn dostuff [x] (last (butlast x)))
    
Checkout Lazy Sequences - fibonacci written with lazy cat.
