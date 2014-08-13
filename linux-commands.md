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
    
Grepping for an expression recursively with a wildcard filename:

    grep -r "Process finished" . --include "*.log"
