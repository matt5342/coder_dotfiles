# Ensure tools installed by asdf and ~/.local/bin are available in PATH.
# This is necessary because Coder bootstraps tools via Bash, but Fish does
# not inherit PATH entries from ~/.bashrc. fish_add_path persists as a
# universal variable so it survives even if this file errors out later.
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.asdf/shims

# Set Coder workspace autostop schedule once per boot.
# /tmp is cleared on workspace stop/restart, so this fires on first shell open
# after every workspace start — both initial creation and subsequent restarts.
if set -q CODER_WORKSPACE_NAME
    set -l lock /tmp/.coder-autostop-set
    if not test -f $lock
        coder schedule stop $CODER_WORKSPACE_OWNER_NAME/$CODER_WORKSPACE_NAME 8h &
        touch $lock
    end
end
