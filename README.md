# My little Dot Friends

This terminal configuration uses XDG Base Directory for a better structured
terminal environemnt. I started looking at this when my $HOME directory started
to get cluttered with folders and configuration files that didn't fit my window
anymore. I also wanted to have all my configurations in one place with the possibility to easily edit and change anything as well as simplifing the proccess of getting started on a new machine.

## 1. Installation

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
brew install stow
brew install git
brew install --cask alacritty
brew install --cask font-fira-code-nerd-font
brew install fzf
brew install eza
brew install zoxide 
brew install bat
brew install jandedobbeleer/oh-my-posh/oh-my-posh

## Install everything
```bash
# add the path for zshrc to /etc/zshrc
sudo ./install.sh
```
