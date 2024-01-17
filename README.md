Pull the repository and its submodules...

```bash
$ git clone git@github.com:curtisbridges/dotfiles.git ~
$ cd dotfiles
$ stow --target=$HOME zsh tmux starship # plus whatever else you'd like
```

## Maintenance

To keep the dotfiles up to date, without local changes:

```bash
$ git pull
```

If there are local changes, you'll have to stash them first before pulling from my remote.

To change the default hammerspoon config directory, use this command.
```bash
defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
```

However, I am not currently using Hammerspoon anymore.
