##Linux Command Snippets

###Terminal Related

Clear the terminal

    CTRL+L

Screen

    screen
    screen ls
    
New screen

    CTRL+A c

Specify screen to view

    CTRL+A n

###Web Related

#####Start a Python webserver to serve files

    python -m SimpleHTTPServer

###Utility Commands

#####Man Commands

Display the ASCII table

    man ascii
    
Display a calendar

    cal
    
Generate a hex dump from a binary file

    xxd blah.bin

###Text Processing

#####Search and replace text in multiple files

    perl -pi -w -e 's/SEARCH/REPLACE/g;' *.txt
    
###Processes

Run the command in the background and ignore hang up signal

    nohup command.sh &

###Networking

Start a tunnel from some machine's port 80 to your local post 2001 now you can acces the website by going to http://localhost:2001/

    ssh -N -L2001:localhost:80 somemachine

List all ports with their applications running on that port

    netstat -tlnp

What is my IP address

     curl ifconfig.me

Calculate MD5Sum for a Phrase

     echo -n hello | md5sum

##OSX Command Snippets

##### Finding files correctly

    mdfind -name homebrew
    
