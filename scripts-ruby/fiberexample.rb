#!/usr/bin/env ruby

# See: http://pragdave.blogs.pragprog.com/pragdave/2007/12/pipelines-using.html
# Check: http://www.ruby-doc.org/docs/ProgrammingRuby/html/tut_threads.html
require("fiber") 

a = Fiber.new do    
    loop do
    	puts "First Thread"
    	Fiber.yield
	end
end

b = Fiber.new do    
    loop do
    	puts "Second Thread"
    	Fiber.yield
	end
end

loop do 
	a.resume
	b.resume
end
