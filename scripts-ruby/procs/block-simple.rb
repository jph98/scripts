#!/usr/bin/env ruby

# Block - nameless function

arr = [1,2,3,4]

puts "simple block"
arr.each do |e|
	puts e
end

# or one liner
puts "one liner"
arr.each { |e| puts e }

