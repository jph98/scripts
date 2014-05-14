Writing PHP extensions
----------------------

* http://devzone.zend.com/303/extension-writing-part-i-introduction-to-php-and-zend/
* http://php.webtutor.pl/en/2011/07/07/how-to-create-php-extensions-in-c-part-i-adding-simple-function/

Collections in C
----------------

* http://ubuntuforums.org/showthread.php?t=1222055
* See glib - https://developer.gnome.org/glib/

PHP Extension Overview
----------------------

* Module init
* SAPI Layer to request page processing
* ZE - setup environment
* Call each extensions RINIT function
* Tokenize script, opcodes step through and execute
* RSHUTDOWN function called
* garbage collection occurs (unset each var)
* Module shutdown

Structure
---------

Create a new project under the ext folder with the following:
* config.m4 - config file used by phpize (prepares the PHP environment)
* php_hello.h - 
* hello.c - 

Double freeing memory is bad - causes segfaults

See - http://www.php.net/manual/en/install.pecl.phpize.php

To create the shared object run the following:

1. Run phpize to prepare the build environment
2. ./configure --enable-hello
3. make
4. cp hello.so <TARGET_PHP_EXTENSION> folder

Datatypes
---------

    zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "s", &name, &name_len) == FAILURE)

* Eight basic datatypes including a zval.  
* Datatypes also include RESOURCE, ARRAY and OBJECT
* All of the datatypes/variables are stored as zvals.
* zend_parse_parameters() has it's own types which need to be defined to be returned, e.g zend_bool or zval*.

A good example of implementing an extension like this is building a simplified version of vardump()

