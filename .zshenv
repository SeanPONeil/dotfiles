XDG_DATA_HOME="$HOME/.local/share"
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"

ZDOTDIR="$XDG_CONFIG_HOME/zsh"

ZPLUG_HOME="$XDG_DATA_HOME/zplug"
if [[ ! -f "$ZPLUG_HOME/init.zsh" ]]; then
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi
ZPLUG_LOADFILE="$XDG_CONFIG_HOME/zsh/plugins.zsh"

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

eval $(ssh-agent)



# workaround for `nice(5) failed: operation not permitted`
#
# https://github.com/microsoft/WSL/issues/1887
