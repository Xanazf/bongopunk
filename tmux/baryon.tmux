# Bongopunk Baryon (Light Mode) for Tmux
# Based on Fluoromachine by maxmx03

# Color definitions
bg="#FAFAFA"
fg="#2D2D2D"
bg_alt="#F5F5F5"
fg_alt="#6B7280"
cyan="#0891B2"
green="#059669"
orange="#EA580C"
pink="#BE185D"
purple="#7C3AED"
red="#DC2626"
yellow="#D97706"
cyan_bright="#06B6D4"
green_bright="#10B981"
orange_bright="#F59E0B"
pink_bright="#EC4899"
purple_bright="#8B5CF6"
red_bright="#EF4444"
yellow_bright="#F59E0B"
comment="#9CA3AF"
border="#D1D5DB"

# Basic status bar
set -g status-style "bg=$bg_alt,fg=$fg"
set -g status-left-length 40
set -g status-right-length 80
set -g status-interval 1

# Window status
set -g window-status-style "bg=$bg_alt,fg=$comment"
set -g window-status-current-style "bg=$purple,fg=$bg,bold"
set -g window-status-activity-style "bg=$orange,fg=$bg"
set -g window-status-bell-style "bg=$red,fg=$bg"

# Window status format
set -g window-status-format " #I:#W "
set -g window-status-current-format " #I:#W "

# Pane borders
set -g pane-border-style "fg=$border"
set -g pane-active-border-style "fg=$purple"

# Message style
set -g message-style "bg=$cyan,fg=$bg"
set -g message-command-style "bg=$purple,fg=$bg"

# Mode style (copy mode, etc.)
set -g mode-style "bg=$cyan,fg=$bg"

# Status left (session info)
set -g status-left "#[bg=$green,fg=$bg,bold] #S #[bg=$bg_alt,fg=$green]"

# Status right (system info)
set -g status-right "#[fg=$comment]#[bg=$bg_alt] %Y-%m-%d #[fg=$purple]#[bg=$bg_alt] %H:%M:%S #[bg=$cyan,fg=$bg,bold] #h "

# Clock mode
set -g clock-mode-colour "$cyan"
set -g clock-mode-style 24

# Copy mode highlighting
set -g copy-mode-match-style "bg=$yellow,fg=$bg"
set -g copy-mode-current-match-style "bg=$orange,fg=$bg"

# Activity monitoring
set -g monitor-activity on
set -g visual-activity off

# Pane display
set -g display-panes-active-colour "$purple"
set -g display-panes-colour "$comment"
set -g display-panes-time 1000

# Prefix highlight (if using tmux-prefix-highlight plugin)
set -g @prefix_highlight_fg "$bg"
set -g @prefix_highlight_bg "$pink"
set -g @prefix_highlight_copy_mode_attr "fg=$bg,bg=$orange"

# Additional styling
set -g status-justify left
set -g status-position bottom

# Window numbering
set -g base-index 1
set -g pane-base-index 1
set -g renumber-windows on

# Mouse support
set -g mouse on

# Vi mode
set -g mode-keys vi

# Key bindings for copy mode
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
bind-key -T copy-mode-vi r send-keys -X rectangle-toggle

# Pane navigation
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Pane resizing
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# Window navigation
bind -r C-h select-window -t :-
bind -r C-l select-window -t :+

# Split panes
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# New window
bind c new-window -c "#{pane_current_path}"

# Reload config
bind r source-file ~/.tmux.conf \; display-message "Config reloaded!"