zplug "lukechilds/zsh-nvm"

zplug "plugins/git",            from:oh-my-zsh
zplug "plugins/vi-mode",        from:oh-my-zsh
zplug "plugins/autojump",       from:oh-my-zsh
zplug "plugins/dotenv",         from:oh-my-zsh
zplug "plugins/colorize",       from:oh-my-zsh
zplug "plugins/cp",             from:oh-my-zsh
zplug "plugins/docker",         from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/wakeonlan",      from:oh-my-zsh

zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

zplug "gradle/gradle-completion"

zplug "Tarrasch/zsh-autoenv"
zplug "zdharma/zsh-diff-so-fancy"

zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-completions"
zplug "chitoku-k/fzf-zsh-completions"
zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"

zplug "TheLocehiliosan/yadm", use:"completion/zsh/_yadm", as:command, defer:2

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
