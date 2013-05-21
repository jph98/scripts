#Bash Snippets


##Basics and Rules of Thumb


* Always use round brackets for numeric comparisons.  With square brackets you have to use -eq instead of == ascii comparison


##Variable Handing


###Die unless arguments are correct


die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 3 ] || die "Usage: $0 arguments "

Check Argument Set Or Default Value
-----------------------------------

[ -z "$RPATH" ] && RPATH="/usr/bin/R"


Shifting variables
------------------

# Grab the servername then shift
SERVER=$1
shift

Looping Constructs
==================

Simple for loop
---------------

for JMETERTEST in "$@"
do
    <stuff>
done

Executing Things
================

Backtick
--------

numscripts=`ls -l metrics*.rb 2> /dev/null | wc -l`

Subshell
--------

for cmd in $(ls metrics*.rb)

