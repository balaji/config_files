alias g='git'
alias gpl='git pull'
alias gpu='git push'
alias gst='git status'
alias ga='git add'
alias gsh='git stash'
alias gco='git commit'
alias gr='git rm'
alias gfu='git fetch upstream'
alias m='mvn'
alias mcp='mvn clean package'
alias mci='mvn clean install'
alias ect='emacsclient -t'
alias ecv='emacsclient -c'

export NVM_DIR="$HOME/.nvm"


case `uname` in
    Darwin)
        alias ls="ls -G"
        source /usr/local/Caskroom/miniconda/base/bin/activate base
	[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
	eval "$(jenv init -)"
#	export PATH=/usr/local/sbin:$HOME/.local/bin:$HOME/.ghcup/bin:$PATH
        ;;
    Linux)
        export TERM=xterm-256color
        alias ls="ls --color=auto"
        export LS_COLORS='ow=01;36;40'
        export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
        setxkbmap -option ctrl:nocaps
        setxkbmap -option srvrkeys:none
        ;;
esac

export SUDO_EDITOR='emacsclient -t'
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -c -a emacs"
ulimit -n 4096
