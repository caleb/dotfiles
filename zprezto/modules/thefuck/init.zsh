#
# Runs the thefuck initialization script
#
# Authors:
#   Caleb Land <caleb@land.fm>
#
if (( ! $+commands[thefuck-alias] )); then
  return 1
fi

eval "$(thefuck-alias)"
