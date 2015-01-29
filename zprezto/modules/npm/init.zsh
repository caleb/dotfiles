#
# Adds the npm bin to the beginning of your path
#
# Authors:
#   Caleb Land <caleb@land.fm>
#
if (( ! $+commands[npm] )); then
  return 1
fi

local _npm_bin_path
_npm_bin_path=$(which npm)
_npm_bin_path="${${_npm_bin_path:h}:h}/share/npm/bin"

if [[ ! -d $_npm_bin_path ]]; then
  # Only add the npm bin path to the path if it isn't already in the path
  if [[ -z "${(M)path:#${_npm_bin_path}}" ]]; then
    _npm_bin_path=`npm bin -g 2>/dev/null`
  fi
fi

path=($_npm_bin_path $path)

unset _npm_bin_path
