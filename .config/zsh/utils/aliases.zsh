## Some Aliases to make your life easier..

# Use bat instead of cat
alias cat="bat"
alias -g -- -h="-h 2>&1 | bat --language=help --style=plain"
alias -g -- --help="--help 2>&1 | bat --language=help"

# Eza (I like to see my dotfiles with every ls)
alias ls="eza --across --icons -a"
alias al="eza --across --icons --long --no-user --git -a"

# Homebrew regular cleanup
alias brewup='brew update; brew upgrade; brew cleanup'

# Git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gcm="git commit -m"
alias gco="git checkout"
alias gb="git branch"
alias gl="git log"
alias gd="git diff"

# Nvim instead of vim
alias vim='nvim'

# Python3 as default
alias pip="pip3"
alias python='python3'

# TMUX aliases
alias ta="tmux attach -t"
alias tn="tmux new -s"
alias htmux="python3 $XDG_CONFIG_HOME/zsh/scripts/tmux_help.py"
