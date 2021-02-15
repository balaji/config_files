HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt extendedglob
bindkey -e
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit

source $HOME/github/zsh-git-prompt/zshrc.sh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
PROMPT='%F{cyan}%n%f@%F{green}%m%f %F{yellow}%~%f %B$(git_super_status)%b 
$ '
GIT_PROMPT_EXECUTABLE="haskell"
if [ "$TMUX" = "" ]; then tmux new -A -s main; fi
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
source $HOME/.zprofile
export DISPLAY=$(ip route|awk '/^default/{print $3}'):0.0
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/balaji/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/balaji/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/balaji/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/balaji/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
eval "$(rbenv init -)"
# <<< conda initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/balaji/google-cloud-sdk/path.zsh.inc' ]; then . '/home/balaji/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/balaji/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/balaji/google-cloud-sdk/completion.zsh.inc'; fi
