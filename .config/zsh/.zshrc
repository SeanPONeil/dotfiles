#!/usr/bin/env zsh

setopt extendedglob auto_menu listpacked alwaystoend no_nomatch histignorealldups sharehistory

setopt null_glob
for file in ~/.{exports,aliases,path,dockerfunc,extra,functions}; do
  if [[ -f "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file
unsetopt null_glob

. $ZDOTDIR/antibody
source $ZDOTDIR/completion.zsh
source $ZDOTDIR/.plugins.sh

autoload -Uz compinit
# Speed up zsh https://carlosbecker.com/posts/speeding-up-zsh/
if [[ -n $ZDOTDIR/.zcompdump(#qN.mh+24) ]]; then
  echo "Recompiling zcompdump"
  compinit -i
  compdump
else
  compinit -i -C
fi

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# PyWal
source ~/.cache/wal/colors.sh
(\cat ~/.cache/wal/sequences &)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export JDK_HOME="${JAVA_HOME}"


eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
