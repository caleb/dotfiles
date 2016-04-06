#
# Configures PATH so that installed rust binaries (via `cargo install`)
# are included
#
# Authors: Caleb Land <caleb@land.fm>
#

if (( $+commands[multirust] )); then
  path=($HOME/.multirust/toolchains/stable/cargo/bin $path)
else
  path=($HOME/.cargo/bin $path)
fi

# set the environment variable for the rust source path
export RUST_SRC_PATH="${HOME}/src/rust/src"
