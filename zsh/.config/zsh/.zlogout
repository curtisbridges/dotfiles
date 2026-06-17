##
## .zlogout -- executed after shell exit
##

# Reset the terminal window when logging out of ssh connections (needs to be done on
# remote machine). Skip for Cursor agent shells (TERM=dumb): extra stdout breaks
# Cursor's zsh state snapshot parsing and causes "dump_zsh_state: not found".
if [[ -t 1 && "$TERM" != dumb ]]; then
  printf '\e]0;\a'
fi
