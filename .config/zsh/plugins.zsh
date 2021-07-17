if [[ -n "$SSH_CLIENT" ]]; then
  zstyle :omz:plugins:ssh-agent agent-forwarding on
fi
if [[ $(uname) == "Darwin" ]]; then
  zstyle :omz:plugins:ssh-agent ssh-add-args -K
fi

zplug "mafredri/zsh-async", from:"github", use:"async.zsh"

zplug "plugins/git",            from:oh-my-zsh
zplug "plugins/ssh-agent",      from:oh-my-zsh

zplug "lukechilds/zsh-nvm"

zplug "plugins/vi-mode",        from:oh-my-zsh
zplug "plugins/autojump",       from:oh-my-zsh
zplug "plugins/dotenv",         from:oh-my-zsh
zplug "plugins/colorize",       from:oh-my-zsh
zplug "plugins/cp",             from:oh-my-zsh
zplug "plugins/docker",         from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/gpg-agent",      from:oh-my-zsh
zplug "plugins/gnu-utils",      from:oh-my-zsh

zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

zplug "gradle/gradle-completion"

zplug "Tarrasch/zsh-autoenv"
zplug "zdharma/zsh-diff-so-fancy"

zplug "zsh-users/zsh-completions"
zplug "chitoku-k/fzf-zsh-completions"
zplug "zdharma/fast-syntax-highlighting"
# zplug "zsh-users/zsh-autosuggestions"

zplug "TheLocehiliosan/yadm", use:"completion/zsh/_yadm", as:command, defer:2
zplug "wfxr/forgit"

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
