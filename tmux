set -g mouse on

# use vim-like keys for splits and windows
bind-key v split-window -h
bind-key s split-window -v
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

#set-option -g default-command zsh

set -g default-terminal "screen-256color"

set -g status-style bg='#44475a',fg='#bd93f9'
set -g pane-border-style fg='#6272a4'
set -g pane-active-border-style fg='#ff79c6'

set -g base-index 1
setw -g pane-base-index 1
