# setup linux specific config here
if [[ `uname` == 'Linux' ]]; then
  if [[ `lsb_release -i -s` == 'Arch' ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  else
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi
fi

