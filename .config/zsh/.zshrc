#!/usr/bin/env zsh

# PyWal
source ~/.cache/wal/colors.sh
source ~/.cache/wal/colors-tty.sh
(cat ~/.cache/wal/sequences &)

# GPG pinentry
GPG_TTY=$(tty)
export GPG_TTY

setopt extendedglob auto_menu alwaystoend no_nomatch histignorealldups sharehistory

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
if [[ $TERM == "xterm-kitty" ]]; then
  kitty + complete setup zsh | source /dev/stdin
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export JDK_HOME="${JAVA_HOME}"


eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
