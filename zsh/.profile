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
alias ect='emacsclient -t'
alias ecv='emacsclient -c'

if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
	PATH="$HOME/.local/bin:$PATH"
fi
export PATH="/usr/local/sbin:$HOME/go/bin:/usr/local/go/bin:$HOME/.cargo/bin:$HOME/.jenv/bin:$PATH"

case `uname` in
    Darwin)
        alias ls="ls -G"
        source /usr/local/Caskroom/miniconda/base/bin/activate spotify
        ;;
    Linux)
        export TERM=xterm-256color
        alias ls="ls --color=auto"
        export LS_COLORS='ow=01;36;40'
	      setxkbmap -option ctrl:nocaps
        setxkbmap -option srvrkeys:none
        test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
        test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        #eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        #source /usr/local/miniconda3/bin/activate spotify
        ;;
esac

function burk {
  host=$(burklee | fzf)
  [[ ! -z "$host" ]] && ssh -A "$host.spotify.net"
}

export SUDO_EDITOR='emacsclient -t'
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -c -a emacs"
ulimit -n 4096
