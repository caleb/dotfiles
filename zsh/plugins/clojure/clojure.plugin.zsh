# this wraps the clj call in rlwrap if there are zero arguments
function rlclj {
  if [[ $# > 0 ]]; then
    clj $@
  else
    rlwrap clj
  fi
}

alias clj="rlclj"
