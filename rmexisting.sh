#!/bin/bash

files="bash_profile bashrc vimrc gitconfig gitignore gitattributes"

for file in $files; do
    # echo "Creating symlink to $file in home directory."
    rm ~./$file
done

