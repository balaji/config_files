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

alias m='mvn'
alias mcp='mvn clean package'
alias mci='mvn clean install'
#alias mc='mvn clean'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	PATH="$HOME/.local/bin:$PATH"
fi
export PATH="/usr/local/sbin:$HOME/.cargo/bin:$HOME/.cabal/bin:$HOME/.ghcup/bin:/usr/local/go/bin:$PATH"

case `uname` in
    Darwin)
        alias ls="ls -G"
        ;;
    Linux)
        export TERM=xterm-256color
        export FrameworkPathOverride=/usr/lib/mono/4.5/
        alias python=python3
        alias ls="ls --color=auto"
        export LS_COLORS='ow=01;36;40'
        export DOTNET_ROOT=$HOME/dotnet 
        export PATH=$PATH:$HOME/dotnet:$HOME/.local/bin
        ;;
esac

export ALTERNATE_EDITOR=""
function e()
{
  # -c creates a new frame
  # -a= fires a new emacs server if none is running
  emacsclient --tty $*
}
alias vi="e"
alias vim="e"
