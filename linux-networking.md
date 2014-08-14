Linux Networking
================

See - http://shop.oreilly.com/product/9780596006433.do

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

Getting a MAC address, use arp:

    arp
    
Network Statistics:

    iptraf
    ntop
    
Detailed network analysis:

    tcpdump

Scanning for open ports:

    nmap

Traceroute and ping:

    mtr
    
Wireshark
---------

Specify the interface to capture on (and a filter):
* port http - just capture http
* tcp port http - 

Filter with the following:
* http.request
* http.request.method=="POST"

Specify Follow TCP Stream to get the combined TCP and HTTP packets
* Change Entire Conversation to just HTTP
* This can also be filtered
