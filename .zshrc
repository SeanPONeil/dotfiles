#!/usr/bin/env zsh

export HISTFILE=~/.history
export HISTSIZE=10000
export SAVEHIST=1000

export SDKMAN_AUTOCOMPLETE_FLOAT=1

if [[ $(uname) == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

export NODE_EXTRA_CA_CERTS=/etc/ssl/cert.pem

. $HOME/.exports

# Dotfiles that only set environment
for f in "$HOME/.path" "$HOME/.encrypted" "$HOME/.extra"; do
  if [[ -f "$f" ]]; then
    . "$f"
  fi
done
unset f

if [[ $(uname) == "Darwin" ]]; then
  export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
else
  export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
fi

export TERMCOLOR=truecolor

export PATH="$HOME/.jbang/bin:$PATH"
export PATH=$PATH:~/.tfenv/bin

export PATH=$PATH:~/go/bin
export GO111MODULE=on
export GOPRIVATE=gitlab.logicgate.com,gitlab.logicgate.dev

[ -f ~/.kube/clusters ] && export KUBECONFIG=$(find ~/.kube/clusters -type f | tr '\n' ':' | sed 's/:$//')
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

if [[ -n "$INTELLIJ_ENVIRONMENT_READER" ]]; then
  return
fi

# zmodload zsh/zpty
zmodload zsh/parameter
zmodload zsh/terminfo
zmodload zsh/zutil
zmodload zsh/computil
zmodload zsh/complist
zmodload zsh/curses

setopt histignorealldups inc_append_history_time extended_glob

# zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo'
zstyle ':antidote:bundle' use-friendly-names 'yes'
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# enable completion cache (required for gradle-completion)
zstyle ':completion:*' use-cache on
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':completion:*:*:docker:*'   option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

CASE_SENSITIVE="false"
# setopt MENU_COMPLETE
setopt no_list_ambiguous

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

antidote load

for f in "$HOME/.aliases" "$HOME/.dockerfunc" "$HOME/.functions"; do
  if [[ -f "$f" ]]; then
    . "$f"
  fi
done
unset f

[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh

eval "$(direnv hook zsh)"

alias j!=jbang

if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

if command -v op &>/dev/null; then
  eval "$(op completion zsh)"
fi
