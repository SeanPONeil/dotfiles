XDG_DATA_HOME="$HOME/.local/share"
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"

ZDOTDIR="$XDG_CONFIG_HOME/zsh"

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# workaround for `nice(5) failed: operation not permitted`
#
# https://github.com/microsoft/WSL/issues/1887
