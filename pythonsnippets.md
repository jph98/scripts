##Python Snippets

###Variable Handing

####Main Method

    if __name__ == "__main__":

#####Optional arguments to a function

    def build_arg_kw(*cmds):
      args = []
    	for c in cmds:

#####Read input from a user

    version = raw_input("\nEnter Option (or return to skip): ")

#####Option parsing with optparse

    parser = OptionParser()    
    	parser.add_option("-b", action="store_true", dest="buildall", default=False, help="Rebuild")
    	parser.add_option("-a", dest="packagename", help="Append a name")
    	(options, args) = parser.parse_args()
    	
    	if options.buildall:
    		print "Building all"
    		build_all_packages()
    	elif options.packagename:		
    		add_description_from_file(options.packagename)
    	else:
    		print parser.print_help()


###Command Execution

#####Executing a command and return the output

    def exec_cmd(args):
      p = subprocess.Popen(args, shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    	o, e = p.communicate()
    	lines = []
    	if o is not None:				
    		lines = o.split("\n")	
    	lines = [line for line in lines if line is not ""]
    	return lines	 	
      
##Regular Expressions

#####Capture a regular expression and return matched group

    re.search(r"/([0-9.]+)/", o).group(1)

###Operating System Level

####Ensuring a user is root 

    if not os.geteuid()==0:
      sys.exit("\nYou need to be root to run this script")
