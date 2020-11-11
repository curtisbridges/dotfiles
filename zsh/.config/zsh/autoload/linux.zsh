# setup linux specific config here
if [[ `uname` == 'Linux' ]]; then
  if [[ `lsb_release -i -s` == 'Arch' ]]; then
    export ZPLUG_HOME=~/.zplug
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  else
    #export ZPLUG_HOME=/usr/share/zplug
    export ZPLUG_HOME=~/.zplug
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    alias bat=batcat
  fi
fi

