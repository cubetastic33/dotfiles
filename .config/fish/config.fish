# Run ONCE after installing fish

# Disable fish greeting
# set -U fish_greeting

# Add custom scripts directory and rust stuff to path
# set -U fish_user_paths ~/scripts ~/.cargo/bin $fish_user_paths

# vi mode
# fish_vi_key_bindings

# End of one-time run commands

# Aliases
alias lumos='exa -hlG --icons --git'
alias reducto='rm'
alias aparecium='bat'
alias accio='paru --removemake --skipreview'
alias vifm='~/.config/vifm/scripts/vifmrun'
alias purge_amnesia='matrix_purge --room-id "!MJobFmDgCqVfEnUyzq:matrix.org"'
alias purge_obliviate='matrix_purge --room-id "!pzEhwcNUXUubHVqiOR:matrix.org"'

# Set the cursor shapes for the different vi modes
set fish_cursor_default block
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore

# Spaceship prompt
starship init fish | source

# SSH agent
if test -z (pgrep ssh-agent | string collect)
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end

if test -n "$DESKTOP_SESSION"
    set -x (gnome-keyring-daemon --start | string split "=")
end
