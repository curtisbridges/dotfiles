##
## .zprofile -- executed before .zshrc
##
if [[ `uname` == 'Darwin' ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

if [[ `uname` == 'Linux' ]]; then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
