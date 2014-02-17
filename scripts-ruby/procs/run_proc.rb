#!/usr/bin/env ruby

def my_func(p)
	p.call
end

p = Proc.new { puts "hello"} 
my_func(p)

# Four main ways to run a Proc
p = Proc.new do |arg|
	puts arg
end

# 1
p.call("a")

# 4, used within case statement (1.9+)
#p ==== "a"

# Lambdas are just proc objects, shortcut way
hello = lambda do
	puts "This is a proc"
end
hello.call

# Lambdas force arity (number of parameters and arguments match up)
#run_proc lambda { puts "I'm a lambda"; return }
#run_proc proc { puts "I'm a proc"; return }