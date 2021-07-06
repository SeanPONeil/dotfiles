#!/usr/bin/env zsh
# zmodload zsh/zprof
# zmodload zsh/zpty

if [[ ! $SSH_CLIENT ]]; then
  (cat ~/.cache/wal/sequences &)
fi

zstyle ':completion:*' menu yes select
zstyle ':completion:*' use-cache on

# GPG pinentry
# GPG_TTY=$(tty)
# export GPG_TTY

setopt extendedglob auto_menu alwaystoend no_nomatch histignorealldups sharehistory prompt_subst

setopt null_glob
for file in ~/.{exports,aliases,path,dockerfunc,extra,functions,encrypted}; do
  if [[ -f "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file
unsetopt null_glob


# completion related stuff
CASE_SENSITIVE="false"
setopt MENU_COMPLETE
setopt no_list_ambiguous
autoload -Uz compinit
# Speed up zsh https://carlosbecker.com/posts/speeding-up-zsh/
if [[ -n $ZDOTDIR/.zcompdump(#qN.mh+24) ]]; then
  echo "Recompiling zcompdump"
  compinit
fi
compinit -C

source $ZPLUG_HOME/init.zsh
if ! zplug check; then
  printf "Install zsh plugins? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.sdkman/bin/sdkman-init.sh ] && source ~/.sdkman/bin/sdkman-init.sh

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
