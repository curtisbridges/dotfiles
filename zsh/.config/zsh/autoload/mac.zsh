# Since I use both Macs (Darwin), Arch Linux (sometimes), and Debian based Linux (servers, etc.) handle
# platform specific setup here.

if [[ `uname` == 'Darwin' ]]; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # if [ $ITERM_SESSION_ID ]; then
    #     precmd() {
    #         echo -ne "\033]0;${PWD##*/}\007"
    #     }
    # fi

    # Homebrew sbin
    export PATH="$(brew --prefix)/sbin:$PATH"

    # Node setup -- homebrew nvm lives in homebrew installed dirs
    # [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    # [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
fi
