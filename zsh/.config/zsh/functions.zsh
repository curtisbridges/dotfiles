#
# ZSH functions
#
# Function to source files if they exist
function clean() {
    filter="${1:-snapshot}"
    git status --porcelain | awk '($1 != "??") {print $2}' | grep "$filter" | xargs git checkout --
}

#
# Handy command line utilities
#

# Handy Extract Program
function extract() {
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

function take {
    mkdir -p $1
    cd $1
}

# find shorthand
function f() {
	find . -name "$1" 2>&1 | grep -v 'Permission denied'
}

# HTTP Status lookup
hs () {
    curl https://httpstat.us/$1
}

function fup() {
    echo "Updating flatpak..."
    flatpak update
}

function nup() {
    # bun upgrade
    echo "Updating global npm packages..."
    npm i -g npm && npm update -g
}

function bup() {
    echo "Updating homebrew..."
    brew update && brew upgrade && brew upgrade --cask --greedy
}

unalias gup &> /dev/null
function gup() {
    echo "Updating git repos..."
    antidote update
}

function update() {
    if [[ `uname` == 'Darwin' ]]; then
        bup
        # mas upgrade # hasn't worked since 10.13; No ability to login via cmd line
    elif [[ `lsb_release -i -s` == 'Arch' ]]; then
        echo "Updating via yay..."
        yay -Syu
        fup
    elif [[ `lsb_release -i -s` == 'Fedora' ]]; then
        echo "Updating via dnf..."
        # sudo dnf check-update
        sudo dnf upgrade -y
        fup
    else
        echo "Updating via apt..."
        sudo apt update && sudo apt upgrade
        fup
    fi

    gup
}

function javahome() {
  unset JAVA_HOME
  export JAVA_HOME=$(/usr/libexec/java_home -v "$1");
  java -version
}

# See all your top commands
function topc() {
    history | awk 'BEGIN {FS="[ \t]+|\\|"} {print $5}' | sort | uniq -c | sort -nr | head -20
}
