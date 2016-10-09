#!/bin/sh

files="environment inputrc zshrc bash_profile bashrc aliases functions gitconfig gitignore gitignore_global gitattributes dictionary plan vimrc"

for file in $files; do
    # echo "Creating symlink to $file in home directory."
    rm ~/.$file
done

