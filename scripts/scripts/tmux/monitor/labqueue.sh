#!/bin/sh
# labqueue.sh
# Starts tmux for labqueue development on monitor

# Set screen to max dimensions of monitor
printf '\033[8;60;271t';

# Setup tmux session
tmux new -s labqueue -n dev \; \
    split-window -h -p 25 \; \
    send-keys 'cd ~/repos/lab-queue/lab_ta_queue' C-m \; \
    send-keys 'source ../scripts/setenv.sh' C-m \; \
    send-keys 'python manage.py runserver 8080' C-m \; \
    split-window -v -p 70 \; \
    send-keys 'cd ~/repos/lab-queue' C-m \; \
    send-keys 'source scripts/setenv.sh' C-m \; \
    split-window -v -p 55 \; \
    send-keys 'cd ~/repos/lab-queue' C-m \; \
    send-keys 'source scripts/setenv.sh' C-m \; \
    select-pane -t 1 \; \
    send-keys 'cd ~/repos/lab-queue/lab_ta_queue/ltq' C-m \; \
    send-keys 'vim -c "NERDTree | wincmd l | vs | wincmd h"' C-m \; \
\
