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
