#!/bin/bash

# Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[0;33m"
NC="\033[0m" # No Color

# Variables
DOTFILES_REP="https://github.com/danjeltahko/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"
BREWFILE="$DOTFILES_DIR/.config/homebrew/Brewfile"

# Install init
echo "${GREEN}Starting installation..${NC}"

# Create XDG Base Directory
echo "Creating XDG directories"
mkdir -p -v $HOME/.config
mkdir -p -v $HOME/.local/share
mkdir -p -v $HOME/.local/state
mkdir -p -v $HOME/.cache
echo "XDG Base Directories created"

########## Linux installation ##########
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  
  echo "${BLUE}On Linux, will proceed with Linux installation${NC}"

########## MacOS installation ##########
elif [[ "$OSTYPE" == "darwin"* ]]; then
  
  echo "${GREEN}On MacOS, will proceed with MacOS installation${NC}"

  # Check if homebrew is installed, install if it's not
  if ! command -v brew &> /dev/null; then
    echo "${YELLOW}Could not find Homebrew, installing..${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  # Clone dotfiles to repository if not same name already exists
  if [ ! -d "$DOTFILES_DIR" ]; then
    echo "${YELLOW}Cloning dotfiles repository..${NC}"
    git clone "$DOTFILES_REP" "$DOTFILES_DIR"
  else
    echo "${YELLOW}Dotfiles directory already exists in $HOME..${NC}"
  fi
  
  # Update & Upgrade Brew
  echo "${GREEN}Updating homebrew..${NC}"
  brew update
  brew upgrade

  # Install packages in Brewfile
  if [[ -f "$BREWFILE" ]]; then
    echo "Installing packages from Brewfile"
    brew bundle --file="$BREWFILE"
  else
    echo "Brewfile not found at $BREWFILE"
    exit 1
  fi

  # Source zshrc on startup
  echo "Adding [ -f $HOME/.config/zsh/.zshrc ] to /etc/zshrc so we can keep .zshrc in .config directory"
  echo '[ -f $HOME/.config/zsh/.zshrc ] && source $HOME/.config/zsh/.zshrc' | sudo tee -a /etc/zshrc > /dev/null

  echo "${GREEN}Installation Complete!${NC}"

else
  echo "${RED}Not supproted OS${NC}"
  exit 1
fi


# Add themes to bat
# bat cache --build

