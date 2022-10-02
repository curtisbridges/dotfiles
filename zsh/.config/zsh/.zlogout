##
## .zlogout -- executed after shell exit
##

# reset the terminal window when logging out of ssh connections (needs to be done on remote machine)
printf '\e]0;\a'
