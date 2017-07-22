ZPREZTO_ASDF_DIR="${HOME}/.asdf"

if [[ ! -d "${ZPREZTO_ASDF_DIR}" ]]; then
  echo "Installing ASDF..."
  install-asdf "${ZPREZTO_ASDF_DIR}"
  source "${ZPREZTO_ASDF_DIR}/asdf.sh"
  install-asdf-plugins
elif [[ -f "${ZPREZTO_ASDF_DIR}/asdf.sh" ]]; then
  source "${ZPREZTO_ASDF_DIR}/asdf.sh"
fi

unset ZPREZTO_ASDF_DIR
