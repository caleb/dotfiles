# Load our other configuration files
for f in ~/.zsh/rc.d/??_*; do
  source $f
done

## use .zshrc.local for settings specific to one system
[[ -f ~/.zshrc.local ]] && .  ~/.zshrc.local