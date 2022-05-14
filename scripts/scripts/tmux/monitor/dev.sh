#!/bin/sh
# labqueue.sh
# Starts tmux for labqueue development on monitor

# Set screen to max dimensions of monitor
printf '\033[8;69;317t';

# Setup tmux session
tmux new -s dev -n dev \; \
    split-window -h -p 25 \; \
    send-keys 'cd ~/repos/' C-m \; \
    split-window -v -p 70 \; \
    send-keys 'cd ~/repos/' C-m \; \
    split-window -v -p 55 \; \
    send-keys 'cd ~/repos/' C-m \; \
    select-pane -t 1 \; \
    send-keys 'cd ~/repos/' C-m \; \
\
