#!/usr/bin/env zsh

# Autoload zsh modules when they are referenced
# zmodload zsh/zprof

setopt histignorealldups sharehistory nomatch autocd

setopt null_glob
for file in ~/.{exports,aliases,path,dockerfunc,extra,functions}; do
  if [[ -f "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file
unsetopt null_glob

. $ZDOTDIR/antibody

# PyWal
source ~/.cache/wal/colors.sh
(cat ~/.cache/wal/sequences &)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
# zprof
