zplug "lukechilds/zsh-nvm"

zplug "plugins/vi-mode",    from:oh-my-zsh
zplug "plugins/autojump",   from:oh-my-zsh
zplug "plugins/dotenv",     from:oh-my-zsh
zplug "plugins/pipenv",     from:oh-my-zsh
zplug "plugins/brew",       from:oh-my-zsh
zplug "plugins/pip",        from:oh-my-zsh
zplug "plugins/rvm",        from:oh-my-zsh
zplug "plugins/nmap",       from:oh-my-zsh
zplug "plugins/aws",        from:oh-my-zsh

zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

zplug "Tarrasch/zsh-autoenv"
zplug "zdharma/zsh-diff-so-fancy"
zplug "gradle/gradle-completion"

zplug "chrissicool/zsh-256color"
zplug "zuxfoucault/colored-man-pages_mod"
zplug "reegnz/jq-zsh-plugin"

zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "chitoku-k/fzf-zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"

zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq
zplug "b4b4r07/emoji-cli", \
    on:"stedolan/jq"

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
