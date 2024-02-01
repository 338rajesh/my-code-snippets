# Basics

+ `git add \path\to\file`
+ `git add .`  in same directory


+ `git checkout -b new_branch_name`  # it creates and checksout a new branch


## Push & Pulls

+ Handling unrelated histories
	*  `git pull origin main --allow-unrelated-histories`

+ `git fetch`
+ `git pull`


+ Creating new branch on the remote by pointing a local branch  
	* `git push -u origin local_branch_name`
+ 

+ To compare if two branches are identical
	* `git diff branch_1 branch_2` 
	* `git diff origin/branch_1 origin/branch_2` 
+ To update a branch_1 from another branch_0
	* `git checkout branch_1`
	* `git merge branch_0`
+ Count the number of lines in a repo: From repo directory 
	`git ls-files | xargs cat | wc -l`  # lists total number of lines
	`git ls-files | xargs wc -l`  # lists the number of lines for each file
	`git ls-files | xargs wc -l | sort -n`  # lists the number of lines for each file and sorts in increasing order
	`git ls-files | xargs wc -l | sort -rn`  # lists the number of lines for each file and sorts in decreasing order
