# Head First C

http://karadev.net/uroci/filespdf/files/head-first-c-o-reilly-david-grifffiths-dawn-griffiths.pdf

gcc read.c -o read

1. Diving In

* #include <stdio.h> 
* switch
* for (counter = 1; counter < 11; counter++)
* void function()

2. Pointers and Memory (page 41)

* Stack, heap, globals, constants, code
* Pointers are efficient ways of passing data around.
* C follows a pass by copy for variables

Address of the variable - &
Read contents - *

```
void change_location(int* x, int* y) {
  *x = *x + 1
  *y = *y + 1
}
ship_x = 0;
ship_y = 0;
change_location(&ship_x, &ship_y);
```

Passing a string:

```
void fortune_cookie(char msg[]) {}
fortune_cookie("OHAI");
```

Array Variables:
* Not quite pointers
* printf("The quote string is stored at: %p\n", quote) = 0x7fff69d4bdd7

```
char s[] = "How big is it?";
char *t = s;
```

sizeof(a pointer) returns the value 4 or 8, depends on whether 32bit or 64bit

Pointer Arithmetic:
* This is the same:

```
printf("3rd order: %i drinks\n", drinks[2]);
printf("3rd order: %i drinks\n", *(drinks + 2));
```

You can also do the following:
```
int doses[] = {1, 3, 2, 1000};
printf("Issue dose %i", 3[doses]);
```

Declare a variable with a size:
```
char name[40];
```

If you run over this size, then a buffer overflow will occur.

You can use fgets as well as scanf, which takes the pointer, does sizing and stdin as a param:

```
fgets(food, sizeof(food), stdin);
```

String literals can NEVER be updated: char *cards = "JQK";
but you can if you update it: char cards[] = "JQK";

n.b. In the above we don't specify a size because it is immediately assigned to a string variable.

It's better to define a string literal as a constants: const char *s = "some string";

* Stack - local variable storage
* Heap - for dynamic memory (not used yet)
* Globals - lives outside all functions
* Constants - read-only
* Code - lowest memory address.  This is where the code is assembled.

2.5 String Thory

Create an array of arrays:

```
char tracks[][80] = { 'a', 'b', 'c' }
```

C Standard Library has a bunch of useful code:
* Broken up into sections
* Each section has a header

* stdio.h - standard input and output
* string.h - string functions

String functions:
* Search - strstr()
* 


3. Specialized Tools

4. Structure and Size

5. Structs

6. Bridges

7. Functions

8. Hot Swap Code

9. Boundaries

10. IPC

11. Networking

12. POSIX Threads

13. 
