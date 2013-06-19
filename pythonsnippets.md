##Python Snippets

###Class Skeleton

	class Person(object):

		name = "Foo"
	
		def getname(self):
			print self.name

	person = Person()
	person.getname()

#####Private method

	"""[private] Serialize the status as JSON"""
	def __serialize_status():

###Conversions and Types

#####Display methods on an object

	dir(itertools)
	
#####Handling Doubles

	percent_failed = (Decimal(num_failed) / Decimal(total_num)) * 100

#####Strings and Formatting

	return "{0} Complete ({1}% Failed) of {2}".format(complete, failed, total)

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

###File/Directory Handling

#####Existence of a file

	if os.path.exists(specificfile):
	
#####Concatenate file/directory

     namepart + os.sep + "DESCRIPTION"
     
#####Open a file with auto closing

    with closing(open(file, "rb")) as f:

#####Processing a gzip file

    with closing(tarfile.open(filename, "r:gz")) as tar:
        	descfile = get_description_name(filename)
    		content = tar.extractfile(descfile).read()
    		return content
            
#####Moving a file

Other file/directory operations are available in shutil - http://docs.python.org/2/library/shutil.html

    shutil.move(packages_file, packages_file + ".bk")

######Processing a directory and filtering by list comprehensions

    files = [ f for f in listdir(path) if isfile(join(path,f))

###Collections

#####Tuple Example

A tuple is an immutable list

	 tup = ("1", "2", "3") 
	 
#####List Example

Create a list and slice based on the second item to the end

	example_list = ["1","2","3"] 
	example_list[:2]
	example_list.append("4")
	
List arithmetic with:

	[1,2] + [3,4]

Checking for an item in a list

	if "1" in example_list:
	
Checking for the index of an item in a list

	example_list.index("2")
	
#####Dictionary Example

Operator is also very helpful here - http://docs.python.org/2/library/operator.html

	example_dict = {"a":"1", "b":"2"}
	example_dict["a"] = "5" 
	example_dict.keys()
	example_dict.values()	
 
###List Comprehensions and Functions

See this article for more - http://www.secnetix.de/olli/Python/list_comprehensions.hawk

#####Simple Comprehension

Applying a function to an item in each list:

	words = ["cat", "dog", "apple"]
	[w.upper() for w in words]

#####Filtering a list of words based on a given function:

	words = ["cat", "dog", "ab", "blah"]
	[item for item in words if len(item) > 2] 
	
#####Joining a list of items in a dict

	return ";".join(["s" % (k, v) for k, v in params.items()]) 

#####Lambda Example

Map a specific function to a list of integers:

	foo = [1,2,3,4]
	print map(lambda x: x * 2 + 10, foo)

#####Writing Functional Loops

http://www.ibm.com/developerworks/linux/library/l-prog/index.html

###Regular Expressions

#####Capture a regular expression and return matched group

    re.search(r"/([0-9.]+)/", o).group(1)

#####Matching a specific pattern

	modpat = re.compile(r".*(cat_.*.txt)")
	name = modpat.match(p)
	if name:

###Operating System Level

####Ensuring a user is root 

    if not os.geteuid()==0:
      sys.exit("\nYou need to be root to run this script")

###Concurrency

#####Forking several processes and waiting for completion

    jobs = []

	# Filter out svn metadata (e.g. .svn), only process directories
	if jobs in jobs:
		process = Process(target=<function>, args=(<argstofunction>,))
		jobs.append(process)
		process.daemon = True
		process.start()

	# Wait for each daemonized job to finish up
	for job in jobs:
		job.join()

#####Sleep

	time.sleep(interval)

###Decorators and Reuse

Lots of examples of real world decorators here - http://wiki.python.org/moin/PythonDecoratorLibrary

and metaprogramming here - http://www.onlamp.com/lpt/a/3388

	class logger(object):
	
	    def __init__(self, f):
	        self.f = f
	
	    def __call__(self):
	        print "call dec"
	        self.f()
	        print "done dec"
	
	
	@logger
	def myfunction():
	    print "\tmyfunction"
	
	myfunction()
	
###Descriptors

See: http://nbviewer.ipython.org/urls/gist.github.com/ChrisBeaumont/5758381/raw/descriptor_writeup.ipynb
	
###Generators

Examples here - http://linuxgazette.net/100/pramode.html
