# Since I use both Macs (Darwin), Arch Linux (sometimes), and Debian based Linux (servers, etc.) handle
# platform specific setup here.
if [[ `uname` == 'Darwin' ]]; then
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # if [ $ITERM_SESSION_ID ]; then
    #     precmd() {
    #         echo -ne "\033]0;${PWD##*/}\007"
    #     }
    # fi
fi
