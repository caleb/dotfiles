#
# Docker, Boot2Docker and Docker Compose helpers. Also initializes boot2docker's
# environment variables if they aren't set
#
# Authors: Caleb Land <caleb@land.fm>
#

if (( ! $+commands[docker] )); then
  return 1
fi

if (( $+commands[boot2docker] )); then
  alias b2d="boot2docker"
  alias b2di="$(boot2docker shellinit 2>/dev/null)"

  # Start boot2docker if it isn't running
  boot2docker_status=$(boot2docker status)

  if [[ "${boot2docker_status}" = "running" ]]; then
    $(boot2docker shellinit 2>/dev/null)
  fi

  unset boot2docker_status
fi

if (( $+commands[docker-machine] )); then
  alias dm="docker-machine"
  alias dmi="eval \"$(docker-machine env boot2docker)\""

  # Start the machine if it isn't running
  boot2docker_status="$(docker-machine ls | grep '^boot2docker' | awk '{ print $3 }')"

  if [[ "${boot2docker_status:l}" = "running" ]]; then
    eval "$(docker-machine env boot2docker)"
  fi
fi

if (( $+commands[docker-compose] )); then
  alias compose="docker-compose"
fi

#
# Some aliases
#
alias dockit="docker run -it --rm"
