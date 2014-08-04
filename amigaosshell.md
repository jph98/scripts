Amiga Shell Commands
====================

See - http://wiki.amigaos.net/wiki/AmigaOS_Manual:_AmigaDOS_Command_Examples

Also see - http://www.bombjack.org/commodore/amiga-books.htm

Mount the CFCard from Mint with the following:

    mkdir /mnt/amiga
    sudo mount -t affs /dev/sdc1 /mnt/amiga

To move files about:

    sudo su

The filesystem layout for affs is as follows:
* S - system
* L - libraries
* Programs
* archives - my transfer folder for files

Make sure you look for the device under /dev/sdx first

Modify S:Shell-Startup for aliases

Close the prompt

    endcli
  
Edit a file

    ed <filename>
  
Copy a file

    copy <file> TO <location>
    
Change up a directory:

  /

Show all running programs:

    status

Kill a running program:

    break <processnumber>
    
Study Plan

* Overview of Basic
* Overview of Amiga C
* Overview of 68000 programmingc
