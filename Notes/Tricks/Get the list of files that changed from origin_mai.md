**Get the list of files that changed from origin/main and a branch to feed it to vim**
```
1. git diff --name-only origin/main <a_branch> > files.txt
2. vim $(cat files_2.txt)
```
