Java VM Info
============

JVM Internals
-------------

http://blog.jamesdbloom.com/JVMInternals.html
Garbage Collection
------------------

Types of garbage collection:
* Throughput GC
* Concurrent Mark and Sweep GC 
* Incremental low pause GC
* G1 GC

Memory
------

The heap consists of:
* Eden (Young gen)
* Survivor (Young gen)
* Tenured

The non-heap memory consists of:
* Perm gen
* Code cache

Memory Consumption and the JVM
------------------------------

See:http://stackoverflow.com/questions/561245/virtual-memory-usage-from-java-under-linux-too-much-memory-used

Resident set contains the following:
* anon blocks for the heap (broken into different areas) and internal data
* JVM loader itself
* mmaped JAR files loaded
* Per thread data
* Shared libraries for the JVM code (

Some settings that affect memory usage on the JVM:
* Obvious -Xms and Xmx specifications for the heap size
* Thread Size - consumes it's own stack (Xss) - defaults to 512KB

The JVM *reserves* a block of memory (resident set) and then grows the heap within that.  It can also shrink it (Min/Max Heap Free).

Thread Local Allocation Buffers - http://robsjava.blogspot.co.uk/2013/03/what-are-thread-local-allocation-buffers.html
* TLAB - Eden Space Buffer for new objects to allow faster memory allocation
* Not enabled by default, uses more of your Eden space

View resident set size with:

    ps -e -orss,vsz,args | grep java | sort -n
    
Get a list of all the memory with pmap


Debugging Memory
----------------

You can:

* Enable PrintGCStats
* Use Yourkit, VisualGC 

