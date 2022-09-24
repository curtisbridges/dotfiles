# General
abbr rm "rm -i"
abbr cp "cp -i"
abbr mv "mv -i"
abbr mkdir "mkdir -p"
abbr h "history"
abbr fd "fd -H"
abbr cat bat

# Changing "ls" to "exa"
abbr ls 'exa --color=always --group-directories-first'     # my preferred listing
abbr la 'exa -al --color=always --group-directories-first' # all files and dirs
abbr ll 'exa -l --color=always --group-directories-first'  # long format
abbr lt 'exa -aT --color=always --group-directories-first' # tree listing
abbr l. 'exa -a | egrep "^\."'
abbr li 'exa --icons'
