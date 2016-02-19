Lua
===

##Resources
--------

* Lua Introduction - http://luatut.com/introduction.html
* From Ruby to Lua - http://c7.se/from-ruby-to-lua/
* Luje: JVM version of Lua - https://cowlark.com/luje/doc/stable/doc/index.wiki

Lua is compiled into bytecode then run on the Lua virtual machine.

##Uses

Games written in Lua - https://en.wikipedia.org/wiki/Category:Lua-scripted_video_games

###Loop

    for i=1,10 do
      print("Lupus")
    end

###Function

    function f(state, list) 
    end

###Tables and MetaTables

Simple list based structure

###Classes and Inheritance

None as such, but classes can be implemented using functions and putting data inside tables.

Inheritance can be implemented using the metatable mechanism.

