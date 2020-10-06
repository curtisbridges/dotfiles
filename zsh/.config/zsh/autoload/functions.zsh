#
# Handy command line utilities
#

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}

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

# Responsive Prompt
parse_git_branch() {
	if [[ -f "$BASH_COMPLETION_DIR/git-completion.bash" ]]; then
		branch=`__git_ps1 "%s"`
	else
		ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
		branch="${ref#refs/heads/}"
	fi

	if [[ `tput cols` -lt 110 ]]; then
		branch=`echo $branch | sed s/feature/f/1`
		branch=`echo $branch | sed s/hotfix/h/1`
		branch=`echo $branch | sed s/release/\r/1`

		branch=`echo $branch | sed s/master/mstr/1`
		branch=`echo $branch | sed s/develop/dev/1`
	fi

	if [[ $branch != "" ]]; then
		if [[ $(git status 2> /dev/null | tail -n1) == "nothing to commit, working directory clean" ]]; then
			echo "${GREEN}$branch${COLOREND} "
		else
			echo "${RED}$branch${COLROEND} "
		fi
	fi
}

working_directory() {
	dir=`pwd`
	in_home=0
	if [[ `pwd` =~ ^"$HOME"(/|$) ]]; then
		dir="~${dir#$HOME}"
		in_home=1
	fi

	workingdir=""
	if [[ `tput cols` -lt 110 ]]; then
		first="/`echo $dir | cut -d / -f 2`"
		letter=${first:0:2}
		if [[ $in_home == 1 ]]; then
			letter="~$letter"
		fi
		proj=`echo $dir | cut -d / -f 3`
		beginning="$letter/$proj"
		end=`echo "$dir" | rev | cut -d / -f1 | rev`

		if [[ $proj == "" ]]; then
			workingdir="$dir"
		elif [[ $proj == "~" ]]; then
			workingdir="$dir"
		elif [[ $dir =~ "$first/$proj"$ ]]; then
			workingdir="$beginning"
		elif [[ $dir =~ "$first/$proj/$end"$ ]]; then
			workingdir="$beginning/$end"
		else
			workingdir="$beginning/…/$end"
		fi
	else
		workingdir="$dir"
	fi

	echo -e "${YELLOW}$workingdir${COLOREND} "
}

parse_remote_state() {
	remote_state=$(git status -sb 2> /dev/null | grep -oh "\[.*\]")
	if [[ "$remote_state" != "" ]]; then
		out="${BLUE}[${COLOREND}"

		if [[ "$remote_state" == *ahead* ]] && [[ "$remote_state" == *behind* ]]; then
			behind_num=$(echo "$remote_state" | grep -oh "behind \d*" | grep -oh "\d*$")
			ahead_num=$(echo "$remote_state" | grep -oh "ahead \d*" | grep -oh "\d*$")
			out="$out${RED}$behind_num${COLOREND},${GREEN}$ahead_num${COLOREND}"
		elif [[ "$remote_state" == *ahead* ]]; then
			ahead_num=$(echo "$remote_state" | grep -oh "ahead \d*" | grep -oh "\d*$")
			out="$out${GREEN}$ahead_num${COLOREND}"
		elif [[ "$remote_state" == *behind* ]]; then
			behind_num=$(echo "$remote_state" | grep -oh "behind \d*" | grep -oh "\d*$")
			out="$out${RED}$behind_num${COLOREND}"
		fi

		out="$out${BLUE}]${COLOREND}"
		echo "$out "
	fi
}

prompt() {
	if [[ $? -eq 0 ]]; then
		exit_status="${BLUE}\$${COLOREND} "
	else
		exit_status="${RED}›\$${COLOREND} "
	fi

	PS1="$(working_directory)$(parse_git_branch)$(parse_remote_state)$exit_status"
}