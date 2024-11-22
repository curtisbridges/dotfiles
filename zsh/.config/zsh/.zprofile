##
## .zprofile -- executed before .zshrc
##
if [[ `uname` == 'Darwin' ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi
