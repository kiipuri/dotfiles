setopt autocd globdots

# Completion
zstyle ":completion:*" menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
eval "$(dircolors)"
zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS}
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
autoload -Uz compinit
compinit

export EDITOR="nvim"
export WINEPREFIX=$HOME/Games/win32

# Environment variables for cleaning up home directory
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export CARGO_HOME=$XDG_DATA_HOME/cargo
export HISTFILE=$XDG_CONFIG_HOME/zsh/history
export SAVEHIST=10000

# Script for lf to cd to current directory when quit
LFCD="/home/kiipuri/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

# Aliases
source $HOME/.bash_aliases

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Prompt
source $XDG_CONFIG_HOME/powerlevel10k/powerlevel10k.zsh-theme
source $XDG_CONFIG_HOME/powerlevel10k/.p10k.zsh

bindkey -v

eval "$(zoxide init zsh)"
