export PLATFORM=$(uname)
export TZ='America/Detroit'

# export DOCKER_BUILDKIT=1
# export COMPOSE_DOCKER_CLI_BUILD=1

export NEO4J_USERNAME=neo4j
export NEO4J_PASSWORD=localhost

if [[ $(uname) == "Darwin" ]]; then
  eval "$(brew shellenv)"
fi


# Added by Toolbox App
export PATH="$PATH:/Users/sean/Library/Application Support/JetBrains/Toolbox/scripts"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

