#
# Handy command line utilities
#

function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

function fup() {
    echo "Updating flatpak..."
    flatpak update
}

function nup() {
    echo "Updating global npm packages..."
    npm i -g npm && npm update -g
}

function bup() {
    echo "Updating homebrew..."
    brew update && brew upgrade && brew upgrade --cask --greedy
}

function update() {
    if [[ `uname` == 'Darwin' ]]; then
        bup
        # mas upgrade # hasn't worked since 10.13; No ability to login via cmd line
    elif [[ `lsb_release -i -s` == 'Arch' ]]; then
        echo "Updating via yay..."
        yay -Syu
        fup
    else
        echo "Updating via apt..."
        sudo apt update && sudo apt upgrade
        fup
    fi

    nup
}

function javahome() {
  unset JAVA_HOME
  export JAVA_HOME=$(/usr/libexec/java_home -v "$1");
  java -version
}
