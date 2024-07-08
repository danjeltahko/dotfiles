# Environment Variables that or unsupported by XDG + others

# AWS
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"

# BAT
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/bat.conf"
export BAT_THEME="Catppuccin Mocha"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Homebrew
export HOMEBREW_CACHE="$XDG_CACHE_HOME/Homebrew"
export HOMEBREW_LOGS="$XDG_CACHE_HOME/Homebrew/Logs"
export HOMEBREW_BUNDLE_FILE="$XDG_CONFIG_HOME/homebrew/Brewfile"
export HOMEBREW_CASK_OPTS="--appdir=~/Applications --fontdir=/Library/Fonts"

# Exa change color on files, because default is bold
# ref: man eza_colors
# -------------------|--------------------
# di = directories   | 34 for blue text
# sc = code files    | 32 for green text
# ex = shell scripts | 31 for red text
# bu = build files   | 33 for yellow text
# fi = regular files | 37 for white text
# ln = symlinks      | 36 for cyan text
# co = compressed    | 31 for red text
# --- other files ---|--------------------
# im = image file    | 35 for purple text
# vi = video files   | 35 for purple text
# mu = music files   | 33 for yellow text
# do = document file | 33 for yellow text
export EZA_COLORS="di=34:sc=32:ex=31:*.zsh=31:bu=33:fi=37:ln=36:co=31:im=35:vi=35:mu=33:do=33"

# Less
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# ncurses
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"

# rustup
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

export ANDROID_HOME="$XDG_DATA_HOME/android"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"

# Rust
export CARGO_HOME="$XDG_CONFIG_HOME/cargo"
export CARGO_LOG="$XDG_CONFIG_HOME/cargo/logs"
export CARGO_TARGET_DIR="$XDG_CACHE_HOME/cargo/targets"
export CARGO="$XDG_DATA_HOME/cargo/bin"

# SHELL_GPT
export CHAT_CACHE_PATH="$XDG_CACHE_HOME/shell_gpt/cache"
export CACHE_PATH="$XDG_CACHE_HOME/shell_gpt/cache"
export ROLE_STORAGE_PATH="$XDG_CONFIG_HOME/shell_gpt/roles"
export OPENAI_FUNCTIONS_PATH="$XDG_CONFIG_HOME/shell_gpt/functions"

# TMUX
export TMUX_CONF="$XDG_CONFIG_HOME/tmux/tmux.conf"

# ZOXIDE
export _ZO_DATA_DIR="$XDG_DATA_HOME/ZOXIDE"

