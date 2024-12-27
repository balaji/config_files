HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
bindkey -e
zstyle :compinstall filename '~/.zshrc'

skip_global_compinit=1
# End of lines added by compinstall

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/git-prompt.zsh/git-prompt.zsh
source ~/.zsh/git-prompt.zsh/examples/multiline.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
if [ "$TMUX" = "" ]; then tmux new -A -s main; fi 
eval "$(rbenv init - zsh)"

alias e=emacsclient
alias g='git'
alias gpl='git pull'
alias gpu='git push'
alias gst='git status'
alias ga='git add'
alias gsh='git stash'
alias gco='git commit'
alias gr='git rm'
alias gfu='git fetch upstream'
alias r3=rebar3

case `uname` in
    Linux)
    alias code="code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto --unity-launch"
    alias spotify="spotify --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto --unity-launch"
    alias 1password="1password --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto --unity-launch"

    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    [ -n "$EAT_SHELL_INTEGRATION_DIR" ] && \
        source "$EAT_SHELL_INTEGRATION_DIR/zsh"

    alias docker=podman
    export PATH="/home/balaji/bin:$PATH:/home/balaji/.local/share/JetBrains/Toolbox/scripts"
    export GTK_MODULES="unity-gtk-module"
    export SAL_USE_VCLPLUGIN=gtk
    ;;
esac
