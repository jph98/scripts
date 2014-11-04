Prettifying JSON

    echo '{"json":"obj"}' | python -mjson.tool
    
Searching and deleting lines in a file using sed:

    sed '/matchingline/d' access_log > access_log_new

Show all TCP connections on local machine:

    sudo netstat -nap --tcp
    
Getting CURL to ignore SSL certificate checks:

    curl -k https://endpoint.com
    
Grepping with before and after context:

    grep -A 4 -B 4 Expression
    
Grepping for an expression recursively with a wildcard filename (--include):

    grep -r "Process finished" . --include "*.log"

Finding all files that DO NOT contain a given grep expression (-L):

    grep -Lr "Process finished" . --include "*.log"

Screen (The very basics):

    screen (new screen session)
    screen -r (reattach)
    screen -ls (list screens)
    screen CTRL+A d (detach)

Replacing text in many files:

    sed -i 's/foo/bar/g' *
