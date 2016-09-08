## Getting Started

https://kotlinlang.org/docs/reference/basic-syntax.html

Example Function

	fun example(a: Int): Int {}

Read Only Variable

	val a: Int = 1
	val a = 1

Mutable Variable

	var a = 1

Main Method

	fun main(args: String) {
		print("${args[1]}")
	}

Expressions

	fun example(a: Int) = if (a > 5) 10 else 15

Type Checking

	if (obj is String) 

Loops

	for (a in args)
	while (i < args.size)
	for ((k, v) in map)

When

	when (obj)

		is String -> print("Is string")
		"Hello" -> print("World")

Range

	if (x in 1..5)

Lambda Expressions

	names.filter { it.startsWith("Jon") }.map { it.toUpperCase() }
	names.filter { it > 0 } 

## DTO's

Generates getters, setters, equals, hashcode etc...

	data class Customer(val name: String, val email: String)

## Collections

	val list = listOf("a", "b", "c")
	val maps = mapOf("a" to 1, "b" to 2)

## Combining

	val names = listOf("apple", "banana")    
    val filtered = names.filter { it.startsWith("a") }.map { it.toUpperCase() } 
    for (name in filtered) {
        print(name);
    }

## Singleton

	object Resource {
	    val name = "Name"
	}

## Extension Functions

	fun String.spaceToCamelCase() { }

# Conditional Checks

Not null:

	names?.size()
	names?.size() ?: "not found"
	data?.let { // do stuff }

	val result = try { count() } catch (e: ArithmeticException) {
        throw IllegalStateException(e)
    }

    val result = if (param == 1) {
        "one"
    }

Calling multiple methods with a context

	with(myTurtle) {
		do()
	}

Strings and templates:

	val text = """
	  for (c in "foo")
	    print(c)
	"""

Classes

	class Person(firstName: String) {
	}

Inheritance

	open class Base(p: Int)
	class Derived(p: Int) : Base(p)

