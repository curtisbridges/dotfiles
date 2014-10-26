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

# source the system wide bashrc if it exists
if [ -e /etc/bash.bashrc ] ; then
  source /etc/bash.bashrc
fi

# source the users bashrc if it exists
if [ -e "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH=${HOME}/bin:${PATH}
fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH=${HOME}/man:${MANPATH}
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH=${HOME}/info:${INFOPATH}
# fi

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
#export ANDROID=/Applications/Android\ Studio.app/sdk
#export GWT_HOME=~/Applications/gwt-2.6.1

#export ANT_HOME=~/Applications/apache-ant-1.9.4
#export MAVEN_HOME=~/Applications/apache-maven-3.2.3
#export GRADLE_HOME=~/Applications/gradle-2.1

#export PATH=$PATH:$ANT_HOME/bin:$MAVEN_HOME/bin:$GRADLE_HOME/bin:$ANDROID/tools:$ANDROID/platform-tools:$GWT_HOME
#export PATH=$PATH:$ANDROID/tools:$ANDROID/platform-tools

if [ -d "${HOME}/.homebrew_token" ] ; then
	source "${HOME}/.homebrew_token"
fi
