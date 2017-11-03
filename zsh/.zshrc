HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt extendedglob
bindkey -e
zstyle :compinstall filename '/Users/balaji/.zshrc'
autoload -Uz compinit
compinit

source $HOME/Personal/zsh-git-prompt/zshrc.sh
source /Users/balaji/Personal/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
PROMPT='%F{cyan}%n%f@%F{green}%m%f %F{yellow}%~%f %B$(git_super_status)%b 
$ '
GIT_PROMPT_EXECUTABLE="haskell"
