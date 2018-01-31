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
