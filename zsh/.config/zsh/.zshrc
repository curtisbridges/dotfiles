# Curtis Bridges (curtis@curtisbridges.com)
# ZSH config

export KEYTIMEOUT=1

# History
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Load zplug
declare -A ZINIT  # initial Zinit's hash definition, if configuring before loading Zinit, and then:
ZINIT[HOME_DIR]=${ZDOTDIR:-$HOME}/zinit

#source ${ZDOTDIR:-$HOME}/zplug.zsh
source ${ZINIT[HOME_DIR]}/bin/zinit.zsh

# automatic loading code
for config_file (${ZDOTDIR:-$HOME}/autoload/*.zsh)
do
  source $config_file
done

# fuzzy finder
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

# Prompt setup
autoload -U promptinit; promptinit

# Pure Prompt
#PURE_PROMPT_SYMBOL=➜
#prompt pure

# Spaceship Prompt
#SPACESHIP_CHAR_SYMBOL=⚡️
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_VI_MODE_SHOW=false
prompt spaceship

