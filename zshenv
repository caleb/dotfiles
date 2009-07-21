# Load our functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

# Load our other configuration files
for f in ~/.zsh/env.d/??_*; do
  source $f
done

## use .zshenv.local for settings specific to one system
[[ -f ~/.zshenv.local ]] && . ~/.zshenv.local
