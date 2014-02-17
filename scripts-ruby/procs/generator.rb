#!/usr/bin/env ruby

def multiple_generator(m)
	lambda do |n|
		n * m
	end
end

doubler = multiple_generator(2)
tripler = multiple_generator(3)

# Ok
puts doubler[5]

# Keeps the existing value
puts doubler[10]

# 20 and 30

# Reference is kept to the variables