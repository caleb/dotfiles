#
# Defines environment variables.
#
# Authors:
#   Caleb Land <caleb@land.fm>
#

#
# Functions
#

fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vi'
if [[ -x `which mate` && ! -n $(run_from_ssh) ]]; then
  EDITOR='mate -w'
elif [[ -x `which vim` ]]; then
  EDITOR='vim'
fi

export VISUAL=$EDITOR
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

# ~/bin overrides everything
if [[ -d ~/bin ]]; then
  path=(~/bin $path)
fi

# remove duplicate entries
typeset -U path

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

#
# Temporary Files
#

if [[ -d "$TMPDIR" ]]; then
  export TMPPREFIX="${TMPDIR%/}/zsh"
  if [[ ! -d "$TMPPREFIX" ]]; then
    mkdir -p "$TMPPREFIX"
  fi
fi

# Load our other configuration files
if [[ -d ~/.zsh/env.d ]]; then
  find ~/.zsh/env.d -name \?\?_\* | while read f; do
    source "${f}"
  done
fi

## use .zshenv.local for settings specific to one system
[[ -f ~/.zshenv.local ]] && . ~/.zshenv.local
