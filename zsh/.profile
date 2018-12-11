alias g='git'
alias gpl='git pull'
alias gpu='git push'
alias gst='git status'
alias ga='git add'
alias gsh='git stash'
alias gco='git commit'
alias gr='git rm'
alias gfu='git fetch upstream'

alias yd="youtube-dl"
alias ls="ls -G"

alias m='mvn'
alias mcp='mvn clean package'
alias mci='mvn clean install'
alias mc='mvn clean'

alias e="emacsclient -t"
alias ec="emacsclient -c"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	PATH="$HOME/.local/bin:$PATH"
fi

if [ "$(uname 2> /dev/null)" == "Linux" ]; then
    export TERM=xterm-256color
    export FrameworkPathOverride=/usr/lib/mono/4.5/
    alias python=python3
    alias ls="ls --color=auto"
fi
