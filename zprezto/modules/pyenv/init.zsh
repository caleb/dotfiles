#
# Enables local Python package installation.
#
# Authors:
#   Caleb Land <caleb@land.fm>
#

# Load pythonz into the shell session.
if [[ -d $HOME/.pyenv ]]; then
  path=($HOME/.pyenv/bin $path)
  eval "$(pyenv init -)"
fi
