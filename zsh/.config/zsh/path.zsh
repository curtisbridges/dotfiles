# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH=${HOME}/bin:${PATH}
fi

if [ -d "${HOME}/scripts" ] ; then
  PATH=${HOME}/scripts:${PATH}
fi

if [ -d "${HOMEBREW_PREFIX:-/opt/homebrew}" ] ; then
  # Homebrew
  PATH=${PATH}:${HOMEBREW_PREFIX:-/opt/homebrew}/bin
  PATH=${PATH}:${HOMEBREW_PREFIX:-/opt/homebrew}/sbin
fi

PATH="/usr/local/bin:$PATH"

export PATH

