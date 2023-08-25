Pull the repository and its submodules...

```bash
$ git clone git@github.com:curtisbridges/dotfiles.git ~
$ cd dotfiles
$ stow --target=$HOME shell tools terminal # plus whatever else you'd like
```

## Maintenance

To keep the dotfiles up to date, without local changes:

```bash
$ git pull
```

If there are local changes, you'll have to stash them first before pulling from my remote.


