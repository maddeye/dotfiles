# dotfiles

**Table of Contents**

<!-- toc -->

-   [About](#about)
    -   [Installing](#installing)
    -   [Recreate](#recreate)
-   [Props to](#props)

<!-- tocstop -->

## About

These are my dotfiles to backup my system. Be aware, that this is only my configuration and may not be for you or your system.

### Installing

```console
curl -Lks https://github.com/maddeye/dotfiles/main/install.sh | /bin/bash
```

This will backup preexisting dotfiles and restore everything in the repo.

### Recreate

If you want to recreate this repo for your own dotfiles you can use this code:

```console
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

It will create a .cfg folde as a [bare repository](http://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/). Then we create an alias **_config_** which we will use instead of the regular git, and add them to our **_.bashrc_**.

Now you can add your dotfiles with

```console
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

## Props

Huge thanks to [**_StreakyCobra_** over at Hackernews](https://news.ycombinator.com/item?id=11071754) for his elegant setup. Also thanks to Atlassing for there [tutorial](https://www.atlassian.com/git/tutorials/dotfiles).
