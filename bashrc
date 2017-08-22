# Don"t put duplicate lines in the history.
export HISTCONTROL="ignoredups"

export EDITOR=vim
export VISUAL='mvim'

#export GWT_HOME=/usr/local/Cellar/gwt/2.7.0
#export ANDROID_HOME=/usr/local/opt/android-sdk
export LOCALPATH=/usr/local/bin:/usr/local/sbin
export PATH=$LOCALPATH:$PATH


# recoverable typos!
eval "$(thefuck --alias)"
