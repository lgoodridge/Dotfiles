#!/bin/sh
# asteroids.sh
# Starts tmux for asteroids development on laptop screen

# Set screen to max dimensions of laptop screen
printf '\033[8;62;238t';

# Setup tmux session
tmux new -s asteroids -n dev \; \
    split-window -h -p 28 \; \
    resize-pane -L 2 \; \
    send-keys 'cd ~/repos/asteroids' C-m \; \
    split-window -v -p 50 \; \
    send-keys 'cd ~/repos/asteroids' C-m \; \
    send-keys 'vim todo.txt' C-m \; \
    select-pane -t 1 \; \
    send-keys 'cd ~/repos/asteroids' C-m \; \
    send-keys 'vim -c "vs | wincmd h"' C-m \; \
\
    new-window -n 'experiments' \; \
    split-window -h -p 28 \; \
    resize-pane -L 2 \; \
    send-keys 'cd ~/repos/asteroids' C-m \; \
    split-window -v -p 50 \; \
    send-keys 'cd ~/repos/asteroids' C-m \; \
    select-pane -t 1 \; \
    send-keys 'cd ~/repos/asteroids' C-m \; \
    send-keys 'vim -c "e research.txt"' C-m \; \
\
    select-window -t 1
