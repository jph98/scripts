Getting Started - http://www.braveclojure.com/getting-started/

    lein repl

Do Things - http://www.braveclojure.com/do-things/

* numbers, strings, map, vectors
* keywords - :keythingathing
* vector - [] as opposed to a seq ()

* if, do when - control flow
* true, false, nil
* or, and

def - bind a name to a vector with the following
* def(letters ["a", "b"])

All data structures are immutable:
* integer/float/ratio
* strings
* maps, can also be nested - {:first 1, :second: 2} and can lookup with (get <mapname> <key>) or (get-in <mapname> [key]) if nested
* can also create hash-map (:first 1, :second 2)

Lists cannot be indexed like vectors
* create a list literal with '(1 2 3)
* create a set literal with '#(1 3 4)
* conj - join

No classes - just functions.  Stick to basic data-structures.

Higher Order Functions - functions that take or return functions

Functions: 
* All subforms are evaluated before the +
* The map function (not data structure) applies a function to each member of the vector here - (map inc [0 1 2 3])

Function Calls, Macro Calls, and Special Forms
* Special Forms - don't always evaluate, can't pass as arguments
* function - defn(name, "Docstring", [a,b], (do something))
* number of parameters is the arity
