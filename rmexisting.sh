#!/bin/bash

files="profile bashrc aliases functions vimrc gitconfig gitignore gitignore_global gitattributes dictionary"

for file in $files; do
    # echo "Creating symlink to $file in home directory."
    rm ~/.$file
done

