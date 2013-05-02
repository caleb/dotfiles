setopt prompt_subst

function add-space-to-prompt {
  echo ${1} | grep -o -q -E -e '^[ ]+$'
  if [[ ${1} == "" || $? == 0 ]]; then; echo ""; return; fi

  # trim any existing whitespace from the beginning/end
  p=$(echo ${1} | sed -E -e 's/^[ ]+//g')

  echo " ${p}"
}

# ruby (rvm/rbenv)
function ruby-prompt-proxy {
  if [[ -x ~/.rvm/bin/rvm-prompt ]]; then
    p=$(~/.rvm/bin/rvm-prompt)

    # if we do indeed have a prompt, output it, else output nothing
    if [[ ${p} =~ '^[ ]*$' ]]; then
      echo ""
    else
      p="%{$fg[magenta]%}${p}%{$reset_color%}"
      echo "$(add-space-to-prompt ${p})"
    fi
  elif [[ ! -z "$(rbenv_prompt_info)" ]]; then
    p="$(rbenv_prompt_info)"
    p="%{$fg[magenta]%}${p}%{$reset_color%}"
    echo "$(add-space-to-prompt ${p})"
  else
    echo ""
  fi
}

function git-prompt-proxy {
  if [[ -x `which git` ]]; then

    local OLD_ZSH_THEME_GIT_PROMPT_DIRTY
    local OLD_ZSH_THEME_GIT_PROMPT_CLEAN
    local dirty

    OLD_ZSH_THEME_GIT_PROMPT_DIRTY=$ZSH_THEME_GIT_PROMPT_DIRTY
    OLD_ZSH_THEME_GIT_PROMPT_CLEAN=$ZSH_THEME_GIT_PROMPT_CLEAN
    ZSH_THEME_GIT_PROMPT_DIRTY="dirty"
    ZSH_THEME_GIT_PROMPT_CLEAN="clean"

    dirty=$(parse_git_dirty)

    if [[ $dirty == "dirty" ]]; then
      ZSH_THEME_GIT_PROMPT_PREFIX=" ${ZSH_THEME_GIT_PROMPT_DIRTY_BRANCH_COLOR}"
    else
      ZSH_THEME_GIT_PROMPT_PREFIX=" ${ZSH_THEME_GIT_PROMPT_CLEAN_BRANCH_COLOR}"
    fi

    ZSH_THEME_GIT_PROMPT_DIRTY=$OLD_ZSH_THEME_GIT_PROMPT_DIRTY
    ZSH_THEME_GIT_PROMPT_CLEAN=$OLD_ZSH_THEME_GIT_PROMPT_CLEAN

    echo "$(git_prompt_info)$(git_prompt_ahead)"
  else
    echo ""
  fi
}

function host-proxy {
  if [[ -n $(run_from_ssh) ]]; then
    echo "%n@%m:"
  else
    echo ""
  fi
}

function repo-type-prompt-proxy {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  hg root >/dev/null 2>/dev/null && echo '☿' && return

  echo '○'
}

function pwd-prompt-proxy {
  echo "%{$fg[cyan]%}%3~%{$reset_color%}"
}

# ZSH_THEME_GIT_PROMPT_PREFIX is set dynamically by git-prompt-proxy based on the clean/dirty status
# Set ZSH_THEME_GIT_PROMPT_CLEAN_BRANCH_COLOR and ZSH_THEME_GIT_PROMPT_DIRTY_BRANCH_COLOR to determine these colors
# You can still set a separte clean/dirty indicator with the normal ZSH_THEME_GIT_PROMPT_CLEAN and
# ZSH_THEME_GIT_PROMPT_DIRTY variables
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN_BRANCH_COLOR="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_DIRTY_BRANCH_COLOR="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$reset_color%}↑"

PROMPT='%{$reset_color%}
$(host-proxy)$(pwd-prompt-proxy)$(git-prompt-proxy)$(ruby-prompt-proxy)
$(repo-type-prompt-proxy) %# '
