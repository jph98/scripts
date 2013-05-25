##Ruby Snippets

* Hidden Features - http://stackoverflow.com/questions/63998/hidden-features-of-ruby
* 21 tricks - http://www.rubyinside.com/21-ruby-tricks-902.html

###irb

.irbc allows you to setup default options

	require 'rubygems'
	require 'wirble'
	Wirble.init
	Wirble.colorize


###Classes

######Skeleton

    class JenkinsPoller
      def initialize(jenkins_url)
    		@jenkins_url = jenkins_url
    	end
    end
    j = JenkinsPoller.new("myurl")

#####Singleton example

	class << self
	    def method
		puts "My method"
	    end
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

###Comments

Simple comment
	
	# This is a comment
	
Multiline comment

	=
	This is a 
	multiline 
	comment
	=

###Methods

! indicates that the object will be modified as a result of the call

    foo.downcase! 
    
######Getters and Setters

Accessors and getters can be defined automatically

    class Match
      attr_accessor :home
      attr_reader :away
      attr_writer :blah
    end
    
Then import with:

    require './match'
    
#####Main Method

    if __FILE__ == $0

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

    jobs.each do |j|
      print j
    done

###Variables

Types of variable:

	CONSTANT = "ralph"
	@instance_variable
	@@class_variable
	$global_variable

#####Ruby Symbols

It's an object with an integer and string representation:

	:mysymbol

#####Guarding against nil

	unless @controller.nil
		@controller.stop()
	end

#####Command Line Arguments Handling

Cheap:

	ARGV.each do|a|
		puts "Argument: #{a}"
	end
	
Print name of sccript

	puts "Usage: #{$0} <start|stop>, arguments: #{$1}"
	

#####Formatting a Decimal

	"%.2f" % 9.5

###Text Handling

#####Changing Case

    text.downcase()
    text.upcase()
    text.capitalize()
    
#####Checking empty string

    text.empty?

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

###Files and Directories

Listing files matching a pattern in a given directory:

    Dir.glob('*.rb').each do|f|
        puts f
    end
    
######Removing a file

	File.delete(filename)
	FileUtils.rm_rf("dirname")
	FileUtils.mkdir("dirname")

######Checking if a file exists

	File.exist?

###Regular Expressions

#####Matching a simple string (first group)

Convenience method

	name[/(.*)\.rb/]
	
or the traditional way:

	name.match(/(.*)\.rb/)[1]

###Exceptions

Basic pattern is (n.b. the begin is optional):

	begin
		do_division_by_zero
	rescue => exception
		puts exception.backtrace
	end
	
The exception.backtrace gives you a lot more

You can also use rescue to define a default value when something fails

	some_hash[:name].downcase rescue "No name"

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
    details = doc.search(matches).map do |match|
      @match.link = match.at_xpath("a")[:href]
    end
    
