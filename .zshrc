
# Autoload zsh modules when they are referenced
# zmodload zsh/zprof 

# setopt histignorealldups sharehistory nomatch autocd

export DOTFILES="$HOME/dotfiles"

# PyWal
source ~/.cache/wal/colors.sh
(cat ~/.cache/wal/sequences &)

# Pure prompt customization
export PURE_PROMPT_SYMBOL=">"
export PURE_PROMPT_VICMD_SYMBOL="<"

# ZSH completion
autoload -Uz compinit && compinit

# Load antibody plugins
# export NVM_LAZY_LOAD=true
# export NVM_LAZY_LOAD_EXTRA_COMMANDS=('yarn')
# export NVM_NO_USE=true
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
source <(antibody init)
antibody bundle < ~/.zsh_plugins

setopt null_glob
source $HOME/.exports
for f in ~/.exports.d/*; do
  [[ ! -e $f ]] && continue  # continue, if file does not exist
  source $f;
done

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.zsh_history

unsetopt null_glob

for file in ~/.{zsh_prompt,aliases,path,dockerfunc,extra,exports,functions}; do
  if [[ -f "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
# zprof
