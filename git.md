#GIT:

 

##Rename branch:

 

###Local:

git checkout old-branch

git branch –m new-name


###Remote:

git push origin :old-name new-name

 

 

###Delete tag:

git push --delete origin tagname

####Local:

git tag --delete tagname


Refresh branches from remote
git remote prune origin

####Update repository with(it automatically prunes all stale references)

git fetch -p
