#!/usr/bin/env ruby

def meth binding
	eval "puts x", binding
end

x = 5
meth binding