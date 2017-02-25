#
# Configures PATH so that installed rust binaries (via `cargo install`)
# are included
#
# Authors: Caleb Land <caleb@land.fm>
#

if [[ -d $HOME/.cargo ]]; then
  path=($HOME/.cargo/bin $path)
fi

if (( $+commands[multirust] )); then
  path=($HOME/.multirust/toolchains/stable/cargo/bin $path)
elif (( $+commands[rustup] )); then
  # Add completions
  if [[ ! -d "${0:h}/functions" ]]; then
    mkdir -p "${0:h}/functions"
    rustup completions zsh > "${0:h}/functions/_rustup"
    fpath+="${0:h}/functions"
  fi
fi

# set the environment variable for the rust source path
export RUST_SRC_PATH="${HOME}/src/rust/src"
