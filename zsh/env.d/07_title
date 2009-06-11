# Set the terminal title in OS X, stolen from http://tinyurl.com/5u9wfr
case $TERM in (*xterm*|ansi)
  function settab { print -Pn "\e]1; ${1} \a" }
  function settitle { print -Pn "\e]2; ${1} \a" }

  # Set the tab and title for the first time
  settab "%n@%m: %~"
  settitle "%n@%m: %~"
  ;;
esac
