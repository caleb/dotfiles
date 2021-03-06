#
# Configures kerl and erlang
#
# Authors: Caleb Land <caleb@land.fm>
#

if [[ -d $HOME/.kerl/bin ]]; then
  path=($HOME/.kerl/bin $path)
fi

#
# If we are using kerl, then do some setup
#
if (( $+commands[kerl] )); then
  if [[ ! -d "${HOME}/.kerl/versions" ]]; then
    mkdir -p "${HOME}/.kerl/versions"
  fi

  # Some defaults
  export KERL_DEFAULT_INSTALL_DIR="${HOME}/.kerl/versions"

  if [[ -f "${HOME}/.erlang-version" ]]; then
    if [[ -f  "${HOME}/.kerl/versions/$(cat ${HOME}/.erlang-version)/activate" ]]; then
      . "${HOME}/.kerl/versions/$(cat ${HOME}/.erlang-version)/activate"
    fi
  fi
fi

#
# Some build options
#
export KERL_BUILD_DOCS=yes
if [[ -d "${HOME}/.kerl/openssl" ]]; then
  # Use our custom openssl
  export KERL_CONFIGURE_OPTIONS="--with-ssl=${HOME}/.kerl/openssl"
elif [[ -d "/usr/local/opt/openssl@1.1" ]] && [[ "$OSTYPE" = darwin* ]]; then
  # Use our custom openssl
  export KERL_CONFIGURE_OPTIONS="--with-ssl=/usr/local/opt/openssl@1.1"
elif [[ -d "/usr/local/opt/openssl" ]] && [[ "$OSTYPE" = darwin* ]]; then
  # Use our custom openssl
  export KERL_CONFIGURE_OPTIONS="--with-ssl=/usr/local/opt/openssl"
fi
