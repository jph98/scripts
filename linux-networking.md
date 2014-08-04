Linux Networking
================

Overview
--------

Tuning TCP:
* http://engineering.chartbeat.com/2014/02/12/part-2-lessons-learned-tuning-tcp-and-nginx-in-ec2/
* http://www.krenel.org/tcp-time_wait-and-ephemeral-ports-bad-friends/ 

Show all TCP connections on local machine:

    sudo netstat -nap --tcp
    
Generating network packets, use packeth:

    http://packeth.sourceforge.net/packeth/Home.html
    
Getting all IP's on the network:

    nmap -sP 192.168.1.*

Network Statistics:

    iptraf
    ntop
    
Detailed network analysis:

    tcpdump

Scanning for open ports:

    nmap

Traceroute and ping:

    mtr
    
