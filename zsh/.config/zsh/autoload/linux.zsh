# setup linux specific config here
if [[ `uname` == 'Linux' ]]; then
  export ZPLUG_HOME=~/.zplug
  if [[ `lsb_release -i -s` == 'Arch' ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    export PATH=$PATH:$HOME/.npm-global/bin
  else
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi
fi

