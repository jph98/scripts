#!/usr/bin/env ruby

class Array
	def random_each(&b)

		# Print the proc (anonymous function)
		# Can only pass a single block to a method
		p b
		
		shuffle.each do |e|
			# Call the block
			b.call e
		end
	end
end

[1,2,3,4].random_each do |e|
	puts e
end