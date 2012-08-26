source $HOME/Code/zsh-git-prompt/zshrc.sh
PROMPT='%#%f '
PATH=$PATH:$HOME/.rvm/bin:$HOME/Programs/bin:/usr/local/mysql/bin:/opt/local/bin
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export JAVA_OPTS="$JAVA_OPTS -Xms512m -Xmx2048m -XX:MaxPermSize=1024m -XX:+UseConcMarkSweepGC -Djava.awt.headless=true"
export MAVEN_OPTS=$JAVA_OPTS

#VirtualBox headless
alias startvm='VBoxHeadless --startvm centos &'
alias stopvm='VBoxManage controlvm centos poweroff'

#ghana-national
alias w='cd ~/Code/motech/ghana-national'

#mvn
alias mci='mvn clean install'
alias mjr='mvn jetty:run'

#git
alias g='git'
alias gpl='git pull'
alias gpu='git push'
alias gst='git status'
alias ga='git add'
alias gsh='git stash'
alias gco='git commit'
alias gr='git rm'
