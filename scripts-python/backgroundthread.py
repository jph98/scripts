#!/usr/bin/env python

import threading
import time

def background():
        i = 0
        while (i < 5):
                print "[background] Sleeping - " + str(i)
                time.sleep(1)
                i += 1

def do_stuff():

    # Create daemon thread
    t = threading.Thread(target=background)
    t.daemon = True

    print "starting"
    t.start()

    # Do other stuff
    print "started"
    while t.is_alive():
        print "[main] Doing other stuff"
        time.sleep(0.5)

if __name__ == "__main__":
        do_stuff()
