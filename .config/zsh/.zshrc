#!/usr/bin/env zsh
# zmodload zsh/zprof
# zmodload zsh/zpty
zmodload zsh/parameter

setopt histignorealldups sharehistory extended_glob

dotfiles=(
  "$HOME/.exports"
  "$HOME/.aliases"
  "$HOME/.path"
  "$HOME/.dockerfunc"
  "$HOME/.extra"
  "$HOME/.functions"
  "$HOME/.encrypted"
  "$ZDOTDIR/completion.zsh"
)
# setopt null_glob
for f in $dotfiles; do
  if [[ -f "$f" ]]; then
    . "$f"
  fi
done
unset f
# unsetopt null_glob

[ -f ~/.sdkman/bin/sdkman-init.sh ] && source ~/.sdkman/bin/sdkman-init.sh

if [[ -n "$INTELLIJ_ENVIRONMENT_READER" ]]; then
  return
fi

source $ZPLUG_HOME/init.zsh
if ! zplug check; then
  printf "Install zsh plugins? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(op completion zsh)"; compdef _op op
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
