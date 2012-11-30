#!/usr/bin/ruby

#
# Collectl ruby script for performance metrics
#
metricnames = ["cpu", "sys", "inter","ctxsw", "KBRead", "Reads", "KBWrit", "Writes", "KBIn", "PktIn", "KBOut", "PktOut"]
collectlcommand = "collectl"

def isnum(s)
  begin
    Float(s)
  rescue
    false # not numeric
  else
    true # numeric
  end
end
     
File.open('metrics-collectl.txt', 'w') do |mfile|

 IO.popen(collectlcommand) do |output|

  linenum = 0
  
  #Deal with line level outputs
  while line = output.gets do

    # Strip whitespace out
    cleanedline = line.gsub(/ /,'')

    # Ingore any lines that are not numeric
    if isnum(cleanedline) == true

      # Split the string on spaces
      metricvalues = line.split(" ")

      if metricvalues.size() != metricnames.size()
        puts "Error in collectl output, abort"
        exit
      end	 	
      
      cleanline = line.gsub(/\n/,'')

      #puts "Metric line: #{cleanline}"

      #Write this out to a flat file
      mfile.puts(cleanline) 
      mfile.flush()

    end

  end
 end

end


