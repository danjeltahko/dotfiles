##########################################
#                                        #
#          tacobacos ZSH config          #
#                                        #
##########################################

# Start timer if you want to benchmark (uncomment)
# zmodload zsh/datetime
# zsh_start_time=$EPOCHREALTIME

# XDG Base Directory init
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/run/user/$UID"

# Adding Homebrew related to PATH if macOS
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# General settings
export EDITOR="nvim" # Set default editor to nvim
export LANG=en_US.UTF-8 # Set language
setopt autocd # Enable 'cd' without typing 'cd'

# ZSH Configurations
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
source $ZDOTDIR/secrets.zsh
ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdumps-$ZSH_VERSION"

# Zinit ZSH Plugin Manager init
source "$XDG_CONFIG_HOME/zinit/zinitrc.zsh"

# Load completions
autoload -Uz compinit
if [[ -f $ZSH_COMPDUMP && $ZSH_COMPDUMP -ot $ZDOTDIR/.zshrc ]]; then
 rm -f $ZSH_COMPDUMP
fi
compinit -d $ZSH_COMPDUMP
zinit cdreplay -q

# History
HISTSIZE=5000 # Set history size
HIST_STAMPS="yyyy-mm-dd" # Format timestamp in history
export HISTFILE="$XDG_STATE_HOME/zsh/history" # Set history file location
SAVEHIST=$HISTSIZE # Number of history entries to save
HISTDUP=erase # Erase duplicates in history
setopt appendhistory # Append history entires instead of overwrite
setopt sharehistory # Share history across all sessions
setopt hist_ignore_space # Ignore commands that start with space
setopt hist_ignore_all_dups # Ignore all duplicate commands 
setopt hist_save_no_dups # Not save duplicate commands
setopt hist_ignore_dups # Not record duplicate entries
setopt hist_find_no_dups # not find duplicate entires

# Source all configs from utils
for config_file ("$ZDOTDIR"/utils/*.zsh); do
  source "$config_file"
done

# Load Promt Configurations
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/ohmyposh/omprc.toml)"
fi

# Shell integrations 
source <(fzf --zsh)
# bindkey '^f' fzf_widget() { fzf }
eval "$(zoxide init --cmd cd zsh)"

# Shell-GPT integration ZSH v0.2
_sgpt_zsh() {
if [[ -n "$BUFFER" ]]; then
    _sgpt_prev_cmd=$BUFFER
    BUFFER+=""
    zle -I && zle redisplay
    BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd" --no-interaction)
    zle end-of-line
fi
}
zle -N _sgpt_zsh
bindkey '^g' _sgpt_zsh

# End timer if you want to benchmark (uncomment)
# zsh_end_time=$EPOCHREALTIME
# elapsed_time=$(echo "$zsh_end_time - $zsh_start_time" | bc)
# echo "Zsh startup time: ${elapsed_time} seconds"

