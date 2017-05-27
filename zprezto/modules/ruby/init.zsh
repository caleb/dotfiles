#
# Configures Ruby local gem installation, loads version managers, and defines
# aliases.
#
# Authors: Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load RVM into the shell session.
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  # Unset AUTO_NAME_DIRS since auto adding variable-stored paths to ~ list
  # conflicts with RVM.
  unsetopt AUTO_NAME_DIRS

  # Source RVM.
  source "$HOME/.rvm/scripts/rvm"

# Load manually installed rbenv into the shell session.
elif [[ -s "$HOME/.rbenv/bin/rbenv" ]]; then
  path=("$HOME/.rbenv/bin" $path)
  remove-rbenv-shims-path
  eval "$(rbenv init - --no-rehash zsh)"

# Load package manager installed rbenv into the shell session.
elif (( $+commands[rbenv] )); then
  remove-rbenv-shims-path
  eval "$(rbenv init - --no-rehash zsh)"

# Load package manager installed chruby into the shell session.
elif (( $+commands[chruby-exec] )); then
  source "${commands[chruby-exec]:h:h}/share/chruby/chruby.sh"
  if zstyle -t ':prezto:module:ruby:chruby' auto-switch; then
    source "${commands[chruby-exec]:h:h}/share/chruby/auto.sh"

    # Workaround for postmodern/chruby#191 in interactive mode
    #
    # precmd_functions are executed before the prompt is printed, whereas
    # preexec_functions are executed before a command is executed.
    # chruby_auto uses preexec_functions which causes the prompt to be
    # displayed incorrectly when first `cd`ing to a directory with a
    # .ruby-version file (the correct ruby version is selected when a
    # command is executed, but just after `cd`ing the ruby isnt' changed)
    if [[ $PS1 ]]; then
      precmd_functions+=("chruby_auto")
      preexec_functions=${preexec_functions:#"chruby_auto"}
    fi

    # If a default Ruby is set, switch to it.
    chruby_auto
  fi

# Prepend local gems bin directories to PATH.
else
  path=($HOME/.gem/ruby/*/bin(N) $path)
fi

# Return if requirements are not found.
if (( ! $+commands[ruby] && ! ( $+commands[rvm] || $+commands[rbenv] ) )); then
  return 1
fi

#
# Aliases
#

# General
alias rb='ruby'

# Bundler
if (( $+commands[bundle] )); then
  alias rbb='bundle'
  alias rbbc='bundle clean'
  alias rbbe='bundle exec'
  alias rbbi='bundle install --path vendor/bundle'
  alias rbbl='bundle list'
  alias rbbo='bundle open'
  alias rbbp='bundle package'
  alias rbbu='bundle update'
  alias rbbI='rbbi \
    && bundle package \
    && print .bundle       >>! .gitignore \
    && print vendor/assets >>! .gitignore \
    && print vendor/bundle >>! .gitignore \
    && print vendor/cache  >>! .gitignore'
fi
