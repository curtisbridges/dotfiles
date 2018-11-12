# DotFiles

This is my collection of [configuration files](http://dotfiles.github.io/).

## Usage

Pull the repository...
```bash
$ git clone git@github.com:curtisbridges/dotfiles.git ~
$ cd ~/dotfiles
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
$ stow atom bash git vim zsh # plus whatever else you'd like
```
Optionally, you can install all the homebrew software and casks I find useful:
```bash
$ brew bundle brew/Brewfile
```

