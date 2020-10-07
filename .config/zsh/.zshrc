#!/usr/bin/env zsh

setopt histignorealldups sharehistory

setopt null_glob
for file in ~/.{exports,aliases,path,dockerfunc,extra,functions}; do
  if [[ -f "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file
unsetopt null_glob

autoload -Uz compinit

. $ZDOTDIR/antibody
source $ZDOTDIR/.plugins.sh

# Speed up zsh https://carlosbecker.com/posts/speeding-up-zsh/
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' $ZDOTDIR/.zcompdump) ]; then
  compinit -i;
else
  compinit -i -C;
fi;

# load completion.zsh after autocomplete loads
source $ZDOTDIR/completion.zsh

# PyWal
source ~/.cache/wal/colors.sh
(cat ~/.cache/wal/sequences &)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
