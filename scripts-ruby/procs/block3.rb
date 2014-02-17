#!/usr/bin/env ruby

class Array
	def random_each
		shuffle.each do |e|
			yield e
		end
	end
end

[1,2,3,4].random_each do |e|
	puts e
end