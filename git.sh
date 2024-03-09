# Git

# https://git-scm.com/docs
# https://github.com/OneSizeFitsQuorum/git-tips



git push origin refs/heads/master

git pull --rebase
git pull

git branch bc36/JIRA-233
git branch -a
git branch -d bc36/JIRA-233
git branch -D bc36/JIRA-233

git checkout master
git checkout bc36/JIRA-233

git fetch -a
git fetch -p
git fetch origin --prune

git remote prune origin
git remote show origin

git diff -w bc36/JIRA-233
git log -1
git log --oneline --graph
git status

# e.g. 1: usual dev workflow
# new a feature branch -> make change -> push to remote
git checkout -b bc36/JIRA-233
git add .
git commit -m "aba aba"
git push -u origin bc36/JIRA-233
# some other commit
git commit -am "comment"
git push origin bc36/JIRA-233
# after merge, clean the local branch
git fetch -p && git branch --v | grep "\[gone\]" | awk '{print $1}' | xargs git branch -D


# e.g. 2: merge master into branch (master will change)
git checkout master
git pull
git checkout bc36/JIRA-233
git merge master
git push


# e.g. 3: merge master into branch (master won't change)
git checkout bc36/JIRA-233
git merge master
git push


# e.g. 4: save changes in a branch, then go to another branch, then go back to continue our work
git stash
git stash push 
    # git stash push -m "aba aba"
git stash list
git stash pop
    # git stash pop stash@{0}


# e.g. 5: revert the a change / several changes
git revert commit-id

git revert commit-id...HEAD
git revert --no-commit HEAD~3..
git commit -m "your message regarding reverting the multiple commits"