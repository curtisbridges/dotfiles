# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH=${HOME}/bin:${PATH}
fi

if [ -d "${HOME}/scripts" ] ; then
  PATH=${HOME}/scripts:${PATH}
fi

if [ -d "${HOME}/.ssh" ] ; then
  ssh-add "${HOME}/.ssh/id_rsa" &> /dev/null
fi

export PATH="$PATH:/usr/lib/ccache/bin"

