# Run ONCE after installing fish

# Disable fish greeting
# set -U fish_greeting

# Add custom scripts directory and rust stuff to path
# set -U fish_user_paths ~/scripts ~/.cargo/bin $fish_user_paths

# vi mode
# fish_vi_keybindings

# End of one-time run commands

# Aliases
alias lumos='exa -hlG --icons --git'
alias reducto='rm'
alias aparecium='bat'
alias accio='paru --removemake'
alias vifm='~/.config/vifm/scripts/vifmrun'

# Set the cursor shapes for the different vi modes
set fish_cursor_default block
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore

# Spaceship prompt
starship init fish | source
