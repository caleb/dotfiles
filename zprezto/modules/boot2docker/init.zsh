#
# Sets the boot2docker environment variables up if boot2docker is running
#
# Authors:
#   Caleb Land <caleb@land.fm>
#
if (( ! $+commands[boot2docker] )); then
  return 1
fi

boot2docker_status=$(boot2docker status)

if [[ "${boot2docker_status}" = "running" ]]; then
  $(boot2docker shellinit > /dev/null 2>&1)
fi

unset boot2docker_status

alias b2d=boot2docker
alias dockit=docker run -it --rm
