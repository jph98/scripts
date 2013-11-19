#!/usr/bin/env python

import urllib
import json

machine="javamachine1"

url = "http://ciserver/jenkins/computer/" + machine + "/api/json"

json_data = urllib.urlopen(url).read()

data = json.loads(json_data)

offline = data["offline"]
print offline
