export NVM_DIR="$HOME/.nvm"

NVM_PREFIX="${HOMEBREW_PREFIX:-/opt/homebrew}/opt/nvm"

# Lazy-load nvm so interactive shell startup stays fast.
if [ -s "${NVM_PREFIX}/nvm.sh" ]; then
  _nvm_lazy_load() {
    unset -f nvm node npm npx corepack yarn pnpm _nvm_lazy_load
    \. "${NVM_PREFIX}/nvm.sh"
    [ -s "${NVM_PREFIX}/etc/bash_completion.d/nvm" ] && \. "${NVM_PREFIX}/etc/bash_completion.d/nvm"
  }

  nvm() { _nvm_lazy_load; nvm "$@"; }
  node() { _nvm_lazy_load; node "$@"; }
  npm() { _nvm_lazy_load; npm "$@"; }
  npx() { _nvm_lazy_load; npx "$@"; }
  corepack() { _nvm_lazy_load; corepack "$@"; }
  yarn() { _nvm_lazy_load; yarn "$@"; }
  pnpm() { _nvm_lazy_load; pnpm "$@"; }
fi

# Python
export PYTHON_HOME="${HOME}/.pyenv/shims"
export PATH=$PATH:$PYTHON_HOME
