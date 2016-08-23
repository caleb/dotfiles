#
# Defines environment variables.
#
# Authors:
#   Caleb Land <caleb@land.fm>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Load our other configuration files
if [[ -d ~/.zsh/env.d ]]; then
  find ~/.zsh/env.d -name \?\?_\* | while read f; do
    source "${f}"
  done
fi

## use .zshenv.local for settings specific to one system
[[ -f ~/.zshenv.local ]] && . ~/.zshenv.local
