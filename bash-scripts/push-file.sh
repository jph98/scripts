#!/bin/bash
################################################################################
#          FILE:  push-file.sh
#   DESCRIPTION:  Push a file to git repo
################################################################################

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Usage: $0 <filename>"
    exit 
fi

file=$1
git add $file; git commit -m "Added $file"; git push origin master
