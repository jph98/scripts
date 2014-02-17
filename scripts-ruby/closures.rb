#!/usr/bin/env ruby

def run_proc(p)
	p.call
end

name ="Jon"
printname = proc { puts name }
run_proc printname