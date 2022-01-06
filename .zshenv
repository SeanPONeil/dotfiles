XDG_DATA_HOME="$HOME/.local/share"
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"

ZDOTDIR="$XDG_CONFIG_HOME/zsh"

ZPLUG_HOME="$XDG_DATA_HOME/zplug"
if [[ ! -f "$ZPLUG_HOME/init.zsh" ]]; then
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi
ZPLUG_LOADFILE="$XDG_CONFIG_HOME/zsh/plugins.zsh"

HISTSIZE=4000
SAVEHIST=4000
HISTFILE=~/.history

# pywal colors for window manager related services
# . ~/.cache/wal/colors.sh

# Nerd Font symbol env vars
. $HOME/.local/share/fonts/i_all.sh
. "$HOME/.cargo/env"
