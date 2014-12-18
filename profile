# base-files version 3.9-3

# To pick up the latest recommended .bash_profile content,
# look in /etc/defaults/etc/skel/.bash_profile

# Modifying /etc/skel/.bash_profile directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# ~/.bash_profile: executed by bash for login shells.
GREEN="\[\e[0;32m\]"
BLUE="\[\e[0;36m\]"
RED="\[\e[0;31m\]"
YELLOW="\[\e[0;33m\]"
COLOREND="\[\e[00m\]"

# source the system wide bashrc if it exists
if [ -e /etc/bash.bashrc ] ; then
  source /etc/bash.bashrc
fi

# source the users bashrc if it exists
if [ -e "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# source the users aliases if it exists
if [ -e "${HOME}/.aliases" ] ; then
  source "${HOME}/.aliases"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH=${HOME}/bin:${PATH}
fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH=${HOME}/man:${MANPATH}
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH=${HOME}/info:${INFOPATH}
# fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

if [ -d "${HOME}/.homebrew_token" ] ; then
	source "${HOME}/.homebrew_token"
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

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

PROMPT_COMMAND=prompt