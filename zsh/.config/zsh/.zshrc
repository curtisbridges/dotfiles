neofetch

echo "Work hard. Get shit done."

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export KEYTIMEOUT=1

# source my environment settings
if [ -e "${HOME}/.environment" ] ; then
    source ${HOME}/.environment
fi

# options
# -------
setopt hist_ignore_all_dups  # remove older duplicate entries from history
#setopt share_history         # share history between different instances of the shell
setopt hist_reduce_blanks    # remove superfluous blanks from history items
setopt auto_list             # automatically list choices on ambiguous completion
setopt menu_complete         # insert first suggestion while autocompleting
setopt prompt_subst          # allow command, param and arithmetic expansion in the prompt
setopt auto_menu             # automatically use menu completion
setopt always_to_end         # move cursor to end if word had one match
# setopt auto_cd             # auto cd when writing dir in the shell
# setopt correctall          # correct typo(ed) commands
unsetopt correct_all

# Lines configured by zsh-newuser-install
# HISTFILE=~/.histfile
# HISTSIZE=1000
# SAVEHIST=1000
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(autojump aws docker docker-compose extract git git-extras git-flow history ng node npm vi-mode vscode web-search)

# User configuration
export PATH="/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

if [[ `uname` == 'Darwin' ]]; then
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
elif [[ `lsb_release -i -s` == 'Arch' ]]; then
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR="nvim"
else
    export EDITOR="nvim"
    export VISUAL="code"
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="vim ~/.oh-my-zsh"
# export ANDROID_HOME=/usr/local/opt/android-sdk

# Requires osx plugin
# tab	Open the current directory in a new tab
# ofd	Open the current directory in a Finder window
# pfd	Return the path of the frontmost Finder window
# pfs	Return the current Finder selection
# cdf	cd to the current Finder directory
# pushdf	pushd to the current Finder directory
# quick-look	Quick-Look a specified file
# man-preview	Open a specified man page in Preview app
# showfiles	Show hidden files
# hidefiles	Hide the hidden files
# itunes	Control iTunes. User itunes -h for usage details
# spotify	Control Spotify and search by artist, album, track and etc.

PURE_PROMPT_SYMBOL=➜

# prompt pure

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# You can set $NVM_DIR to any location, but leaving it unchanged from
# /usr/local/opt/nvm will destroy any nvm-installed Node installations
# upon upgrade/reinstall.

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/Developer/Personal/dotfiles/zsh/.config/zsh/.p10k.zsh.
[[ ! -f ~/Developer/Personal/dotfiles/zsh/.config/zsh/.p10k.zsh ]] || source ~/Developer/Personal/dotfiles/zsh/.config/zsh/.p10k.zsh