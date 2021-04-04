#!/usr/bin/env zsh
zmodload zsh/zprof
zmodload zsh/zpty

if [[ ! $SSH_CLIENT ]]; then
  (cat ~/.cache/wal/sequences &)
fi

# GPG pinentry
# GPG_TTY=$(tty)
# export GPG_TTY

# zplug
source $ZPLUG_HOME/init.zsh
zplug load

setopt extendedglob auto_menu alwaystoend no_nomatch histignorealldups sharehistory prompt_subst

setopt null_glob
for file in ~/.{exports,aliases,path,dockerfunc,extra,functions,encrypted}; do
  if [[ -f "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file
unsetopt null_glob


# . $ZDOTDIR/antibody
# source $ZDOTDIR/completion.zsh
# source $ZDOTDIR/.plugins.sh

# completion related stuff
CASE_SENSITIVE="false"
setopt MENU_COMPLETE
setopt no_list_ambiguous
autoload -Uz compinit
# Speed up zsh https://carlosbecker.com/posts/speeding-up-zsh/
if [[ -n $ZDOTDIR/.zcompdump(#qN.mh+24) ]]; then
  echo "Recompiling zcompdump"
  compinit -i
  compdump
else
  compinit -i -C
fi
# zstyle ':completion:*' menu yes select
# zstyle ':completion:*' use-cache on

# Completion for kitty
if [[ $TERM == "xterm-kitty" ]]; then
  kitty + complete setup zsh | source /dev/stdin
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(op completion zsh)"; compdef _op op
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
