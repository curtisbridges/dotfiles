# ~/.bash_profile: executed by bash for login shells.
GREEN="\[\e[0;32m\]"
BLUE="\[\e[0;36m\]"
RED="\[\e[0;31m\]"
YELLOW="\[\e[0;33m\]"
COLOREND="\[\e[00m\]"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# source the system wide bashrc if it exists
if [ -e /etc/bash.bashrc ] ; then
  source /etc/bash.bashrc
fi

# source the users bashrc if it exists
if [ -e "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# source the common environment settings
if [ -e "${HOME}/.environment" ] ; then
  source "${HOME}/.environment"
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi


