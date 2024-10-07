#!/bin/bash

# Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[0;33m"
WHITE="\033[1;37m"
NC="\033[0m" # No Color

# Variables
DOTFILES_REP="https://github.com/danjeltahko/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"
BREWFILE="$DOTFILES_DIR/.config/homebrew/Brewfile"

# Install init
echo -e "${BLUE}==> ${WHITE}Starting installation..${NC}"

# Create XDG Base Directory
echo "Creating XDG directories"
mkdir -p -v $HOME/.config
mkdir -p -v $HOME/.local/share
mkdir -p -v $HOME/.local/state/zsh
mkdir -p -v $HOME/.cache
echo "XDG Base Directories created"

########## Linux installation ##########
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  
  echo -e "${BLUE}==> ${WHITE}On Linux, will proceed with Linux installation${NC}"

  # Check if homebrew is installed, install if it's not
  if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}Could not find Homebrew, installing..${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi

  # Clone dotfiles to repository if not same name already exists
  if [ ! -d "$DOTFILES_DIR" ]; then
    echo -e "${BLUE}==> ${WHITE}Cloning dotfiles repository..${NC}"
    git clone "$DOTFILES_REP" "$DOTFILES_DIR"
    touch $DOTFILES_DIR/.config/zsh/secrets.zsh # add the secrets file
  else
    echo -e "${YELLOW}Dotfiles directory already exists in $HOME${NC}"
  fi
  
  # Update & Upgrade Brew
  brew update
  brew upgrade

  # Install packages in Brewfile
  if [[ -f "$BREWFILE" ]]; then
    echo -e "${BLUE}==> ${WHITE}Installing packages from Brewfile${NC}"
    brew bundle --file="$BREWFILE".linux
  else
    echo -e "${RED}Brewfile not found at $BREWFILE ${NC}"
    exit 1
  fi

  # Symbolic Link files
  echo -e "${BLUE}==> ${WHITE}Creating symbolic links for dotfiles${NC}"
  cd "${DOTFILES_DIR}" || exit 1
  stow -v .
  
  echo -e "${BLUE}==> ${WHITE}Setting up the last configurations${NC}"
  bat cache --build # add themes to bat
  # Installing TPM
  if [ ! -d "$DOTFILES_DIR/.config/tmux/plugins/tpm" ]; then
    echo "${GREEN}Installing Tmux Plugin Manager${NC}"
    git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
  fi
  # Source configured zshrc on startup
  if [[ -f "$HOME/.zshrc" ]]; then
    # First rename existing zshrc so it doesn't get sourced
    mv $HOME/.zshrc $HOME/.zshrc-bak
  fi
  echo "\nAdding [ -f $HOME/.config/zsh/.zshrc ] to /etc/zshrc"
  echo "So we can keep .zshrc in .config directory instead of \$HOME"
  echo '[ -f $HOME/.config/zsh/.zshrc ] && source $HOME/.config/zsh/.zshrc' | sudo tee -a /etc/zsh/zshrc > /dev/null

  echo -e "\n${GREEN}Installation Completed!\nPlease exit and open up Alacritty${NC}"

########## MacOS installation ##########
elif [[ "$OSTYPE" == "darwin"* ]]; then
  
  echo -e "${BLUE}==> ${WHITE}On MacOS, will proceed with MacOS installation..${NC}"

  # Check if homebrew is installed, install if it's not
  if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}Could not find Homebrew, installing..${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  # Clone dotfiles to repository if not same name already exists
  if [ ! -d "$DOTFILES_DIR" ]; then
    echo -e "${BLUE}==> ${WHITE}Cloning dotfiles repository..${NC}"
    git clone "$DOTFILES_REP" "$DOTFILES_DIR"
    touch $DOTFILES_DIR/.config/zsh/secrets.zsh # add the secrets file
  else
    echo -e "${YELLOW}Dotfiles directory already exists in $HOME${NC}"
  fi
  
  # Update & Upgrade Brew
  brew update
  brew upgrade

  # Install packages in Brewfile
  if [[ -f "$BREWFILE" ]]; then
    echo -e "${BLUE}==> ${WHITE}Installing packages from Brewfile${NC}"
    brew bundle --file="$BREWFILE".mac
  else
    echo -e "${RED}Brewfile not found at $BREWFILE ${NC}"
    exit 1
  fi

  # Symbolic Link files
  echo -e "${BLUE}==> ${WHITE}Creating symbolic links for dotfiles${NC}"
  cd "${DOTFILES_DIR}" || exit 1
  stow -v .
  
  echo -e "${BLUE}==> ${WHITE}Setting up the last configurations${NC}"
  bat cache --build # add themes to bat
  # Installing TPM
  if [ ! -d "$DOTFILES_DIR/.config/tmux/plugins/tpm" ]; then
    echo "${GREEN}Installing Tmux Plugin Manager${NC}"
    git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
  fi
  # Source configured zshrc on startup
  if [[ -f "$HOME/.zshrc" ]]; then
    # First rename existing zshrc so it doesn't get sourced
    mv $HOME/.zshrc $HOME/.zshrc-bak
  fi
  echo "\nAdding [ -f $HOME/.config/zsh/.zshrc ] to /etc/zshrc"
  echo "So we can keep .zshrc in .config directory instead of \$HOME"
  echo '[ -f $HOME/.config/zsh/.zshrc ] && source $HOME/.config/zsh/.zshrc' | sudo tee -a /etc/zshrc > /dev/null

  echo -e "\n${GREEN}Installation Completed!\nPlease exit and open up Alacritty${NC}"

else
  echo "${RED}Not supproted OS${NC}"
  exit 1
fi
