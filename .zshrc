#!/usr/bin/env zsh
# zmodload zsh/zprof
zmodload zsh/zpty
zmodload zsh/parameter

export HISTFILE=~/.history
export HISTSIZE=10000
export SAVEHIST=1000

export NVM_LAZY_LOAD=true

setopt histignorealldups inc_append_history_time extended_glob

if [[ $(uname) == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [[ $(uname) == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

autoload -Uz compinit && compinit

dotfiles=(
  "$HOME/.exports"
  "$HOME/.aliases"
  "$HOME/.path"
  "$HOME/.dockerfunc"
  "$HOME/.extra"
  "$HOME/.functions"
  "$HOME/.encrypted"
  "$HOME/completion.zsh"
)
# setopt null_glob
for f in $dotfiles; do
  if [[ -f "$f" ]]; then
    . "$f"
  fi
done
unset f
# unsetopt null_glob

if [[ $(uname) == "Darwin" ]]; then
  export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
else
  export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
fi

if [[ -n "$INTELLIJ_ENVIRONMENT_READER" ]]; then
  return
fi

eval "$(direnv hook zsh)"

# zprof

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"