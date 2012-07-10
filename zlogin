# go to saved path if there is one
if [[ -f ~/.current_path~ ]]; then
  cd `cat ~/.current_path~`
  rm ~/.current_path~
fi

## use .zlogin.local for settings specific to one system
[[ -f ~/.zlogin.local ]] && . ~/.zlogin.local
