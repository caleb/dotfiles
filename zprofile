#
# Executes commands at login pre-zshrc.
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
if [[ -x `which emacsclient` ]]; then
  EDITOR='emacsclient -t --alternate-editor emacs'
elif [[ -x `which vim` ]]; then
  EDITOR='vim'
elif [[ -x `which mate` && ! -n $(run_from_ssh) ]]; then
  EDITOR='mate -w'
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

# Ensure path arrays do not contain duplicates.
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

# add ~/.local/bin for local installs
if [[ -d ~/.local/bin ]]; then
  path=(~/.local/bin $path)
fi

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
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
