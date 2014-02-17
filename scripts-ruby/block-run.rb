#!/usr/bin/env ruby

def run_block
	# Check to see if a block was passed
	yield if block_given?
end

run_block do
	puts "Hello block"
end

# Covered by the above
run_block