Branches and Merging
--------------------

Create a branch and switch to that branch:

    git checkout -b issue-3498
    
Switch back to master

    git checkout master
    
Now, let's merge our fix back into master

    git checkout master
    git merge issue-3498
    
and delete the branch (we no longer need it since it's merged in)

    git deletebranch -d issue-3498
    
Dealing With Conflicts
----------------------

