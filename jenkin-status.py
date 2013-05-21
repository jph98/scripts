#!/usr/bin/env python

import urllib
import json

machine="cisjava1.mango.local"

url = "http://cismaster:8080/jenkins/computer/" + machine + "/api/json"

json_data = urllib.urlopen(url).read()

data = json.loads(json_data)

offline = data["offline"]
print offline
