#
# Configures PATH so that installed rust binaries (via `cargo install`)
# are included
#
# Authors: Caleb Land <caleb@land.fm>
#

path=($HOME/.cargo/bin $path)

# set the environment variable for the rust source path
export RUST_SRC_PATH="${HOME}/src/rust/src"
