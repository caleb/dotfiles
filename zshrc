# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Caleb Land <caleb@land.fm>
#

# Load our other configuration files
if [[ -d ~/.zsh/rc.d ]]; then
  find ~/.zsh/rc.d -name \?\?_\* | while read f; do
    source "${f}"
  done
fi

# Load local modifications to the zpreztorc file
[[ -f $HOME/.zpreztorc.before.local ]] && source $HOME/.zpreztorc.before.local

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Load local modifications to the zpreztorc file
[[ -f $HOME/.zpreztorc.after.local ]] && source $HOME/.zpreztorc.after.local
[[ -f $HOME/.zpreztorc.local ]] && source $HOME/.zpreztorc.local

## use .zshrc.local for settings specific to one system
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
