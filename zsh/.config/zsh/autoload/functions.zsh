#
# ZSH functions
#
# Function to source files if they exist
function zsh_source() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function zsh_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        # For plugins
        zsh_source "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_source "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

function zsh_completion() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        # For completions
        completion_file_path=$(ls $ZDOTDIR/plugins/$PLUGIN_NAME/_*)
        fpath+="$(dirname "${completion_file_path}")"
        zsh_source "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
        fpath+=$(ls $ZDOTDIR/plugins/$PLUGIN_NAME/_*)
        [ -f $ZDOTDIR/.zccompdump ] && $ZDOTDIR/.zccompdump
    fi
    completion_file="$(basename "${completion_file_path}")"
    if [ "$2" = true ] && compinit "${completion_file:1}"
}

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
    bun upgrade
    echo "Updating global npm packages..."
    npm i -g npm && npm update -g
}

function bup() {
    echo "Updating homebrew..."
    brew update && brew upgrade && brew upgrade --cask --greedy
}

function omzup() {
    echo "Updating zsh..."
    omz update
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

    nup
    omzup
}

function javahome() {
  unset JAVA_HOME
  export JAVA_HOME=$(/usr/libexec/java_home -v "$1");
  java -version
}
