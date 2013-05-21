#!/usr/bin/env python

import urllib

url = "http://cis:8080/jenkins/api/python"
obj = eval(urllib.urlopen(url).read());
for job in obj['jobs']:
   print job['name']
