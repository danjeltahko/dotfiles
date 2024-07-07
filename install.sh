#!/bin/bash


echo "Will add [ -f $HOME/.config/zsh/.zshrc ] to /etc/zshrc"
echo '[ -f $HOME/.config/zsh/.zshrc ] && source $HOME/.config/zsh/.zshrc' >> /etc/zshrc
