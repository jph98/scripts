haml
====

See http://haml.info/

Reference - http://haml.info/docs/yardoc/file.REFERENCE.html

Tags
----

    %tag
    %tag {}
    
* HTML passes through unmodified
* Escape characters with /

Global Variable
---------------

Local Variable
--------------

    - type = 'Audio'

Comments
--------

Sent to the browser:
    / Declare Variable

Stripped out by the engine:
   - # = My comment
  
Loops
-----

    - runlabelgroups.each do |group|
          - group
