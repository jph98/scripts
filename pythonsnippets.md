##Python Snippets

Best Practices:
 - https://django.2scoops.org/
 - http://google-styleguide.googlecode.com/svn/trunk/pyguide.html

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

#####Processing a file line by line matching on character found

	with open("my.sql", "rb") as f:
		for line in f.readlines():			
			if "`" in line :
				print "Found " + line
			
#####Processing a gzip file

    with closing(tarfile.open(filename, "r:gz")) as tar:
        	descfile = get_description_name(filename)
    		content = tar.extractfile(descfile).read()
    		return content
    		
#####Text replacement within a context

Replacing chars within a file (within a quote context) and writing those to a new file

	def replace_chars_in_quotes(line):
		outline = ""
		in_quotes = False
		for char in line:		
			if char == quotechar and in_quotes == True:
				outline += char
				in_quotes = False
			elif char == quotechar:
				outline += char
				in_quotes = True					
			elif in_quotes:
				if char.islower():
					outline += char.upper()
				else:
					outline += char
			else:
				outline += char	
		return outline
	
	def process_file(quotechar, outfile, infile):
		with open(outfile, "wt") as fout:
			with open(infile, "rt") as fin:
				for line in fin:
					if quotechar in line:				
						fout.write(replace_chars_in_quotes(line))
					else:
						fout.write(line)
	
	infile = "noael.sql"
	outfile = "noael.sql.out"
	quotechar="|"
	print "Processed " + infile + " and wrote " + outfile
	process_file(quotechar, outfile, infile)
	
            
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

and: http://www.outofwhatbox.com/blog/2010/07/python-decorating-with-class/

###Generators

Examples here - http://linuxgazette.net/100/pramode.html



Ecosystem Overview
Web Application Development

Flask

Django
Desktop Development

    PyGTK - http://www.pygtk.org/
    WxPtyhon - http://wxpython.org/
    Tkinter - http://wiki.python.org/moin/TkInter
    PyQt - http://wiki.python.org/moin/PyQt

Testing

Lettuce
Messaging

Celery - distributed task queue (http://www.celeryproject.org/), relies on Redis, RabbitMQ as a broker.
Infrastructure

Salt

http://www.youtube.com/results?search_query=google+python+class&aq=f

Python 3.0 is not backwards compatible with earlier versions of Python.

Python and Vim - http://dancingpenguinsoflight.com/2009/02/python-and-vim-make-your-own-ide/

Pleac Python Cookbook - http://pleac.sourceforge.net/pleac_python/
Python Language Notes and Books

Advanced Python:

    http://www.rexx.com/~dkuhlman/python_201/python_201.html
    http://gael-varoquaux.info/computers/python_advanced/index.html
    Python Grimoire - http://the.taoofmac.com/media/Python/Grimoire/tiddlygrimoire.html
    Python For Fun - http://www.openbookproject.net/py4fun/

Python Cookbook

    http://code.activestate.com/recipes/langs/python/
    Effbot - http://effbot.org/librarybook/

Additional Python Books:

    Text Processing With Python
    High Performance Python
    Python for Unix and Linux System Administration
    Grey Hat Python (Hardcore C Stuff)

Can be embedded within C - http://docs.python.org/c-api/

Can be embedded with IPython - http://ipython.scipy.org/doc/manual/html/interactive/reference.html#embedding-ipython

Used at Google quite a bit. Also supported by Google App Engine.

    http://www.python.org/dev/peps/pep-0008/
    http://panela.blog-city.com/python_at_google_greg_stein__sdforum.htm

Python Distributions

* Pypy - http://codespeak.net/pypy/dist/pypy/doc/
* Jython - Python for Java
* IronPython - Python for .NET
* Unladen Swallow (Google Improvements) - http://code.google.com/p/unladen-swallow/
* Activestate ActivePython - http://docs.activestate.com/activepython/2.6/pypm.html
Frameworks

Stackless Python - http://en.wikipedia.org/wiki/Stackless_Python

    Provides a micro threading framework for lightweight threading
    Twisted Event Driven Networking Engine - http://twistedmatrix.com/trac/
    Scapy (Networking) - http://www.secdev.org/projects/scapy/
    Spring Python - http://springpython.webfactional.com/
    Data Processing - http://pyprocessing.berlios.de/
    PSI - Access to system information - http://psychofx.com/psi/

Documentation

Generates API docs from the various docstring comments in the code.

    Epydoc
    Sphinx - http://sphinx.pocoo.org/

Python Tools and Utilities

    Eclipse Plugin - http://pydev.sourceforge.net/download.html
    Python-setuptools. This is part of the Python Enterprise Application Kit: http://peak.telecommunity.com/ This provides easy_install - http://peak.telecommunity.com/DevCenter/EasyInstall
    PIP is a replacement for easy_install
    Setup python-paramiko. This provides SSH connectivity.
    Fabric Deployment - [[Fabric Notes]]
    Werkzeug (Useful Tools and Utilities for Writing Frameworks) - http://werkzeug.pocoo.org/

Easy_install

    Python easy_install works on the basis of eggs. These can be installed via: easy_install blah.
    You can also install from source normally using: python setup.py install

Pip works from source, it cannot work from eggs.

Python Package Index - http://pypi.python.org/pypi

Monitor File system Changes Pyinotify - http://trac.dbzteam.org/pyinotify
Extension Modules

Can write extension modules in Python using a number of wrappers:
* Pyrex - http://wiki.python.org/moin/Pyrex
* SWIG - http://www.swig.org/Doc1.3/Python.html
Build and Release Tools

    Distutils (upload to Pypi) - http://docs.python.org/library/distutils.html
    Fabric
    zc.buildout - http://www.buildout.org/install.html
    Can package up a Python application and dependencies using Freeze - http://wiki.python.org/moin/Freeze
    VirtualEnv - http://pypi.python.org/pypi/virtualenv - looks to be best
    PyApp 
    Paver - http://www.blueskyonmars.com/projects/paver/
    Scon - http://www.scons.org/

[+Database Tools+]

* psycopg - Postgres Driver and Library http://www.devx.com/opensource/Article/29071
* MySQLdb - http://sourceforge.net/projects/mysql-python/

[+ORM Tools+]

* SQLAlchemy
* SQLObject
* Django has own ORM

[+XML Libraries+]

* Amara 2 XML Toolkit - seems like a good choice, http://xml3k.org/Amara2 . Differences between 1.x and 2.x are fairly substantial.
* ElementTree - xpath support is poor, http://effbot.org/zone/element-index.htm
* Pulldom - for parsing less complex documents
* Working with XML - http://codespeak.net/lxml/

[+Web Services+]

* SOAPlib - http://trac.optio.webfactional.com/
* SUDS - https://fedorahosted.org/suds/

Python Web Services http://pywebsvcs.sourceforge.net/
* Provides SOAPpy, Zolera (ZSI-2.0) and wstools

SOAPpy is quite old and may not work, tread with care, also with Zolera.

[+HTTP and HTML Libraries+]

* HttpClient - http://code.google.com/p/httplib2/
* urllib, urrlib2. Also have httplib
* HTML Parsing with - http://www.crummy.com/software/BeautifulSoup/

* Paste - http://pythonpaste.org/
* Webob (Low Level HTTP Testing Request/Response) - http://pythonpaste.org/webob/

* High Level Web Browser - http://wwwsearch.sourceforge.net/mechanize/

[+Operating System Internals and Scripting+]

* PExpect - http://pexpect.sourceforge.net/pexpect.html
* Performance-Co-Pilot Monitoring - http://oss.sgi.com/projects/pcp/

[+Templating+]

* http://wiki.python.org/moin/Templating
* http://stackoverflow.com/questions/612788/best-python-templating-library-to-facilitate-code-generation
* Jinja - http://jinja.pocoo.org/

[+Testing+]

* Assertions Effectively - http://wiki.python.org/moin/UsingAssertionsEffectively
* Desktop Functional Test Tool - https://fedorahosted.org/dogtail/
* Test Automation Framework - http://sourceforge.net/projects/staf/
* Nose (extends unittest) - http://somethingaboutorange.com/mrl/projects/nose/0.11.1/
* http://www.diveintopython.org/unit_testing/index.html

[+Encryption/Decryption+]

* NCrypt - Wrapper for OpenSSL built with Pyrex - http://tachyon.in/ncrypt/

http://vermeulen.ca/python-cryptography.html

* YawPyCrypto - http://yawpycrypto.sourceforge.net/
* EzPyCrypto (Easy API on top of PyCrypto v.basic) - http://www.freenet.org.nz/ezPyCrypto/
* PyCrypto - http://www.amk.ca/python/code/crypto.html
* RSA - http://stuvel.eu/rsa
* Chillkat (Commercial) - http://www.chilkatsoft.com/rsa-python.asp
* MeTooCrypto (OpenSSL Wrapper) - http://chandlerproject.org/bin/view/Projects/MeTooCrypto

[+Servers and Web Frameworks+]

* TurboGears - http://turbogears.org/
* [[Django Notes]] - http://www.djangoproject.com/
* Pylons - http://pylonshq.com/
* CherryPy
* Paste
* Spawning
* Twisted.web

Modules For Existing Servers:
* mod_wsgi or isapi_wsgi

[+Games+]

PyGame - http://www.pygame.org/news.html

[+Long Running Tasks+]

* Django Queue - http://code.google.com/p/django-queue-service/
* Could also put it on a JMS queue using ActiveMQ and pyactivemq - http://code.google.com/p/pyactivemq/

[+Search+]

* solrpy client - http://code.google.com/p/solrpy/
* pylucene - http://lucene.apache.org/pylucene/

[+Design Patterns+]

* Google Design Patterns - http://www.youtube.com/watch?v=0vJJlVBVTFg
* Painless Python - http://www.youtube.com/watch?v=bDgD9whDfEY

[+GUI+]

* Curses with Python http://docs.python.org/library/curses.html

[+Python Web Services+]

* GData - http://code.google.com/p/gdata-python-client/
* Python Twitter - http://code.google.com/p/python-twitter/
* libgmail - http://libgmail.sourceforge.net/
* Search - http://www.catonmat.net/blog/python-library-for-google-search/ or http://pygoogle.sourceforge.net/

[+Generating Graphs+]

* Graphy - http://code.google.com/p/graphy/

[+Misc+]

* PyCuda - http://documen.tician.de/pycuda/
* Emphasis on readability
* OO, imperative and functionality
* Metaprogramming
* MAgic Methods
* pyDBC - Design By Contract
* Dynamic typing. Duck typing.
* Strongly typed however, can't add int to string
* Reference Counting
* cycle detecting garbage collector
* Psyco - JIT compiler
* Pythonic - means it uses Python idioms well
* Allows for metaprogramming and reflection
* Pyp - self hosting implementation of Python written in Python
* Cython and Pyrex can be used to compile to C
* Python Enhancement Proposals (PEP's)
* CPython, Stackless Python (not based on C stack), Jython and Pypy
* mod_wsgi - defines a simple and universal interface between web servers/web applications in Pythonic
* Werkzeug - http://werkzeug.pocoo.org/
* Boost.Python - enables interoperability between C++ and Pythonic - http://www.boost.org/doc/libs/1_39_0/libs/python/doc/index.html
* Stackless Python In Eve - http://www.slideshare.net/Arbow/stackless-python-in-eve




=====

Overview

Based off - http://jfine-python-classes.readthedocs.org/en/latest/

Python Metaclasses by Example - http://eli.thegreenplace.net/2011/08/14/python-metaclasses-by-example/

Double quote and single quote...

Using the shell

Chalk and talk ?

Exception hierarchy with Python
Simple Class

class A
	att = 3

Duck Typing

You don't have to have the right type, just behaviour.
Type

Type takes three arguments:

A = type("A", (), {})

This represents:

    type ('name', bases, dict)

__ - name mangling

>>> type(A)
<type 'type'>

>>> A.__dict__
dict_proxy({'__dict__': <attribute '__dict__' of 'A' objects>, '__module__': '__main__', '__weakref__': <attribute '__weakref__' of 'A' objects>, '__doc__': None})

Lets put an attribute (aaa) into the class:

A = type("A", (), {"aaa": 5})

Tuple with one elemtens needs a comma

(int,)

Subclass int with (subclassing builtins):

A = type("A", (int,), {"aaa": 5})

and create an instance with:

A()

And the following gives you Python 3 type behaviour on classes (read more):

__metaclass__ = type

Methods - functions that belong to the class.  We can get hold of them by asking for the dict.

    Not bound
    Static

class A:
	def hi(name):
		print(name)
	def bye(name):
		print("so long")

You can look at the dictionary by assigning.

d["hi"]
d["hi"]("class")

Bound and Unbound Functions

>>> class A:
...     def f(self, x):
...             return self, x
...
>>> A.f
<unbound method A.f>
>>> A.__dict__['f']
<function f at 0x10048eed8>
>>> a = A()
>>> type(a)
<type 'instance'>
>>> a.f
<bound method A.f of <__main__.A instance at 0x1004a6878>>

Address where the object is stored as a decimal:

id(a.f)

And:

>>> f = A.__dict__["f"]
>>> f(1,2)
(1, 2)

Alias the function call to the list:

a = []
app = a.append
app(3)

What we have above is a first class object.

Javascript does not have bound methods, it's prototypical...  pseudo bound methods.
Properties

Decorator with:

class A:
	@property
	def size(self):
		return "My own business"
A

If we call size on A:

# Property object
A.size
<property object at 0x100497788>

and the instance returns the actual result of the method call:

a.size
"My own business"

Property is a way of controlling what a.size() does in relation to the request:

There are a number of built in decorators...

Why properties?

They use the attribute interface.

Put a function behind the a.b interface.

Example: Objects stored in a database, all you're given is the key.  It has a:

    Color
    Address

etc...

By using the property 

def address(self):
	record = self.get_record()
	return record['address']
 
# Alternative to the @property syntax
address = property(address)

Example: Dictionary where all the keys are lowercased before use.

__getitem__ and __setitem__ are magic methods.

class A:
	def __getitem__(self, key):
		return "you asked for %s" % key
a = A()
a["3"]

Another example:

class A:
	def __init__(self):
		# Make sure data is not part of the API
		self._data = dict()
	def __getitem__(self, key):
		return self._data[key.lower()]
	def __setitem__(self, key, value):
		self._data[key.lower()] = value	

Dispatch Table

Sequence of codes with data.  Want to handle these.

Have a dictionary of functions that can be called by name.

for key, value in d:
	dispatch[key](value)

Access Modifiers

Not like Java where you have private, default, protected and public.

You can make things private using the single underscore symbol.

But the Python way is to have everything open.  The _ is more of a stylistic mechanism to say you really don't want to call this.
Subclassing Immutable Types

If you are subclassing immutable classes you must use __new__ instead of __init__.
Metaclasses

Don't use them unless you really need to in general.

class A:
	pass
 
a = A()
type(a)

There are other ways of doing this as well...

mytype = type("B", (), {});

class C:
	__metaclass__ = mytype

Give mytype a getitem method using a lambda (shorthand for writing a function):

mytype.__getitem__ = lambda self, key: (self, key)	

Symbolic Logic - computer science in the 1930's.  Turing/Church.
Simple Class with Extension Example

Define a simple class which extends another and overrides the method with:

 #!/usr/bin/env python
class Name:
	def say(self):
		"""Say function"""
		print "Hello World "
class SayName(Name):
	
	def __init__(self, name):
		"""Simple Constructor"""
		self.name = name
	def say(self):
		"""Say function"""
		print "Hello World %s " % self.name
if  __name__ =='__main__':
	
	n = Name()
	print "ClassName: %s " % n.__class__.__name__
	n.say()
	n = SayName("Jon")
	print "ClassName: %s " % n.__class__.__name__
	n.say()



