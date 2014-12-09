# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

# Don"t put duplicate lines in the history.
export HISTCONTROL="ignoredups"

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour

# Some shortcuts for different directory listings
alias ls='ls -FHG'
alias ll='ls -l'
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.

# Favored applications and app specific customizations
alias macvim='open /Applications/MacVim.app'

export EDITOR=vim
export VISUAL='mate -w'

alias dev='pushd ~/Developer'

#
# Handy command line utilities
#
function setjdk() {
	if [ $# -ne 0 ]; then
		removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
		if [ -n "${JAVA_HOME+x}" ]; then
			removeFromPath $JAVA_HOME
		fi
		export JAVA_HOME=`/usr/libexec/java_home -v $@`
		export PATH=$JAVA_HOME/bin:$PATH
  	fi
 }

function removeFromPath() {
	export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

setjdk 1.8

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

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# Make your directories and files access rights sane.
function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ; }
