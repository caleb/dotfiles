#
# Loads the kiex version manager.
#
# Authors:
#   Caleb Land <caleb@land.fm>
#

# Load manually installed kiex into the shell session.
if [[ -s "$HOME/.kiex/scripts/kiex" ]]; then
  source "$HOME/.kiex/scripts/kiex"

# Load package manager installed KIEX into the shell session.
elif (( $+commands[brew] )) && [[ -d "$(brew --prefix kiex 2>/dev/null)" ]]; then
  export KIEX_DIR=~/.kiex
  if [[ ! -d "${KIEX_DIR}" ]]; then
    mkdir -p "${KIEX_DIR}"
  fi
  source $(brew --prefix kiex)/scripts/kiex

# Return if requirements are not found.
elif (( ! $+commands[elixir] )); then
  return 1
fi

# Use the default version of elixir
if [[ -f "${HOME}/.elixir-version" ]]; then
  kiex use `cat "${HOME}/.elixir-version"` > /dev/null
fi
