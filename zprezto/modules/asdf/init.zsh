ASDF_DIR="${HOME}/.asdf"

if [[ ! -d "${ASDF_DIR}" ]]; then
  echo "Installing ASDF..."
  install-asdf "${ASDF_DIR}"
  source "${ASDF_DIR}/asdf.sh"
  install-asdf-plugins
elif [[ -f "${ASDF_DIR}/asdf.sh" ]]; then
  source "${ASDF_DIR}/asdf.sh"
fi

unset ASDF_DIR