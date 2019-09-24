HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt extendedglob
bindkey -e
zstyle :compinstall filename '/Users/balaji/.zshrc'
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(jenv init -)"
