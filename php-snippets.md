PHP
===

* PHP Docs - http://www.php.net/manual/en/
* PHP Best Practices - http://www.phptherightway.com/
* PHP Certification - http://shop.zend.com/eu/zend-php5-certification-voucher.html
* Zend - PHP engine at the core, v1.0 PHP4, v2.0 PHP5
* PHP 5.3 - namespaces, late static binding, jump labels, closures, nowdoc, constants, ternary short
* PHP 5.4 - traits, new array syntax, performance and memory, built in web-server, some breaking changes
* PHP 5.5 - generators, finally, password hashing, empty(), opcache, php gd improvements
* Dynamic, weak typing
* PEAR - PHP Extension and Application Repository - http://pear.php.net/

Conferences
-----------

* PHP Conference - http://phpconference.co.uk/
* PHPNW14 - http://conference.phpnw.org.uk/phpnw14/

Frameworks and Libraries
------------------------

* Various web frameworks - CodeIgnitor, Laravel, CakePHP, Yii
* PHP REPL - http://phpepl.cloudcontrolled.com/
* PHP Package Archivist - https://packagist.org/* 
* PHAR - PHP Archives
* Composer - dependency management
* GTK bindings with PHP-GTK - http://gtk.php.net/
* Dispatch Micro Framework - http://noodlehaus.github.io/dispatch/
* ORM (idiorm)  - https://github.com/j4mie/idiorm/
* Underscore.PHP - http://brianhaveri.github.io/Underscore.php/
* Web Scraping (Goutte) - https://github.com/fabpot/Goutte
* DateTime (Carbon) - https://github.com/briannesbitt/Carbon
* Microbenchmarks - https://github.com/devster/ubench
* Filterus - https://github.com/ircmaxell/filterus
* Filesystam Abstraction (Gaufrette) - https://github.com/KnpLabs/Gaufrette
* File Uploads (Upload) - https://github.com/codeguy/Upload
* Shell Commands (ShellWrap) - https://github.com/MrRio/shellwrap
* Whoops (Exception Handling) - http://filp.github.io/whoops/
* PHP Parser turns some PHP into an abstract syntax tree - https://github.com/nikic/PHP-Parser
* Monolog proper logging - https://github.com/Seldaek/monolog
* Carbon DateTime - https://github.com/briannesbitt/Carbon
* PHPseclib (SSH, SFTP, RSA) - http://phpseclib.sourceforge.net/
* Stack Builder - https://github.com/stackphp/builder
* SwiftMailer - http://swiftmailer.org/
* BrowserKit simulates a browser - https://github.com/symfony/BrowserKit
* Patchwork handles UTF-8 - https://github.com/nicolas-grekas/Patchwork-UTF8

Working with PECL/PEAR
----------------------

PECL is generally for extensions coded in C, whilst PEAR deals with pure PHP modules.

n.b. In some cases you need to enable an extension in PHP.  For this you need the PHP source code with the extension.  You can run phpize to prepare the extension for compiling with configure and make.

n.b. You can also use Composer to declare what your project needs.

Install a package

        pear install PHPUnit

Listing packages

        pear list 
        
Listing remote packages (slow)

        pear remote-list

Discover a channel (to add more packages) with:

         sudo pear channel-discover pear.kotowicz.net
        
Infrastructure
--------------

Checking the version:

    php -v
    
Run a script:

    php -f util.php

Run as you type:

    php -r

Syntax check with:

    php -l
    
Look up docs with(n.b. double dash):

    php --rf
    
Starting the built in web-server:

    php -S localhost:4000 server.php

PHP Internals (Hackers Guide) - http://www.php.net/manual/en/internals2.php

Zend 1.0 - Core Engine
* Zend is the core engine itself 
* PHP can eb extended at the external modules, built-in modules and the Zend engine
* External modules extension is clean, but performance is slow, load modules via dl().  
* Built-in modules are compiled into PHP and carried around with the process.  Requires recompilation of PHP
* Dynamic and built in modules live in php-src/ext
* Zend ships prefdefine macros
* Zend functions (V_GETCWD) wrap regular C functions

Zend Framework - web application framework
* Version Used (old) - http://framework.zend.com/manual/1.11/en/manual.html
* Tutorial - http://akrabat.com/wp-content/uploads/Getting-Started-with-Zend-Framework.pdf

Overview of the php.ini file    

// or # can be used as a single line comment
/* as a multiline comment

Variables
---------

Global variables are created outside functions.

Can access from inside a function with the global keyword.

    global $name;
    
You can define a local variable as static so it's not deleted after the function complets

    static $name = "jon";

Number of types of variables:
* Strings
* Integers (Hex, Octal and Decimal)
* Floating Point Numbers
* Boolean
* Objects
* Arrays 

    $things = array("a", "b")

Can have null values for variables.

Set a constant with:

    define("DEFAULTNAME", "Jon");

Equality works with the following:

    === // Same value and type
    == // Same value
    <> // Not equal
    != // Not equal
    and // And
    or // Or

Superglobals
------------

Also have superglobals - always accessible from anywhere

    $GLOBALS
    $_SERVER // headers, paths and script locations, e.g. $_SERVER['SERVER_NAME']
    $_REQUEST
    $_POST
    $_GET
    
Strings
-------

To concatenate a string (weird) use .=

Helper function:

    strlen()
    strpos()

Conditionals and Loops
----------------------

    if () {
      // a
    } elseif () {
      // b
    } else {
      // c
    }

Also has switch statement.

while, dowhile, for and foreach

Arrays
------

Basic arrays

Also have associative arrays (which are like maps)

    echo count(array("Bob" => 30, "Jane" => 30));

Multidimensional arrays - http://www.w3schools.com/php/php_arrays_multi.asp

    sort(cars)
    rsort(cars)
    ksort(cars) // By key
    arsort(cards) // By value

Forms
-----

Regular expressions with

    preg_match("//", $name)



Output
------

echo and print statements output things.  Echo can be used to output multiple strings.

    echo "This", "is a $name";
    
Print outputs only one thing and returns true

    print $name

Objects
-------

Simple class can be created with:

    class Person {
        
        var $name;
        
        function Person($name="bob") {
          $this->name = $name;
        }
        
        function get_name() {
          return $this>name;
        }
    }
  
    
