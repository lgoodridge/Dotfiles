#!/bin/sh
# tigeruhr.sh
# Starts tmux for tigeruhr development on monitor

# Set screen to max dimensions of monitor
printf '\033[8;69;317t';

# Setup tmux session
tmux new -s tigeruhr -n dev \; \
    split-window -h -p 25 \; \
    send-keys 'cd ~/repos/tiger-uhr' C-m \; \
    split-window -v -p 70 \; \
    send-keys 'cd ~/repos/tiger-uhr' C-m \; \
    split-window -v -p 55 \; \
    send-keys 'cd ~/repos/tiger-uhr' C-m \; \
    send-keys 'docker compose up' C-m \; \
    select-pane -t 1 \; \
    send-keys 'cd ~/repos/tiger-uhr/' C-m \; \
    send-keys 'vim -c "NERDTree | wincmd l | vs | wincmd h"' C-m \; \
\
