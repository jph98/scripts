CheatSheet - http://claymore.engineer.gvsu.edu/~steriana/226/C.CheatSheet.pdf

Useful Libraries
----------------

* libcURL
* libGlib - cross platform utility library - http://en.wikipedia.org/wiki/GLib
* libGSL
* libSQLite3
* libXML2
* Apophenia - https://github.com/b-k/Apophenia

Windows - use  MinGW (./configure --host=ming32)
Linux - 

Autotools:
* configure
* make
* make install

Hello World
-----------

hello.c

    #include <stdio.h>
    int main(){ printf("Hello, world.\n"); }

erf.c

    #include <math.h>  //erf, sqrt
    #include <stdio.h> //printf

    int main(){
      printf("The integral of a Normal(0, 1) distribution "
             "between -1.96 and 1.96 is: %g\n", erf(1.96*sqrt(1/2.)));
    }

Compilation
-----------

Compile with:

* -g - add symbols for debuggin
* -std=gnu11 - (GNU) use standards for POSIX and c11

    gcc erf.c -o erf -lm -g -Wall -O3 -std=gnu11

or compiler agnostic:

    c99 erf.c -o erf -lm -g -Wall -O3

Linking, Libraries and pkg-config
---------------------------------

* -i - include search path
* -L - library search path

    gcc -I /usr/local/include use_useful.c -o use_useful -L /usr/local/lib -luseful

Order matters. If you have a file named specific.o that depends on the Libbroad library, and Libbroad depends on Libgeneral, then you will need:

    gcc specific.o -lbroad -lgeneral
    
pkg-config maintains a repository of the libraries which can be searched for with:

    pkg-config --libs libxml-2.0
    
* Static linking - copying the contents of the library into the final executable
* Dynamic linking - resolving the library at runtime from the path

    export LD_LIBRARY_PATH=libpath:$LD_LIBRARY_PATH
    
or if compiling add the following to the Makefile:

    LDADD=-Llibpath -Wl,-Rlibpath
    
Makefiles
---------

Shell grammar is based on the Bash/C shell syntax

    P=program_name
    OBJECTS=
    CFLAGS = -g -Wall -O3
    LDLIBS=
    CC=c99
    $(P): $(OBJECTS)
    
Define a variable (can also override on the command line):

    make CFLAGS="-g -Wall"
    
Built in variables:
* $@ - target filename
* $* - target file without extension

Example:

    all: html doc publish

    doc:
        pdflatex $(f).tex
    
    html:
        latex -interaction batchmode $(f)
        latex2html $(f).tex
    
    publish:
        scp $(f).pdf $(Blogserver)
        
Compiling an object from a c source file:

    $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $*c.
    
Default Make rules:

    make -p > default_rules
    
Setting CFLAGS:

    CFLAGS=`pkg-config --cflags apophenia glib-2.0` -g -Wall -std=gnu11 -O3
    LDLIBS=`pkg-config --libs apophenia glib-2.0`

Headers
-------

As well as including headers are the top of your C program, with GCC you can include the headers:

    gcc -include stdio.h

Here documents 
--------------

Here docs are a standard POSIX feature.  They allow you to define a program using stdin on the command line like so:

    python - <<"XXXX"
    lines=2
    print "\nThis script is %i lines long.\n" %(lines,)
    XXXX
    
Debug, Test
-----------

