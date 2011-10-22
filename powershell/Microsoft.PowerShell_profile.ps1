#git aliases
set-alias g "git"
function gst { git status $args }
function gpl { git pull $args }
function gpu { git push $args }
function ga { git add $args }
function gr { git rm $args }
function gme { git merge $args }
function gcp { git cherry-pick $args }
function gsh { git stash $args }
function gco { git commit $args }

#motech commands
remove-item alias:h
function w {cd C:\Users\balajid\Documents\thoughtworks\motech\GHANA-National }

#mvn aliases
function m { mvn $args }
function mci { mvn clean install $args }
function mjr { mvn jetty:run }

#common
set-alias c "cls"
function h { cd ~ }

function ssh-agent { C:\Progra~2\Git\bin\ssh-agent.exe }
function ssh-add { C:\Progra~2\Git\bin\ssh-add.exe }

# Load posh-git example profile
. 'C:\Users\balajid\gitprojects\posh-git\profile.example.ps1'

