#!/bin/bash

files="profile bashrc aliases vimrc gitconfig gitignore gitignore_global gitattributes"

for file in $files; do
    # echo "Creating symlink to $file in home directory."
    rm ~/.$file
done

