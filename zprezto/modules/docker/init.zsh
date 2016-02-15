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
  alias b2di="\$(boot2docker shellinit 2>/dev/null)"

  # Start boot2docker if it isn't running
  boot2docker_status=$(boot2docker status)

  if [[ "${boot2docker_status}" = "running" ]]; then
    $(boot2docker shellinit 2>/dev/null)
  fi

  unset boot2docker_status
fi

if (( $+commands[docker-machine] )); then
  alias dm="docker-machine"

  function {
    setopt LOCAL_OPTIONS RE_MATCH_PCRE

    if (( $+commands[dinghy] )); then
      $(dinghy shellinit)
    else
      local dm_status="$(docker-machine ls)"
      local b2d_dm="$(echo "${dm_status}" | grep '^boot2docker\b')"

      if [[  "${b2d_dm}" =~ ^boot2docker ]]; then
        alias dmi="eval \"\$(docker-machine env boot2docker)\""

        if [[ "${b2d_dm:l}" =~ \\brunning\\b ]]; then
            eval "$(docker-machine env boot2docker)"
        fi
      fi
    fi
  }
fi

if (( $+commands[docker-compose] )); then
  alias compose="docker-compose"
fi

#
# Some aliases
#
alias dockit="docker run -it --rm"
