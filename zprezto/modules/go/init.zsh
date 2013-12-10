#
# Sets GOPATH and adds $GOPATH/bin to your $PATH
#
# Authors:
#   Caleb Land <caleb@land.fm>
#
if (( ! $+commands[go] )); then
  return 1
fi

# set the GOPATH environment variable to the workspace
zstyle -s ':prezto:module:go' workspace 'REPLY'
REPLY="${REPLY:-${HOME}/go}"

if [[ -n "${REPLY}" ]]; then
  if [[ ! -e "${REPLY}" ]]; then
    mkdir -p "${REPLY}/bin"
    mkdir -p "${REPLY}/pkg"
    mkdir -p "${REPLY}/src"
  fi

  if [[ -z "${GOPATH}" ]]; then
    export GOPATH="${REPLY}"
  fi
fi

unset REPLY

path=("${GOPATH}/bin" $path)
