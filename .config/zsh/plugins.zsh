zplug "mafredri/zsh-async", from:"github", use:"async.zsh"

zplug "lukechilds/zsh-nvm"
zplug "matthieusb/zsh-sdkman"

zplug "plugins/vi-mode",        from:oh-my-zsh
zplug "plugins/autojump",       from:oh-my-zsh
zplug "plugins/dotenv",         from:oh-my-zsh
zplug "plugins/colorize",       from:oh-my-zsh
zplug "plugins/cp",             from:oh-my-zsh
zplug "plugins/gnu-utils",      from:oh-my-zsh

zplug "gradle/gradle-completion"

zplug "Tarrasch/zsh-autoenv"

zplug "zsh-users/zsh-completions"
zplug "zdharma-continuum/fast-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"

zplug "$ZDOTDIR/completions",             from:local
if [[ $OSTYPE == *darwin* ]]; then
  zplug "/usr/local/share/zsh-completions", from:local, if:"[[ $OSTYPE == *darwin* ]]"
  zplug "/usr/local/opt/git-extras/share/git-extras", from:local, if:"[[ $OSTYPE == *darwin* ]]"
elif [[ $OSTYPE == *linux* ]]; then
  zplug "/usr/share/zsh/vendor-completions", from:local, if:"[[ $OSTYPE == *linux* ]]"
fi


zplug "Aloxaf/fzf-tab"

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
