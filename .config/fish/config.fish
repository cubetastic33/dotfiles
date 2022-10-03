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
alias dissect='rpm -ql'
alias vifm='~/.config/vifm/scripts/vifmrun'
alias python='python3'

# Set the cursor shapes for the different vi modes
set fish_cursor_default block
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore

if status is-interactive
    # Commands to run in interactive sessions can go here
    # Starship prompt
    starship init fish | source
end

# SSH agent
if test -z (pgrep ssh-agent | string collect)
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end
