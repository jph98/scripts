#!/usr/bin/ruby

#
# Number of open files monitor
#
numopenfiles="lsof | wc -l"

File.open('metrics-numopenfiles.txt', 'w') do |mfile|

 while true

   IO.popen(numopenfiles) do |output|

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


