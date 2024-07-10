# My little Dot Friends

This terminal configuration utilizes the XDG Base Directory for a more organized and structured terminal environment. I started looking at this when my $HOME directory became cluttered with folders and configuration files that no longer fitted my window. So I decided to implement a more Linux-friendly experience for MacOS by centralizing all importatnt configurations in a single location, making them easy to edit and modify. Additionally, simplifying the process of setting up a new machine as well as keeping all my machines updated with any new changes.

So I stumbled upon `stow`, which accoring to it's man page, is a symlink farm manager which takes distinct sets of software and/or data located in separate directories on the filesystem, and makes them all appear to be installed in a single directory tree. And to be honest, this was exactly what i've been looking for.

> I followed an nvim tutorial a while ago which used the Catpuccin Theme, so sorry not sorry for having this whole shell configuration use that theme.. It kinda grew on me.

## Installation

### If MacOS, install Xcode Command Line Tools first.
```bash
xcode-select --install
```

### Install dotfiles 
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/danjeltahko/dotfiles/master/install.sh)"
```

## After installation 

### 1. Open up Alacritty
The `.zshrc` configuration uses zinit as zsh plugin manager so when you open up a new terminal (Alacritty), it will automatically install all the plugins specified in `dotfiles/zinit/zinitrc.zsh`. Previously i used ***oh-my-zsh*** but in my opinion, it got too cluttered and slow. So i did some investigation and found this [zsh plugin manager benchmark](https://github.com/rossmacarthur/zsh-plugin-manager-benchmark). According to the benchmark, `sheldon` was the best option, but it didn't include zinits turbo mode which is significantly faster. Therefore, i chose zinit.

If you have a look in `$HOME/dotfiles/.config/zsh` you can find a `secrets.zsh` file where you can add your API keys and other secrets you frequently use with environment variables.

Also, if you had a `.zshrc` in $HOME directory, that has now been renamed to `.zshrc-bak` so you can add your own configurations to `.zshrc` in dotfiles directory. This is just to ensure that the old configuration won't be sourced as well.

### 2. Configure Git
In `$HOME/.config/git/config` there are some configurations for setting up delta, but also my username and email. So please change that to your own.

### 3. Configure Tmux 
With tmux installed we also need to install all the configured plugins, these can of course be modified in `dotfiles/.config/tmux/tmux.conf`.
To start a new tmux session (the 'htmux' command will print out a cheatsheet), run:
```bash
tmux new
```
Once inside tmux you need to source the config file:
```bash
tmux source $HOME/.config/tmux/tmux.conf
```
When the config file is sourced, use keybinding `ctrl+space I` to install the plugins.
