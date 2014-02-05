#!/usr/bin/env python
import sys
import re
SVNLOOK = 'svnlook'
MIN_MESSAGE_LENGTH = 10
 
# Gets a command's output
def commandOutput(command):
    import subprocess
    process = subprocess.Popen(command.split(), stdout = subprocess.PIPE)
    return process.communicate()[0] # 0 is stdout
 
# Returns an array of the changed files' names
def getChangedFiles(svnPath, transaction):
 
    output = commandOutput('%s changed %s --transaction %s' % (SVNLOOK, svnPath, transaction))
 
    # The output from svnlook looks like the following:
    # U   folder/file1.java
    # A   folder/file2.java
    # where U means updated and A means added
    def changed(fileName):
        return len(line) > 0 and line[0] in ('A', 'U')
    changedFiles = [line[4:] for line in output.split('\n') if changed(line)]
 
    # svnlook inserts an empty line, so output.split() will have an extra
    # line with nothing in it - ignore the last lines if they're empty
    while 0 == len(changedFiles[-1]):
        changedFiles = changedFiles[:-1]
    return changedFiles
 
# Checks that the message is a minimum length
def checkMessage(svnPath, transaction):
    output = commandOutput('%s log %s --transaction %s' % (SVNLOOK, svnPath, transaction))
    if not re.match(r'\b(?:id)\s*[#]{0,1}(\d+)\b', output, re.I):  
        sys.stderr.write('\nCOMMIT FAILED: Your commit message MUST NOT be empty and MUST start with ID, \n\n e.g. ID 6879: Refactoring the execution profile service\n')
        return 1
    else:
        return 0
 
svnPath = sys.argv[1]
transaction = sys.argv[2]
files = getChangedFiles(svnPath, transaction)
errorCount = checkMessage(svnPath, transaction)
 
# for file in files:
# Prefer tabs for indentation
# Skip .txt files
# if not file.endswith(".txt") and not file.endswith(".sql"):
# errorCount = errorCount + stringsInFile(svnPath, transaction, [' {4}'], file)
 
sys.exit(errorCount)
