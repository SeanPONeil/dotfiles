#!/usr/bin/env zsh

# Autoload zsh modules when they are referenced
# zmodload zsh/zprof 

setopt histignorealldups sharehistory nomatch autocd


# PyWal
source ~/.cache/wal/colors.sh
(cat ~/.cache/wal/sequences &)

# source exports
setopt null_glob
source $HOME/.exports
for f in ~/.exports.d/*; do
  [[ ! -e $f ]] && continue  # continue, if file does not exist
  source $f;
done

# ZSH completion
autoload -Uz compinit && compinit

source <(antibody init)
antibody bundle < $ZDOTDIR/.zsh_plugins

unsetopt null_glob

for file in ~/.{zsh_prompt,aliases,path,dockerfunc,extra,functions}; do
  if [[ -f "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
# zprof
