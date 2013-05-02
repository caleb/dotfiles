# Load our other configuration files
for f in ~/.zsh/rc.d/??_*; do
  source $f
done

## use .oh-my-zsh.local to tweak the Oh My ZSH settings
[[ -f ~/.oh-my-zsh.local ]] && . ~/.oh-my-zsh.local

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.zsh}"

#
# Start oh-my-zsh
#

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="${ZSH_THEME:-caleb}"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="${CASE_SENSITIVE:-false}"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=($plugins pythonbrew rails3 git textmate ruby rbenv terminalapp
         osx gem colored-man bundler brew capistrano history
         history-substring-search vagrant clojure gnu-utils title ls-colors
         spotlight pasted-tabs-dont-complete osx-pdf-man npm)

source $ZSH/oh-my-zsh.sh

#
# End oh-my-zsh
#

## use .zshrc.local for settings specific to one system
[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local