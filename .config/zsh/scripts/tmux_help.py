#!/usr/bin/env python3

"""
Tmux Cheat Sheet

KEYBINDINGS
Sessions:
- tmux new: Start a new session
- tmux new -s mysession: Start a new session with the name mysession
- tmux kill-session -t mysession: Kill/delete session mysession
- tmux kill-session -a: Kill/delete all sessions but the current
- tmux kill-session -a -t mysession: Kill/delete all sessions but mysession
- Ctrl + space $: Rename session
- Ctrl + space d: Detach from session
- attach -d: Detach others on the session (Maximize window by detach other clients)
- tmux ls / tmux list-sessions / Ctrl + b s: Show all sessions
- tmux a / tmux at / tmux attach / tmux attach-session: Attach to last session
- tmux a -t mysession / tmux at -t mysession / tmux attach -t mysession / tmux attach-session -t mysession: Attach to a session with the name mysession

Windows:
- tmux new -s mysession -n mywindow: Start a new session with the name mysession and window mywindow
- Ctrl + space n: Create window
- Ctrl + space ,: Rename current window
- Ctrl + space &: Close current window
- Ctrl + space w: List windows
- Ctrl + space h: Previous window
- Ctrl + space l: Next window
- Ctrl + space 0 ... 9: Switch/select window by number
- Ctrl + space l: Toggle last active window
- swap-window -s 2 -t 1: Reorder window, swap window number 2(src) and 1(dst)
- swap-window -t -1: Move current window to the left by one position

Panes:
- Ctrl + space ;: Toggle last active pane
- Ctrl + space %: Split pane with horizontal layout
- Ctrl + space ": Split pane with vertical layout
- Ctrl + space {: Move the current pane left
- Ctrl + space }: Move the current pane right
- Ctrl + space h j k l : Switch to pane to the direction
- setw synchronize-panes: Toggle synchronize-panes(send command to all panes)
- Ctrl + space Spacebar: Toggle between pane layouts
- Ctrl + space o: Switch to next pane
- Ctrl + space q: Show pane numbers
- Ctrl + space q 0 ... 9: Switch/select pane by number
- Ctrl + space z: Toggle pane zoom
- Ctrl + space !: Convert pane into a window
- Ctrl + space + / Ctrl + b Ctrl + -: Resize current pane height (holding second key is optional)
- Ctrl + space + / Ctrl + b Ctrl + -: Resize current pane width (holding second key is optional)
- Ctrl + space x: Close current pane

Copy Mode:
- setw -g mode-keys vi: Use vi keys in buffer
- Ctrl + space [: Enter copy mode
- Ctrl + space PgUp: Enter copy mode and scroll one page up
- q: Quit mode
- g: Go to top line
- G: Go to bottom line
- Scroll up / Scroll down
- h: Move cursor left
- j: Move cursor down
- k: Move cursor up
- l: Move cursor right
- w: Move cursor forward one word at a time
- b: Move cursor backward one word at a time
- /: Search forward
- ?: Search backward
- n: Next keyword occurrence
- N: Previous keyword occurrence
- Spacebar: Start selection
- Esc: Clear selection
- Enter: Copy selection
- Ctrl + b ]: Paste contents of buffer_0
- show-buffer: Display buffer_0 contents
- capture-pane: Copy entire visible contents of pane to a buffer
- list-buffers: Show all buffers
- choose-buffer: Show all buffers and paste selected
- save-buffer buf.txt: Save buffer contents to buf.txt
- delete-buffer -b 1: Delete buffer_1

Misc:
- Ctrl + space :: Enter command mode
- set -g OPTION: Set OPTION for all sessions
- setw -g OPTION: Set OPTION for all windows
- set mouse on: Enable mouse mode

Help:
- tmux list-keys / list-keys / Ctrl + b ?: List key bindings (shortcuts)
"""

if __name__ == "__main__":
    print(__doc__)
