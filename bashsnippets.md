##Bash Snippets

* Best Bash Guide Ever (apparently) - http://tldp.org/LDP/abs/html/

* See - http://bash.cumulonim.biz/BashPitfalls.html

* Bash Special Parameters - http://www.thegeekstuff.com/2010/05/bash-shell-special-parameters/#more-4383

$_

###Basics and Rules of Thumb


* Always use round brackets for numeric comparisons.  With square brackets you have to use -eq instead of == ascii comparison


###Variable Handing

####Die unless arguments are correct


    die () {
        echo >&2 "$@"
        exit 1
    }
    
    [ "$#" -eq 3 ] || die "Usage: $0 arguments "

####Check Argument Set Or Default Value

    [ -z "$RPATH" ] && RPATH="/usr/bin/R"


####Shifting variables

    # Grab the servername then shift
    SERVER=$1
    shift

####Increment variable

    counter=$((counter+1))
    
###Looping and Conditional Constructs


#####Simple if

    if (( $counter == 3 )); then    		
		kill -9 $PID
	else
		counter=$((counter+1))
	fi
	

    [[ -f file ]] 
    [[ -d dir ]]
    [[ -r entry ]]
    [[ -w entry ]]
    [[ -x entry ]]
    
    [[ -n var ]]  // non zero
    [[ -z var ]] // zero length
   
#####Maths

	let
	(( j > 0 ))
	typeset -i k=$1

#####Exit Status

Set exit status with exit n

Previous exit status with $?
Previous pid with $!

   
    

#####Simple for loop

    for JMETERTEST in "$@"
    do
        <stuff>
    done

###Executing Things

#####Backtick

Take the output from a variable and store this:

    numscripts=`ls -l metrics*.rb 2> /dev/null | wc -l`
]
Alternatively, use a subshell using $()

#####Subshell

    for cmd in $(ls metrics*.rb)

#####Parsing output of a command to check whether something is present

In this case an R package

	#!/usr/bin/env bash

	function checkpackage() {
		output=""
		output=`Rscript -e 'installed.packages(lib.loc = "/opt/mango/navigator/rlibs")' | grep "$1.*\"$1\""`
		
		if [ -n "$output" ]; then
			echo "$1: PASS"
		else
			echo "$1: FAIL"		
		fi
	}

checkpackage "RNMImport"
#####Find files and execute them

    #!/bin/bash

    for i in $(find . -name *.ctl); do	
    	directory=`dirname $i`
        filename=`basename $i`
    	`cd $directory; execute $filename >> output.txt`
    done
    
#####Finding a process by name, shutting it down and forcefully terminating just in case

	#!/bin/bash

	function restartservice() {
	
	        service $1 stop;
	
	        RETRY_LIMIT=3
	        PID="$(ps -ef | grep $1 | grep java | awk ' { print $2 } ')"
	
	        counter=1
	        while kill -0 $PID >/dev/null 2>&1
	        do
	                echo "Waiting for tomcat to die, $counter"
	                sleep 3
	
	                if (( $counter == $RETRY_LIMIT )); then
	                        kill -9 $PID > /dev/null 2>&1
	                else
	                        counter=$((counter+1))
	                fi
	
	        done
	
	        service $1 start; 
	}

	restartservice tomcat7


###Working With Arrays

#####Adding an item to an array

    remotepids=("${remotepids[@]}" $pid)
    
#####Checking an array length

    if (( ${#remotepids[@]} > 0 )); then    
    echo -ne "\nStarted processes [ ${remotepids[@]} ] \n"
    echo ${remotepids[@]} > $pidsfile

###Dates

    `date +"%m-%d-%y_%T"-$serverhost`
    
###Functions

See: http://www.linuxjournal.com/content/return-values-bash-functions

local sets a local variable


#####Basic

    function clean {
        echo "Parameter is $1"
    } 
    
Pass variables with

    clean tomcatlogdir


#####Redirect output/error to dev null

    command > /dev/null 2>&1 &
