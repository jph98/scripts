PHP Internals
-------------

See:
* http://www.slideshare.net/jpauli/quick-tour-of-php-from-inside
* PHP Internals Book - http://www.phpinternalsbook.com/

PHP:
* is 800k lines of C code providing an interpreted language
* is dynamically compiled on-demand
* has an intermediate OPCode format that is produced by Zend when compiled
* Single thread, single process
* Automatic memory management and garbage collection
* Share nothing architecture
* C-PHP is the main implementation, but there are others including HipHop etc...
* PHPHP is a PHP VM written in PHP, nuts

Source Code - http://lxr.php.net/

First Level SAPI - Server API starts PHP and issues requests
* Various SAPI's including CLI, CGI, FPM etc...

Second Level PHP Core <-> Zend Engine (Zend/zend.c)

Third Level - Extensions

Zend provides the engine - lexer, compiler, opcode etc...
* Thread Safe TSRM Layer
* ext/standard - provides the core functionality written in C

Parts:
* Lexer - produces tokens (compile_file)
* Compiler - invoked by parser and generates opcode (looks like asm) - see Zend/zend_language_parser.y
* Execution - provides the virtual machine that executes the opcode.  Opcode calls a Zend VM handler.  Various dispatch modes.

PHP provides an OPCode cache for recently executed PHP code, called APC.

There are various PHP accelerators available as well.  Ramdisk is also mentioned.

Profiling
---------

There are a various ways to profile PHP:
* Xdebug
* XHPROF, also provides a simple web GUI - http://xhprof.io/, e.g. https://dev.anuary.com/8d50658e-f8e0-5832-9e82-6b9e8aa940ac/?xhprof[template]=hosts
* Write a Zend extension 
* Use microtime() function to measure function call time

You can also do low level analysis with Valgrind, kcachegrind etc...
* strace - do system call analysis for PHP to see what it does natively
* perf tool - useful, but complex

Memory
------

PHP provides ZendMM - a dynamic memory allocator
* Handles process heap, prevents faults
* Heap fragments (large, small) divided into segments (256K by default) divided into blocs 
* Bloc caching (zval)

ZendGC - separate to the memory manager
* Frees variables that are no longer used

There are two types of memory allocation done by Zend, which is very different to traditional C based memory allocation (malloc) including:
* Persistent - lasts longer than a single page request
* Non-persistent - bound to a single page request

Lifecycle Hooks
---------------

* MINIT - Module init
* RINIT - Request init

Modules
-------

Display all modules with: php -m 

Apache
------

* Forks a separate process (called httpd) as Apache to service PHP with various shared objects loaded

APC 
---

APC provides an opcode cache



