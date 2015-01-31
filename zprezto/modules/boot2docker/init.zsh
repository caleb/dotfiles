#
# Sets the boot2docker environment variables up if boot2docker is running
#
# Authors:
#   Caleb Land <caleb@land.fm>
#
if (( ! $+commands[boot2docker] )); then
  return 1
fi

local status=$(boot2docker status)
if [[ "${status}" = "running" ]]; then
  $(boot2docker shellinit)
fi

alias b2d=boot2docker
alias dockit=docker run -it --rm
