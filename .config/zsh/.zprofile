export PLATFORM=$(uname)
export TZ='America/Los_Angeles'

export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

export NEO4J_USERNAME=neo4j
export NEO4J_PASSWORD=localhost

WINIT_HIDPI_FACTOR=1.0

if [[ $(uname) == "Linux" ]]; then
  export SUDO_ASKPASS=$HOME/bin/rofi-askpass
  export SSH_ASKPASS=$HOME/bin/rofi-askpass
fi
