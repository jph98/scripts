#!/usr/bin/ruby

#
# Collect processes script
#
numproc="ps -ef | grep java | wc -l"

File.open('metrics-processes.txt', 'w') do |mfile|

 while true
 
   IO.popen(numproc) do |output|

     #Deal with line level outputs
     while line = output.gets do
       timenow = Time.now.to_s
       mfile.puts(timenow + ": " + line)
       mfile.flush()
     end
   
   end
  sleep 1
 end

end
