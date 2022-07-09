export EDITOR="nvim"
export WINEPREFIX=$HOME/Games/win32

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export CARGO_HOME=$XDG_DATA_HOME/cargo
export HISTFILE=$XDG_CONFIG_HOME/zsh/history

LFCD="/home/kiipuri/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

source $HOME/.bash_aliases
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $XDG_CONFIG_HOME/powerlevel10k/powerlevel10k.zsh-theme
source $XDG_CONFIG_HOME/powerlevel10k/.p10k.zsh

bindkey -v
