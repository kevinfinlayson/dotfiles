# Dotfiles

Based off of [Kevin Clark's dotfiles](https://github.com/vernalkick/dotfiles) which are themselves based off of [David Cornu's dotfiles](https://github.com/davidcornu/dotfiles).

## Installation

```shell
$ cd ~/
$ git clone git@github.com:kevinfinlayson/dotfiles.git
$ cd ~/dotfiles
$ ./bootstrap.sh
```

Optionally you can also run `osx.sh` to make sweeping changes to your OS. Use at your own risk:

```shell
$ cd ~/dotfiles
$ ./osx.sh
```

The boostrap script will symlink config files from `~/dotfiles` into `~/` and install the following packages:

- https://github.com/robbyrussell/oh-my-zsh
- https://github.com/sindresorhus/pure
- https://github.com/zsh-users/zsh-syntax-highlighting
- https://github.com/gmarik/vundle
- https://github.com/sstephenson/rbenv
- https://github.com/sstephenson/ruby-build
- https://github.com/creationix/nvm

## Updating

```shell
$ cd ~/dotfiles
$ git pull
$ ./bootstrap.sh
```
