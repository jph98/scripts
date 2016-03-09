Pony Language
=============

http://tutorial.ponylang.org/

Classes
-------

http://tutorial.ponylang.org/types/classes/

Underscore indicates private.  
Everything has to be set in the constructor

    class Wombat
      let name: String
      var _hunger_level: U64
      
      new create(name': String) =>
        name = name'
        _hunger_level = 0

Functions
---------

Functions have default arguments
You specify ref to mean reference/receiver

    fun hunger(): U64 => _hunger_level
    fun ref set_hunger(to: U64 = 0): U64 => _hunger_level = to 

Actors
------

Traits and Interfaces
---------------------

