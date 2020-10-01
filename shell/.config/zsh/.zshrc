# Make sure all our configuration is done in the XDG config dir...
export XDG_CONFIG_HOME="$HOME/.config"
export KEYTIMEOUT=1

# History
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Load zplug
source ${ZDOTDIR:-$HOME}/.zplug.zsh

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

# vi keybinds
bindkey -v

# completions
autoload -Uz compinit && compinit

# User configuration
export PATH="/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# command correction
eval $(thefuck --alias)

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Since I use both Macs (Darwin), Arch Linux (sometimes), and Debian based Linux (servers, etc.) handle
# platform specific setup here.
if [[ `uname` == 'Darwin' ]]; then
#    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#    source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
    if [ $ITERM_SESSION_ID ]; then
        precmd() {
            echo -ne "\033]0;${PWD##*/}\007"
        }
    fi
#elif [[ `lsb_release -i -s` == 'Arch' ]]; then
#    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#else
#    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# source my machine specific settings
if [ -e "${HOME}/.environment" ] ; then
    source ${HOME}/.environment
fi

# Prompt setup
autoload -U promptinit; promptinit
# Pure Prompt
#PURE_PROMPT_SYMBOL=➜
#prompt pure

# Spaceship Prompt
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_VI_MODE_SHOW=false
prompt spaceship

