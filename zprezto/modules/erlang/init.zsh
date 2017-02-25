#
# Configures kerl and erlang
#
# Authors: Caleb Land <caleb@land.fm>
#

if [[ -d $HOME/.kerl/bin ]]; then
  path=($HOME/.kerl/bin $path)
fi

if (( ! $+commands[kerl] )); then
  return 1
fi

if [[ ! -d "${HOME}/.kerl/versions" ]]; then
  mkdir -p "${HOME}/.kerl/versions"
fi

# Some defaults
export KERL_DEFAULT_INSTALL_DIR="${HOME}/.kerl/versions"

if [[ -f "${HOME}/.erlang-version" ]]; then
  . "${HOME}/.kerl/versions/$(cat ${HOME}/.erlang-version)/activate"
fi
