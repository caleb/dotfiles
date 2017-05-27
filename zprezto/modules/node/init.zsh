#
# Loads the Node Version Manager and enables npm completion.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Zeh Rizzatti <zehrizzatti@gmail.com>
#

# Load manually installed NVM into the shell session.
if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
  source "$HOME/.nvm/nvm.sh"
elif [[ -s "/usr/share/nvm/nvm.sh" ]]; then
  source "/usr/share/nvm/nvm.sh"
elif [[ -s "/usr/local/share/nvm/nvm.sh" ]]; then
  source "/usr/local/share/nvm/nvm.sh"
# Load package manager installed NVM into the shell session.
elif (( $+commands[brew] )) && [[ -d "$(brew --prefix nvm 2>/dev/null)" ]]; then
  source $(brew --prefix nvm)/nvm.sh

# Load manually installed nodenv into the shell session.
elif [[ -s "$HOME/.nodenv/bin/nodenv" ]]; then
  path=("$HOME/.nodenv/bin" $path)
  eval "$(nodenv init - --no-rehash zsh)"

# Load package manager installed nodenv into the shell session.
elif (( $+commands[nodenv] )); then
  eval "$(nodenv init - --no-rehash zsh)"

# Return if requirements are not found.
elif (( ! $+commands[node] )); then
  # Return if requirements are not found.
  return 1
fi

if (( $+commands[nvm] )); then
  export NVM_DIR=~/.nvm
  
  if [[ ! -d "${NVM_DIR}" ]]; then
    mkdir -p "${NVM_DIR}"
  fi
  
  # Load the default version of node
  if [[ -f "${HOME}/.node-version" ]]; then
    nvm use `cat "${HOME}/.node-version"` > /dev/null
  fi
fi

# Load NPM completion.
if (( $+commands[npm] )); then
  cache_file="${0:h}/cache.zsh"

  if [[ "$commands[npm]" -nt "$cache_file" || ! -s "$cache_file" ]]; then
    # npm is slow; cache its output.
    npm completion >! "$cache_file" 2> /dev/null
  fi

  source "$cache_file"

  unset cache_file
fi
