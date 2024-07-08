## FZF
# Show content if file, otherwise tree
export FZF_CTRL_T_OPTS="--preview
  'if [ -d {} ]; then
    eza --across --tree --level=2 --color=always --icons {};
  else
    bat {};
  fi'
  --height 60%"

# Catppuccin Mocha Theme
export FZF_DEFAULT_OPTS=" \
--multi \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8" 

## Add tmux?? https://arc.net/l/quote/nzvwocrj
# Remove .git folders
#
# --tmux [center|top|bottom|left|right][,SIZE[%]][,SIZE[%]]

# fzf --tmux center         # Center, 50% width and height
# fzf --tmux 80%            # Center, 80% width and height
# fzf --tmux 100%,50%       # Center, 100% width and 50% height
# fzf --tmux left,40%       # Left, 40% width
# fzf --tmux left,40%,90%   # Left, 40% width, 90% height
# fzf --tmux top,40%        # Top, 40% height
# fzf --tmux bottom,80%,40% # Bottom, 80% height, 40% height

# Open in tmux popup if on tmux, otherwise use --height mode
# export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border top'

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --across --tree --level=2 --color=always --icons $realpath'
zstyle ':fzf-tab:complete:eza:*' fzf-preview 'eza --across --tree --level=2 --color=always --icons $realpath'
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

