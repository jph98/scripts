Generics Snippets
=================

All these are interchangeable:

    T is meant to be a Type
    E is meant to be an Element (List<E>: a list of Elements)
    K is Key (in a Map<K,V>)
    V is Value

See: http://www.angelikalanger.com/GenericsFAQ/JavaGenericsFAQ.html

Simple example of declaring a generic type:

    public T getResponse() {}
    
Declare a method that returns a list of any type:

    public <T> List<T> magicalListGetter() {}
    
Declare a class of type T that has a method returning T in some form:

    public class GenericMapDeserializer<T> extends JsonDeserializer<Map<String, T>> {}
