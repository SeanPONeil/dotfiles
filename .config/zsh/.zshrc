#!/usr/bin/env zsh

source ~/.cache/wal/colors.sh

# GPG pinentry
GPG_TTY=$(tty)
export GPG_TTY

setopt extendedglob auto_menu alwaystoend no_nomatch histignorealldups sharehistory prompt_subst

setopt null_glob
for file in ~/.{exports,aliases,path,dockerfunc,extra,functions,encrypted}; do
  if [[ -f "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file
unsetopt null_glob

# Nerd Font symbol env vars
source $HOME/.local/share/fonts/i_all.sh

. $ZDOTDIR/antibody
# source $ZDOTDIR/completion.zsh
source $ZDOTDIR/.plugins.sh

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
zstyle ':completion:*' menu yes select

# Completion for kitty
if [[ $TERM == "xterm-kitty" ]]; then
  kitty + complete setup zsh | source /dev/stdin
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export JDK_HOME="${JAVA_HOME}"


eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
