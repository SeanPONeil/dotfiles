#!/usr/bin/env zsh

source $ZDOTDIR/completion.zsh
setopt correct_all auto_menu listpacked alwaystoend no_nomatch histignorealldups sharehistory

setopt null_glob
for file in ~/.{exports,aliases,path,dockerfunc,extra,functions}; do
  if [[ -f "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file
unsetopt null_glob

. $ZDOTDIR/antibody
source $ZDOTDIR/.plugins.sh

autoload -Uz compinit compdef && compinit
# Speed up zsh https://carlosbecker.com/posts/speeding-up-zsh/
# if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' $ZDOTDIR/.zcompdump) ]; then
#   compinit;
# else
#   compinit -C;
# fi;

# PyWal
source ~/.cache/wal/colors.sh
(cat ~/.cache/wal/sequences &)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
