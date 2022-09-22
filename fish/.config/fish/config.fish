### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/bin $fish_user_paths
# Get all homebrew binaries
fish_add_path $(brew --prefix)/bin

### EXPORT ###
set fish_greeting                         # Supresses fish's intro message
set TERM "xterm-256color"                 # Sets the terminal type
set EDITOR "vim"                          # $EDITOR use vim in terminal
set VISUAL "code -nw"                     # $VISUAL use VS Code in GUI mode

### SET MANPAGER
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
# The bindings for !! and !$
if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Changing "ls" to "exa"
alias ls='exa -a --color=always --group-directories-first' # my preferred listing
alias la='exa -al --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# Install Starship
starship init fish | source
