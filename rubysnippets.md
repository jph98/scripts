##Ruby Snippets

* Hidden Features - http://stackoverflow.com/questions/63998/hidden-features-of-ruby
* 21 tricks - http://www.rubyinside.com/21-ruby-tricks-902.html

See:
* http://globaldev.co.uk/2013/09/ruby-tips-part-1/
* http://globaldev.co.uk/2013/09/ruby-tips-part-2/

Sigil - e.g. @ and $e

Ruby Draft Specification - http://www.ipa.go.jp/osc/english/ruby/

Pry for debugging - https://github.com/pry/pry

###TODO

Examples/articles to run through:
* http://watirmelon.com/2014/03/31/a-ruby-testing-framework-from-scratch-in-15-minutes/
*

###Initialise a project

	bundle gem .

###Gem Overview

	gem env | grep INSTALLATION
	gem server - run a ruby gem server on http://localhost:8088

###Install a Gem from source

This makes use of Bundler:

	gem build GEMNAME.gemspec
	gem install gemname-version.gem
	
A sample Gemfile can be found here: http://ruby.about.com/od/bundler/ss/Getting-Started-With-Bundler.htm

###Syntax Analysis

Check that a Ruby source is syntactically correct

	ruby -c my.rb
	
Ruby 1.9 provides ripper for doing syntax analysis.  Show the syntax tree as an sexpression

	require "ripper"
	require "ap"
	
	ap Ripper.sexp("puts {}.class")

###irb

.irbc allows you to setup default options

	require 'rubygems'
	require 'wirble'
	Wirble.init
	Wirble.colorize

Exit a script with:

	abort("Message")

Can refer to the last returned value in rib with:

	_
	
e.g.

	_ * _

###Classes

######Skeleton

    class JenkinsPoller
      def initialize(jenkins_url)
    		@jenkins_url = jenkins_url
    	end
    end
    j = JenkinsPoller.new("myurl")

#####Constructors

	def initialize(init)
	    init.each_pair do |key, val|
	      instance_variable_set('@' + key.to_s, val)
	    end
	end
  
#####Singleton example

	class << self
	    def method
		puts "My method"
	    end
  	end
  	  	
#####Struct Example

See: http://blog.steveklabnik.com/posts/2012-09-01-random-ruby-tricks--struct-new

Provides a way to create simple classes on the fly with attributes (albeit up-front):

	class Point < Struct.new(:x, :y)
	end
	
We also have OStructs as well, on which you can arbritrarily create attributes:

	record = OpenStruct.new(:name=>'jay')
    
#####Variables

Access a class variable or refer to something within a module:

	::


#####Reflection

You can automatically create variables with by defining a headers array full of symolbs and calling instance_Variable_set.  In this case we use arrays:

	HEADERS.each do |name| 
		instance_variable_set("@#{name}", [])		
	end
	
then later on if you want to access a specific variable and add a value you to it you can use:

	ivar = holder.instance_variable_get("@#{item}")
	ivar.push(vals[idx])

#####Symbols

Symbols are a way to reuse words over and over again - they exist in memory only once

	patient = {:ruby => "red"}

#####Ruby Source Files Have Data as Well
	
	puts "hello world"
	
	DATA.rewind
	puts DATA.read	
	
	__END__
	puts "do we ever get here"

######Null Object Pattern

Encapsulating default values in a null object class to reduce conditionals 

	@contact = contact || NullContact.new

Replace conditional with polymorphism

#####Blocks and Procs

This is a good example of procs, lambdas and closures - http://www.youtube.com/watch?v=VBC-G6hahWA

See this for a practical example: http://blog.codahale.com/2005/11/24/a-ruby-howto-writing-a-method-that-uses-code-blocks/

& turns a block into a proc (which can then be called)

###Methods

! indicates that the object will be modified as a result of the call

    foo.downcase! 

? indicates that this is a predicate method:

	foo.isVerb?
	
You can also specify setter methods using syntactic sugar:

	def name=(nm)  
		@name = nm  
	end  
	
	object.name = "Fred"

! - specifies that the method will modify the object passed to it, rather than returning a modified object.

#####Equals Overrriding

You can override object equality with ==

	def ==(another_sock)
    		self.size == another_sock.size
  	end
  	
######Pipe pipe equals ||=

	https://www.ruby-forum.com/topic/151660/
  
The following checks whether objects have the same type as well as value

	foo.eql?(bar)
	
the following just checks value

	foo == bar
	
You can also use Comparable to define custom functionality via a mixin:

	include Comparable
	
	def <=>(another_sock)
	    if self.size < another_sock.size
	      -1
	    elsif self.size > another_sock.size
	      1
	    else
	      0
	    end
	end

Default method parameters with an optional parameter at the end

	def some_method(a, b = 10, *c)
	end

###Modules

Modules just provide a way of grouping classes, methods together

	module Blah
		def one
		end
		
		def two
		end
	end

and we can include the behaviour as a mixin

	class Example
		include Blah
	end
	
This is great for helper utilities consisting of "normally static" methods

#####RSpec Skeleton

spec_helper.rb

    endrequire_relative "../classundertest"
    require "yaml"
    require 'spec_helper'

classundertest_spec.rb

    describe ClasSUnderTest do
    
        # before
    	before :each do
    		binary = "../jmeter-2.6/bin/jmeter -n -t "
    		scripts = "jmeterscripts/*.jmx"
        	@runner = JMeterRunner.new binary, scripts
    	end 
    
    	describe "#new" do
    		it "takes two parameters and returns a JMeterRunner object" do
    			@runner.should be_an_instance_of JMeterRunner
    		end
    	end	
    end
    
#####Stubbing and Mocking Methods

Use RSpec Mocks - https://www.relishapp.com/rspec/rspec-mocks/v/2-3/docs/method-stubs

###Comments

Simple comment
	
	# This is a comment
	
Multiline comment

	=
	This is a 
	multiline 
	comment
	=
    
######Getters and Setters

Accessors and getters can be defined automatically

    class Match
      attr_accessor :home
      attr_reader :away
      attr_writer :blah
    end
    
Then import with:

    require './match'

Boolean methods can be defined as follows (with ? as part of the method name):

	def empty?
		@arr.empty? # Implicitly returned.
	end
  
#####Private Method

    # Private method comment
    private
    def get_detail(doc)
      # Content
    end

#####Requires

	require "some_gem"
	require_relative "../another.rb"
	%w{rubygems daemons eventmachine}.each { |x| require x }
	
###Conditionals

Make use of "and", "or" for single one liners to eliminate if/else statements

	list << item and puts "Added item" unless item.length < 2

Standard if/else blocks with elsif

	if item == :success
    			holder.push_success(values[idx])
	    	elsif item == :latency
    			holder.push_latency(values[idx])
    		else
    			ivar.push(values[idx])
    		end

#####Chaining ifs

	puts "this is my text" if i == 2

#####Ternarys

	status = @overall_test_failure == true ? Run::SUCCESS : Run::FAILURE
	
#####Actions with Conditionals

	puts "failed" if errors.size() == 0
	
#####Skipping a loop

	0.upto(20) do |i|
	        next if i % 2 == 0
	        puts i
	end

######Zipping things

Produce an array of the names and ages (ok):

	p names.zip(ages)
	
Produce a hash of the names and ages (awesome):

	p Hash[names.zip(ages)]
	
###Enumerables

######Find

Find an item in a collection of objects easily with:

	metrics.find { |m| m.scriptname.include?(scriptname) }
	
######Select

You can filter an array given the select keywords

	@filtered_orders = @orders.select { |order|
		order.placed <= end_date
	}
	
#####Map

Map allows you to pass an element in an array to an expression:

	items = [2,4,6,8]
	items.map { |item|
		item*2
	}
	
	=> [4, 8, 12, 16]

#####Inject

Is also called reduce or fold in other languages.  See: http://blog.jayfields.com/2008/03/ruby-inject.html

	orders.map(&:amount).inject(0) { |sum, amount| amount + sum }

Ruby 1.9 hack:

	orders.map(&:amount).inject(0, :+)

#####Find All

Find all elements matching the expression:

	items.find_all{ |item| item % 4 == 0 }

###Looping

#####When Loop

    case colours
      when "blue", "red"
        puts "Writing status for: #{project} [Success]"
      end      
    end
    
#####Infinite Loop

	loop do 
		puts "to infinity and beyond"
	end

#####Each Statement

Simple each statement here:

    jobs.each do |j|
      print j
    done

You can also access the index with the each_with_index helpr:

	jobs.each_with_index do |job, idx|
	end
	
###Variables

Types of variable:

	CONSTANT = "ralph"
	@instance_variable
	@@class_variable
	$global_variable
	
Refer to a constant with:

	ClassName::CONSTANT

#####Ruby Symbols

It's an object with an integer and string representation:

	:mysymbol

#####Guarding against nil

	unless @controller.nil
		@controller.stop()
	end

#####Main Method

    if __FILE__ == $0

#####Command Line Arguments Handling

Cheap:

	ARGV.each do|a|
		puts "Argument: #{a}"
	end
	
Print name of sccript

	puts "Usage: #{$0} <start|stop>, arguments: #{$1}"
	
###Text Handling

#####Including text via interpolation

Normally done with

	puts "This is my string #{anothervar}"
	
but shortcutted with:

	puts "This is my string #@anothervar"
	
Another way of rpinting

p "text"

#####Printing Formatted Date and Time

	Time.now.strftime("%d/%m/%Y %H:%M")
	
n.b. That the standard way of converting a timestamp to a formatted date (Time.at) uses SECONDS not milliseconds

	Time.at(labelt.to_f / 1000)

#####Formatting a Decimal

	"%.2f" % 9.5

#####Calculating a Formatted Percentage

	@rate = (@success_tot.to_f / @success.length.to_f) * 100
	formatted_rate = "%.2f" % @rate
	
#####Changing Case

    text.downcase()
    text.upcase()
    text.capitalize()
    
#####Checking empty string

    text.empty?
    
#####Checking for a substring

	string.include?(substring)
	
Can also use this as a shortcut:

	string[anotherstring]

#####Checking a range

You can define arange as follows:

	(start...end)
	
and can check between those values (without instantiating all the objects inbetween) with:

	def empty?
		@arr.empty? # Implicitly returned.
	end

###Collections

Hamster is worth a look - https://github.com/harukizaemon/hamster

Simple array:

    array = [1, 2, 3, 4]
    array.push(5)
    array << 6
    array.pop()
    array.delete()
    array.length()

You can also create an array of strings quickly with

	%w(words in my array)

Simple hash definition and iteration:

    hsh = {:a => 1, :b => 2}
    hash.each_key do |key|
        puts key
    end
    
    hash.each_pair do |k,v|
        puts k + ":" + v
    end
    
Check that a key is present

	labelhash.has_key?(label)
	
Insert a key and value:

	labelhash[label] = stats_list
	
Retrieve a value:

	puts labelhash[label]

#####Getting things into an array

Getting things into an array:

	[*10..20]
	[*"a".."z"]

###Files and Directories

######Processing a file line by line

	File.open(@jtlfilename, "r").each do |line|
  		puts line
	end

Listing files matching a pattern in a given directory:

    Dir.glob('*.rb').each do|f|
        puts f
    end
		
######Removing a file

	File.delete(filename)
	FileUtils.rm_rf("dirname")
	FileUtils.mkdir("dirname")

######Checking if a file exists

	File.exist?(filename)

###Regular Expressions

#####Matching a simple string (first group)

Convenience method

	name[/(.*)\.rb/]
	
or the traditional way:

	name.match(/(.*)\.rb/)[1]

another way grabbing the second match, name then a and b respectively as well:

	name[/(?<a>\w+) (?<b>\w+)/, 2]
	
You can also specify the label as well:

	name[/(?<a>\w+) (?<b>\w+)/, :b]

Return the position in the stirng where the match occured with:

	"abcde" =~ /bcd/
	
###Exceptions

Basic pattern is (n.b. the begin is optional):

	begin
		do_division_by_zero
	rescue => exception
		puts exception.backtrace
	end
	
or any exception with:

	begin
	rescue
		puts "Handled"
	end
	
The following prints out an exception report

	p e.message
	p e.backtrace

You can also use rescue to define a default value when something fails

	some_hash[:name].downcase rescue "No name"

Raising an exception:

	raise TypeError, 'You must give me truth' if value == false
	
Defining your own exception:

	class MyCrazyException < StandardError
	end
	
Note that Exception catches ALL errors.  StandardError deals with application errors only.

###Utilities

#####Zipping a set of files

    Zip::ZipFile.open(name, Zip::ZipFile::CREATE) do |zipfile|
    		collectscripts.each do |f|
			    zipfile.add(f, f)
			  end
    end
	
#####Timing Code

	start = now.milliseconds
	end = now.milliseconds
	puts "Time taken " + end - start
	
#####Sleep

Sleep for 5 seconds

	sleep 5	

###MetaProgramming

See http://skilldrick.co.uk/2011/02/really-really-simple-ruby-metaprogramming/

Printing out current method and callee:

	p __method__
	p __callee__
	
Print out the list of methods on an object:

	puts acc.methods.sort()
	
Print out the location in the source

	a = ->{ }
	p a.source_location

###Concurrency

#####Fibers Example

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

#####Creating a thread

	t1 = Thread.new(page) do |myPage|
	    # Do stuff
	end
	t1.join
	t2.join

###Networking

#####HTTP Request

    begin
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)
      return http.request(request)
    rescue Timeout::ErrorNet::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
      abort("Could not access server for: #{@url}" + e)
    end 

######Parsing HTML

    doc = Nokogiri::HTML(open(parse_url))
    matches="//div/ol[contains(@class,'competitions unstyled')"
    details = doc.search(matches).map do |match|
      @match.link = match.at_xpath("a")[:href]
    end
    
###Working with JSON

Calling a JSON endpoint with Faraday:

	conn = Faraday.new(:url => url) do |faraday|
	  faraday.request  :url_encoded             # form-encode POST params
	  faraday.response :logger                  # log requests to STDOUT
	  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
	end
	
	response = conn.get '/internal-service'
	jsonres = JSON.parse(response.body)["response"]
	
	jsonres.each do |srv|

JSON dependency:

	require "json"

Print out hash:

	p h

Print out json:

	j h

Pretty print json:
	j j

###Calling Native Code

Use Function - http://www.ruby-doc.org/stdlib-2.0/libdoc/fiddle/rdoc/Fiddle.html

###Sinatra Skeleton and Example

See: https://github.com/adamwiggins/scanty-redis/blob/master/main.rb
