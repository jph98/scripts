Config
------

    git config --global color.ui true
    
Display the remote repository information:

    git config --get remote.origin.url
    
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

List all branches

    git branch -a
    
List remote branches

    git branch -r

Switch to a branch

    git checkout -b feature-x

Compare changes on branch with master:

    git diff --name-status master

Dealing With Conflicts
----------------------

Pull changes and merge conflicts

    git pull

Pull changes (no merge)

    git fetch
