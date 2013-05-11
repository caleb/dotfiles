# go to saved path if there is one
if [[ -f ~/.current_path~ ]]; then
  cd `cat ~/.current_path~`
  rm ~/.current_path~
fi

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

## use .zlogin.local for settings specific to one system
[[ -f ~/.zlogin.local ]] && . ~/.zlogin.local
