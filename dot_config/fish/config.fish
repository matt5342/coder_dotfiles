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
