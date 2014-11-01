#!/bin/bash

files="bash_profile bashrc vimrc gitconfig gitignore gitignore_global gitattributes"

for file in $files; do
    # echo "Creating symlink to $file in home directory."
    rm ~/.$file
done

