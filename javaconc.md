Java Concurrency Notes
----------------------

* Future - a promise effectively, interface
* FutureTask - implementation of the Future interface with a cancel and start

ExecutorService
* submit (returns a future) will bind the exception to the future
* execute (void) will invoke the uncaughtexceptionhandler in the case of an exception
* invokeall - takes a timeout for the tasks

CopyOnWriteArrayList

Commons Lang
------------

CircularFifoBuffer - first in first out buffer, fixed size where oldest element is replaced once full

Guava
-----

Overview here - http://guava-libraries.googlecode.com/files/guava-concurrent-slides.pdf

* HashMultiSet - no test to check if element present, just add
* MapMaker - for building concurrent maps and caches

* ListenableFuture - ability to add callbacks that complete after the task
* inparallel - lack of and what to do for now
* Future.transform
* Future.chain
* UncaughtExceptionHandlers.systemExit
* MoreExecutors.sameThreadExecutor
* MoreExecutors.getExitingExecutorService
* ThreadFactoryBuilder

* Service
* AbstractExecutionThreadService
* AbstractIdleService
* AbstractService
