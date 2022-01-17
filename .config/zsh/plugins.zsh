if [[ -n "$SSH_CLIENT" ]]; then
  zstyle :omz:plugins:ssh-agent agent-forwarding on
fi
if [[ $OSTYPE == *darwin* ]]; then
  zstyle :omz:plugins:ssh-agent ssh-add-args --apple-use-keychain
fi
zstyle :omz:plugins:ssh-agent identities id_ed25519

zplug "mafredri/zsh-async", from:"github", use:"async.zsh"

zplug "plugins/gpg-agent",      from:oh-my-zsh
zplug "plugins/ssh-agent",      from:oh-my-zsh

zplug "lukechilds/zsh-nvm"

zplug "plugins/vi-mode",        from:oh-my-zsh
zplug "plugins/autojump",       from:oh-my-zsh
zplug "plugins/dotenv",         from:oh-my-zsh
zplug "plugins/colorize",       from:oh-my-zsh
zplug "plugins/cp",             from:oh-my-zsh
zplug "plugins/gnu-utils",      from:oh-my-zsh

zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

zplug "gradle/gradle-completion"

zplug "Tarrasch/zsh-autoenv"
zplug "reegnz/jq-zsh-plugin"
zplug "zdharma-continuum/zsh-diff-so-fancy", as:command, use:"bin/"

zplug "zsh-users/zsh-completions"
zplug "zdharma-continuum/fast-syntax-highlighting"
# zplug "zsh-users/zsh-autosuggestions"

zplug "TheLocehiliosan/yadm", use:"completion/zsh/_yadm", as:command, defer:2

zplug "docker/cli", use:"contrib/completion/zsh/_docker"

zplug "$ZDOTDIR/completions",             from:local
if [[ $OSTYPE == *darwin* ]]; then
  zplug "/usr/local/share/zsh-completions", from:local, if:"[[ $OSTYPE == *darwin* ]]"
elif [[ $OSTYPE == *linux* ]]; then
  zplug "/usr/share/zsh/vendor-completions", from:local, if:"[[ $OSTYPE == *linux* ]]"
fi


zplug "Aloxaf/fzf-tab"

zplug "alacritty/alacritty", \
  use:"extra/completions/_alacritty"

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
