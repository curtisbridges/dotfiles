# Just show some machine info mostly for vanity reasons.
neofetch

# And a "motivational" message.
echo "Work hard. Get shit done."

# Make sure all our configuration is done in the XDG config dir...
export XDG_CONFIG_HOME="$HOME/.config"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export KEYTIMEOUT=1

# source my machine specific settings
if [ -e "${HOME}/.environment" ] ; then
    source ${HOME}/.environment
fi

# options
# -------
setopt hist_ignore_all_dups  # remove older duplicate entries from history
setopt hist_find_no_dups     # ignore duplicates when searching
setopt hist_reduce_blanks    # remove superfluous blanks from history items
setopt share_history         # share history between different instances of the shell
setopt auto_list             # automatically list choices on ambiguous completion
setopt menu_complete         # insert first suggestion while autocompleting
setopt prompt_subst          # allow command, param and arithmetic expansion in the prompt
setopt auto_menu             # automatically use menu completion
setopt always_to_end         # move cursor to end if word had one match
setopt auto_cd               # auto cd when writing dir in the shell
# setopt correctall          # correct typo(ed) commands
unsetopt correct_all

# History
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# vi keybinds
bindkey -v

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="false"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Plugins
plugins=(
    autojump docker docker-compose dotenv 
    extract git git-extras git-flow history 
    node npm osx vi-mode web-search
)

# User configuration
export PATH="/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# Use Oh-My-Zsh.
source $ZSH/oh-my-zsh.sh

# command correction
eval $(thefuck --alias)

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Since I use both Macs (Darwin), Arch Linux (sometimes), and Debian based Linux (servers, etc.) handle
# platform specific setup here.
if [[ `uname` == 'Darwin' ]]; then
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
elif [[ `lsb_release -i -s` == 'Arch' ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Default Apps
export EDITOR="nvim"
export VISUAL="code -n"
export TERMINAL="iterm"
export BROWSER="safari"
export PAGER="less"

# Prompt setup
autoload -U promptinit; promptinit
# Pure Prompt
#PURE_PROMPT_SYMBOL=➜
#prompt pure

# Spaceship Prompt
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_VI_MODE_SHOW=false
prompt spaceship

