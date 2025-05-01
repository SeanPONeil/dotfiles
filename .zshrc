#!/usr/bin/env zsh
# zmodload zsh/zprof
# zmodload zsh/zpty
# zmodload zsh/parameter
# zmodload zsh/terminfo
# zmodload zsh/zutil
zmodload zsh/computil
# zmodload zsh/curses

export HISTFILE=~/.history
export HISTSIZE=10000
export SAVEHIST=1000

export NVM_LAZY_LOAD=true

export SDKMAN_AUTOCOMPLETE_FLOAT=1

setopt histignorealldups inc_append_history_time extended_glob

# if [[ $(uname) == "Linux" ]]; then
#  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# fi
# 
# if [[ $(uname) == "Darwin" ]]; then
#   eval "$(/opt/homebrew/bin/brew shellenv)"
# fi

if [[ $(uname) == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

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

[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh

if [[ -n "$INTELLIJ_ENVIRONMENT_READER" ]]; then
  return
fi

eval "$(direnv hook zsh)"

# zprof


# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

if command -v op &>/dev/null; then
  eval "$(op completion zsh)"
fi

# if [ ! -d ~/.tfenv ]; then
#   curl -sL -o /tmp/tfenv.tar.gz https://github.com/tfutils/tfenv/archive/v2.2.2.tar.gz
#   tar xf /tmp/tfenv.tar.gz
#   mv tfenv-* ~/.tfenv
# fi
export PATH=$PATH:~/.tfenv/bin

export PATH=$PATH:~/go/bin
export GO111MODULE=on
export GOPRIVATE=gitlab.logicgate.com,gitlab.logicgate.dev
# source /Users/sean/.config/op/plugins.sh
