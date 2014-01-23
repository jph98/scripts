Boost
-----

Boost provides a number of header libraries for working in C++

Getting started with Boost - http://www.boost.org/doc/libs/1_55_0/more/getting_started/unix-variants.html

    #include <boost/lambda/lambda.hpp>
    #include <iostream>
    #include <iterator>
    #include <algorithm>
    
    int main()
    {
        using namespace boost::lambda;
        typedef std::istream_iterator<int> in;
    
        std::for_each(
            in(std::cin), in(), std::cout << (_1 * 3) << " " );
    }
