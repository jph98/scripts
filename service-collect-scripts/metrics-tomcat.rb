#!/usr/bin/ruby

require "rubygems"
require "net/http"
require "uri"
require 'rexml/document'

#
# Tomcat status polling script
# This requires the manager application to be made available (in tomcat-users.xml)
# with a username tomcat and password tomcat 
#
class TomcatStatus

	def initialize(url)
		@url = url
	end

        #	
	# print the header line
        #
	def getheader()
		headers = ["JVMFreeMem", "JVMTotalMem", "JVMMaxMem", "MaxThreads", "CurrentThreads", "CurrentThreadsBusy", "MaxTime", "ProcessingTime", "RequestCount", "ErrorCount", "BytesReceieved", "BytesSent"] 
		headertext = headers.map { |h|
				"#{h}"
		}.join(",")
		return headertext
	end

        #	
	# grab and print the status
        #
	def getstatus()
		uri = URI.parse(@url)
		http = Net::HTTP.new(uri.host, uri.port)
		request = Net::HTTP::Get.new(uri.request_uri)
		request.basic_auth("tomcat", "tomcat")
		response = http.request(request)

		responsecode = response.code

		if responsecode.eql? "200"
			doc = REXML::Document.new(response.body)
			de = ","
			statusline = ""
	
			doc.root.elements.each("/status/jvm/memory") { |e| 
				statusline << "\n" + e.attributes["free"] + de + e.attributes["total"] + de + e.attributes["max"] + de
			}
	
			doc.root.elements.each("/status/connector") { |e|
				name = e.attributes["name"]
				if name.eql? 'http-8080'
				
					t = e.elements["threadInfo"]
					statusline <<  t.attributes["maxThreads"] + de + t.attributes["currentThreadCount"] + de + t.attributes["currentThreadsBusy"] + de
					
					r = e.elements["requestInfo"]		
					statusline <<  r.attributes["maxTime"] + de + r.attributes["processingTime"] + de + r.attributes["requestCount"] + de +  
									r.attributes["errorCount"] + de + r.attributes["bytesReceived"] + de + r.attributes["bytesSent"]
				end 
			}
	
			return statusline
	
		else
		  puts "Could not communicate with Tomcat server to get response"
		end
	end
	
end

# Tomcat
stat = TomcatStatus.new("http://localhost:8080/manager/status?XML=true")

File.open('metrics-tomcat.txt', 'w') do |mfile|

   mfile.puts(stat.getheader())

    while true
       mfile.print(stat.getstatus())
       mfile.flush()
       sleep 3
   end

end


