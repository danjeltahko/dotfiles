# My little Dot Friends

> WIP!

This terminal configuration utilizes the XDG Base Directory for a more organized and structured terminal environment. I started looking at this when my $HOME directory became cluttered with folders and configuration files that no longer fitted my window. So I decided to implement a more Linux-friendly experience for MacOS by centralizing all importatnt configurations in a single location, making them easy to edit and modify. Additionally, simplifying the process of setting up a new machine as well as keeping all my machines updated with any new changes.

So I stumbled upon `stow`, which accoring to it's man page, is a symlink farm manager which takes distinct sets of software and/or data located in separate directories on the filesystem, and makes them all appear to be installed in a single directory tree. And to be honest, this was exactly what i've been looking for.

> I followed an nvim tutorial a while ago which used the Catpuccin Theme, so sorry not sorry for having this whole shell configuration use that theme.. It kinda grew on me.

## Installation

### 1. Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```bash
# Install zsh
brew install zsh

# Change default login shell
chsh -s $(which zsh)

```

## Install everything
```bash
# add the path for zshrc to /etc/zshrc
sudo ./install.sh
```
