# Load our other configuration files
for f in ~/.zsh/rc.d/??_*; do
  source $f
done

## use .zsh/rc.local for settings specific to one system
[[ -f ~/.zsh/rc.local ]] && .  ~/.zsh/rc.local