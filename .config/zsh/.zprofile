export PLATFORM=$(uname)
export TZ='America/Detroit'

export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

export NEO4J_USERNAME=neo4j
export NEO4J_PASSWORD=localhost

if [[ $(uname) == "Linux" ]]; then
  export SUDO_ASKPASS=$HOME/bin/rofi-askpass
  export SSH_ASKPASS=$HOME/bin/rofi-askpass
fi
