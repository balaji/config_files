HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt extendedglob
bindkey -e
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit

source $HOME/github/zsh-git-prompt/zshrc.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
PROMPT='[%F{yellow}%~%f]%B$(git_super_status)%b
λ '
GIT_PROMPT_EXECUTABLE="haskell"
if [ "$TMUX" = "" ]; then tmux new -A -s main; fi
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

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
        # source /usr/local/Caskroom/miniconda/base/bin/activate base
    	[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
	    eval "$(jenv init -)"
	    export PATH=/usr/local/sbin:$HOME/.local/bin:$HOME/.ghcup/bin:$PATH
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

ulimit -n 4096

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda deactivate

export EDITOR="/usr/local/bin/emacsclient -t"
