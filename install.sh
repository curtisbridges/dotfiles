#!/bin/bash

files="bash_profile bashrc aliases functions vimrc gitconfig gitignore gitignore_global gitattributes dictionary"
dir=~/Developer/DotFiles

# Make symlinks
for file in $files; do
    # echo "Moving any existing dotfiles from ~ to $olddir"
    # mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -sf $dir/$file ~/.$file
done

