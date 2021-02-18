zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:keychain agents ssh
zstyle :omz:plugins:keychain identities id_ed25519
zstyle :omz:plugins:keychain options --quiet --quick --systemd --ignore-missing --inherit any-once
zplug "plugins/keychain",   from:oh-my-zsh, ignore:"*oh-my-zsh.zsh"
# zplug "plugins/gpg-agent",  from:oh-my-zsh, ignore:"*oh-my-zsh.zsh"

zplug "lukechilds/zsh-nvm"

zplug "plugins/vi-mode",        from:oh-my-zsh
zplug "plugins/autojump",       from:oh-my-zsh
zplug "plugins/dotenv",         from:oh-my-zsh
zplug "plugins/nmap",           from:oh-my-zsh
zplug "plugins/adb",            from:oh-my-zsh
zplug "plugins/colorize",       from:oh-my-zsh
zplug "plugins/cp",             from:oh-my-zsh
zplug "plugins/docker",         from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/asdf",           from:oh-my-zsh
zplug "plugins/wakeonlan",      from:oh-my-zsh
zplug "plugins/jenv",           from:oh-my-zsh

zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

zplug "Tarrasch/zsh-autoenv"
zplug "zdharma/zsh-diff-so-fancy"
zplug "gradle/gradle-completion"

zplug "reegnz/jq-zsh-plugin"

zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-completions"
zplug "chitoku-k/fzf-zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
