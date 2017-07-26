#!/bin/sh

files="environment bash_profile bashrc zshrc inputrc aliases functions gitconfig gitconfig-riverbed gitignore gitignore_global gitattributes dictionary plan vimrc"

# Make symlinks
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -sf $file ~/.$file
done

