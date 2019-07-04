# DotFiles

This is my collection of [configuration files](http://dotfiles.github.io/).

## Usage

Pull the repository and its submodules...
```bash
$ git clone git@github.com:curtisbridges/dotfiles.git ~
$ cd ~/dotfiles
$ git pull --recurse-submodules
```

Installing is easiest using [homebrew](https://brew.sh) and create the symbolic links using [GNU
stow](https://www.gnu.org/software/stow/).

Install homebrew:
```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
Install stow:
```bash
$ brew install stow
$ cd dotfiles # wherever you cloned the repo to, recommend one directory level above home dir
$ stow bash git vim vscode zsh # plus whatever else you'd like
```
Optionally, you can install all the homebrew software and casks I find useful:
```bash
$ brew bundle --global # requires `stow brew` was executed
```
For the best Terminal and vim experience, clone the [powerline](https://github.com/powerline/fonts) patched font repo into a temporary directory and install them:
```bash
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```
At the time of this update, I'm using `DejaVu Sans` in vim and manually setting it in the Terminal.app.

## Maintenance

To keep the dotfiles up to date, without local changes:
```bash
$ git pull
```
If there are local changes, you'll have to stash them first before pulling from my remote.

To update the vim package submodules:
```bash
$ git submodule update --remote
```
