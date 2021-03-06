Laravel Overview
================

Makes use of the following:
* composer - for dependency management
* eloquent - for ORM Work
* blade - for templating

Tutorials
---------

Simple CMS:
* Source - https://github.com/bstrahija/l4-site-tutorial/tree/master/
* http://www.codeforest.net/laravel4-simple-website-with-backend-1
* http://www.codeforest.net/laravel-4-tutorial-part-2

Dependencies
------------

* sentry - user authentication/authz
* imagine - image manipulation - https://imagine.readthedocs.org/en/latest/

Configuration
-------------

See app/config.  

MySQL is used by default, but can be changed to sqlite in database.php.

Config - http://laravel.com/docs/configuration

Lifecycle
---------

See: http://laravel.com/docs/lifecycle

Providers - app/config/app.php

* An app enters through index.php
* bootstrap/start.php is processed - creates an Application object (IoC container)
* perform environment detection
* Service providers register() method is called for IoC object registration as a closure
* e.g. QueueServiceProvider
* app/start files loaded (See Start Files)
* app/routes.php loaded
* Request object is sent

Start Files:
* Used for bootstrapping code
* global.php - logger, filters etc..
* local.php - only called when app is operating in the local environment.  Can create others

Can declare application events (before, afterm finish and shutdown)

Serving an Application
----------------------

    php artisan serve

Database Migration
------------------

Using Senty:

    php artisan migrate --package=cartalyst/sentry
    
Creating a table

	php artisan migrate:make create_articles_table --table=articles --create
	
Running the migrations:

    php artisan migrate

Resetting the migrations:

    php artisan migrate:reset
		
Clearing out all migrations (shouldn't have to do this):

    composer dump-autoload

Seeding the database (provided you've created Seeder classes):

    php artisan db:seed
 
Routes
------

See: http://laravel.com/docs/routing

    Route::get('/', function() {});
    Route::post('/', function() {});
    Route::match(array('GET', 'POST'), '/', function() {});
    URL::to('foo');

Parameters:

    {id}
    
Filters
-------

Provide a way of restricting access to a route (so can be used for roles etc...)
    {name?}

Eloquent ORM
------------

http://laravel.com/docs/eloquent

Queuing
-------

Abstractions for many different providers - Amazon SQS, Redis, Beanstalkd etc...

http://laravel.com/docs/queues

IoC Containers
--------------

http://laravel.com/docs/ioc

Unit Testing
------------

http://laravel.com/docs/testing

