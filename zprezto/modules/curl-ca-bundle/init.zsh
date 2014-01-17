if (( $+commands[brew] )); then
  local curl_ca_prefix="$(brew --prefix curl-ca-bundle)"

  if [[ -d "${curl_ca_prefix}" ]]; then
    export SSL_CERT_FILE="${curl_ca_prefix}/share/ca-bundle.crt"
  else
    autoload -Uz colors
    colors

    echo -n $fg[red]
    echo "!!"
    echo "!! You've enabled the curl-ca-bundle zprezto module"
    echo "!! Run \`install-curl-ca-bundle\` to install the certificate bundle"
    echo "!! and set the environment variable"
    echo "!!"
    echo -n $reset_color
  fi
fi
