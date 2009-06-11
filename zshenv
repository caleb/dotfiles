# Load our functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

# Load our other configuration files
for f in ~/.zsh/env.d/??_*; do
  source $f
done

## use .zsh/env.local for settings specific to one system
[[ -f ~/.zsh/env.local ]] && .  ~/.zsh/env.local
