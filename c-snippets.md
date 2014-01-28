CheatSheet - http://claymore.engineer.gvsu.edu/~steriana/226/C.CheatSheet.pdf

* libcURL
* libGlib
* libGSL
* libSQLite3
* libXML2

Windows - use  MinGW (./configure --host=ming32)
Linux - 

Autotools:
* configure
* make
* make install

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
    
Makefile

    P=program_name
    OBJECTS=
    CFLAGS = -g -Wall -O3
    LDLIBS=
    CC=c99
    $(P): $(OBJECTS)
    
