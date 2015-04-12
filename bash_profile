# base-files version 3.9-3

# To pick up the latest recommended .bash_profile content,
# look in /etc/defaults/etc/skel/.bash_profile

# Modifying /etc/skel/.bash_profile directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

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

# source the users aliases if it exists
if [ -e "${HOME}/.aliases" ] ; then
  source "${HOME}/.aliases"
fi

# source the users functions if it exists
if [ -e "${HOME}/.functions" ] ; then
  source "${HOME}/.functions"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH=${HOME}/bin:${PATH}
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

if [ -d "${HOME}/.homebrew_token" ] ; then
	source "${HOME}/.homebrew_token"
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

PROMPT_COMMAND=prompt

# The next line updates PATH for the Google Cloud SDK.
source '/Users/cmb/Applications/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/cmb/Applications/google-cloud-sdk/completion.bash.inc'
