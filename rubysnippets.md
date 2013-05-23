##Ruby Snippets

###Classes

######Skeleton

    class JenkinsPoller
      def initialize(jenkins_url)
    		@jenkins_url = jenkins_url
    	end
    end
    j = JenkinsPoller.new("myurl")

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

###Variable Handing

#####Die unless arguments are correct

###Looping

#####When Loop

    case colours

      when "blue"
        puts "Writing status for: #{project} [Success]"
      end 
    end

#####Each Statement

    jobs.each do |j|
      print j
    done

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

	  threads << Thread.new(page) { |myPage|
	  	# Do stuff
	  end


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
    
