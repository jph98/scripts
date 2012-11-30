#!/usr/bin/env ruby

#
# VMStat script
#
vmstat="vmstat 1 10"

File.open('metrics-vmstat.txt', 'w') do |mfile|

 while true

   IO.popen(vmstat) do |output|

     #Deal with line level outputs
     while line = output.gets do
       mfile.puts(line)
       mfile.flush()
     end

   end
  sleep 1
 end
end
