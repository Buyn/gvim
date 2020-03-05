#! /bin/sh
echo "start ading aliases. use '. ./' for permnent"
# git config --global user.name "BuYn"
# git config --global user.email "buyn.tex@gmail.com"

alias st='git log --oneline -n 13; git status'
alias stf='git log --oneline ; git status'
alias sw='git show'
alias gd='git diff'
alias ch='git checkout'
alias tag='git tag'
alias gb='git branch '
alias che='git checkout experemental; st'
alias chm='git checkout master; st'
alias gbe='git branch experemental; st'
alias gbed='chm; git branch -d experemental; st'
alias gme='chm; git merge experemental; st'
alias gmm='che; git merge master; st'
alias gh='git push; st'
alias ghe='git push origin experemental; st'
alias gad='git add . ; st'
alias gadi='git add -i'
alias gitresetsoft-1='git reset --soft HEAD~1; st'
alias grm='git rm --cached'
alias gig='echo $1 >> .gitignore'
alias keyup='eval $(ssh-agent -s)'
alias acc='st; git commit -a -m'
alias ac='git status; git commit -a; git log --oneline; git status;'
alias acae='git commit --amend; git log --oneline; git status;'
alias aca='git commit --amend --no-edit; git log --oneline; git status;'
alias glog='git log --oneline'
alias glogp='git log --pretty=oneline'
alias glogt='git log --graph --oneline --decorate --all'
alias glogc='git log --name-status'

alias gmme="git checkout master; git merge experemental; git checkout experemental"
alias gmem="git checkout experemental; git merge master; git checkout master"
alias gmte="git checkout test; git merge experemental; git checkout experemental"
alias gmmt="git checkout master; git merge test; git checkout experemental"

