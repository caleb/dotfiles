#
# Configures PHP and php-version
#
# Authors: Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load php-version into the shell session.
if [[ -s "$HOME/.php-version/php-version.sh" ]]; then
  source "$HOME/.php-version/php-version.sh"
elif [[ -s "/usr/share/php-vesrion/php-version.sh" ]]; then
  source "/usr/share/php-vesrion/php-version.sh"
elif [[ -s "/usr/local/share/php-vesrion/php-version.sh" ]]; then
  source "/usr/local/share/php-vesrion/php-version.sh"
fi

# Return if requirements are not found.
if (( ! $+commands[php-version] )); then
  return 1
fi
