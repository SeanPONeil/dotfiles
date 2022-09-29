#!/usr/bin/env zsh

# enable completion cache (required for gradle-completion)
zstyle ':completion:*' use-cache on

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'

# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'

# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

zstyle ':completion:*:*:docker:*'   option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

CASE_SENSITIVE="false"
# setopt MENU_COMPLETE
# setopt no_list_ambiguous

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

FPATH=$ZDOTDIR/completions:$FPATH

