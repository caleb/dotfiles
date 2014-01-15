if (( $+commands[brew] )); then
  local curl_ca_prefix="$(brew --prefix curl-ca-bundle)"
  if (( $? == 0 )); then
    export SSL_CERT_FILE="${curl_ca_prefix}/share/ca-bundle.crt"
  else
    echo "!!"
    echo "!! You've enabled the curl-ca-bundle module, run `brew install curl-ca-bundle` to set the environment variable"
    echo "!!"
  fi
fi
