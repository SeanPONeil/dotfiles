export PLATFORM=$(uname)
export TZ='America/Detroit'

# export DOCKER_BUILDKIT=1
# export COMPOSE_DOCKER_CLI_BUILD=1

export NEO4J_USERNAME=neo4j
export NEO4J_PASSWORD=localhost

if [[ $(uname) == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [[ $(uname) == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# Added by Toolbox App
export PATH="$PATH:/Users/sean/Library/Application Support/JetBrains/Toolbox/scripts"


# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
