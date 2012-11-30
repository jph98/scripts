
#!/bin/bash
#
# Bash script to collect various metrics provided by the commands on a given server
#####################################################################

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 2 ] || die "Usage: $0 <serverhost> [start|stop]"

# List of collect scripts 
commands=("metrics-collectl.rb" "metrics-processes.rb" "metrics-tomcat.rb")
scriptsbundle=remotecollectscripts.zip

serverhost=$1

remotemetricsdir=/tmp/remotecollect
remotemetricsdata=$remotemetricsdir/metrics*.txt
remoteuser=root

#
# Start metrics collection
#
function start {

  remotepids=()
  zip $scriptsbundle metrics*.rb

  # Remote operations for metrics collection
  scp $scriptsbundle $remoteuser@$serverhost:~/
  #ssh $remoteuser@$serverhost "cd /tmp; mkdir -p remotecollect; cd remotecollect; unzip -o /tmp/$scriptsbundle; rm -f metrics.txt"
  ssh $remoteuser@$serverhost "unzip -o $scriptsbundle; rm -f metrics*.txt"
  echo -ne "\nCollecting metrics on $serverhost\n\n"
  for cmd in "${commands[@]}"
  do	
   #pid=`ssh $remoteuser@$serverhost "nohup /tmp/remotecollect/$cmd > /dev/null & echo \\$!"`
   pid=`ssh $remoteuser@$serverhost "nohup ~/$cmd > /dev/null & echo \\$!"`
   echo "Pid is $pid" 

   # Add the pid to the array
   remotepids=("${remotepids[@]}" $pid)                   	  
  	
  done         
  
  echo -ne "Collected pids ${remotepids[@]} \n"
  echo ${remotepids[@]} > remote.pids
  rm -f $scriptsbundle
}

#
# Stop metrics collection
#
function stop {  

  remotepids=( $( cat remote.pids ) )
  echo "Pids: ${remotepids[@]}"

  for pid in "${remotepids[@]}"
  do
     echo "Killing $pid"
     ssh $remoteuser@$serverhost "kill -9 $pid"
  done
       
  echo "Collecting metrics data from daemon"  
  datedir=./collected/data-`date +"%m-%d-%y-%T"-$serverhost`
  mkdir -p $datedir
  scp $remoteuser@$serverhost:~/metrics*.txt $datedir
  rm -f remote.pids
}

# Execute the given function passed in [start|stop]
$2
