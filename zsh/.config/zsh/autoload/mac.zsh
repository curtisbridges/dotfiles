# Since I use both Macs (Darwin), Arch Linux (sometimes), and Debian based Linux (servers, etc.) handle
# platform specific setup here.
if [[ `uname` == 'Darwin' ]]; then
# These are commented out because I now have zplug loading them. Keeping here in case I drop zplug.
#    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#    source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
#    [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
    if [ $ITERM_SESSION_ID ]; then
        precmd() {
            echo -ne "\033]0;${PWD##*/}\007"
        }
    fi

    # Define ZPLUG's location
    export ZPLUG_HOME=/usr/local/opt/zplug
fi

