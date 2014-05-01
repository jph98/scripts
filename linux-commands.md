Prettifying JSON

    echo '{"json":"obj"}' | python -mjson.tool
    
Searching and deleting lines in a file using sed:

    sed '/matchingline/d' access_log > access_log_new
