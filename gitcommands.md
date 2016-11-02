## Config

.gitconfig

    blah:~$ cat .gitconfig 
    [user]
    	name = Jonathan Holloway
    	email = jon.holloway@brightpearl.com
    [color]
    	ui = true
    [status]
    	relativePaths = true
	
    git config --global color.ui true
    
Display the remote repository information:

    git config --get remote.origin.url
    git remote show origin

Display paths relative to non-root

    git config --global status.relativePaths true

## Logs and Diffs

Show the log for a set of commits:

	git log --max-count=2

Show a plain status:

     git status --porcelain

## Stashing

Store a stash
	
	git stash
	
List stashes

	git stash list
	
Apply a stash

	git stash apply stash@{0}


## Committing

Add all modified files

	git add -A

Commit the files:
	git commit -m "Message"
     
## Branches and Merging

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

## Dealing With Conflicts

Pull changes and merge conflicts

    git pull

Pull changes (no merge)

    git fetch

## Abandon Local Changes

Replace with HEAD and abandon all local changes:

	git reset --hard HEAD
	
Remove untracked files that have been added locally

	git clean -f 
	
Abandon the local checkout:

	git checkout --theirs xhprof-bp/xhprof_bp_analyser/XHProfRunsAnalyser.php

## Creating a branch

```
git checkout master
git pull
git checkout -b branchname
git push -u origin branchname
```

## Creating a patch from outstanding changes

```git diff --cached > patch.txt```

## Creating a patch and applying it

```
git format-patch -1 {commit-id}
git apply --stat fix_empty_poster.patch
```

## Merging branch into master

```
git checkout aq
git merge origin/master
```
