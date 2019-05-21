{pkgs}:
{
    enable = true;
    baseIndex = 1;
    terminal = "tmux-256color";
    keyMode = "vi";
    extraTmuxConf = ''
      # Automatically set window title
      set-window-option -g automatic-rename on
      set-option -g set-titles on
      set-option -g renumber-windows on
      set-window-option -g xterm-keys on
      set -ga terminal-overrides ",xterm-256color:Tc"
      set -g focus-events on
      setw -g mouse on
      setw -g monitor-activity on

      unbind C-b
      set -g prefix C-Space
      bind C-Space send-prefix
      bind -n M-v split-window -h
      bind -n M-s split-window -v
      bind -n M-j resize-pane -D 5
      bind -n M-k resize-pane -U 5
      bind -n M-h resize-pane -L 5
      bind -n M-l resize-pane -R 5
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D
      bind -n M-,  previous-window
      bind -n M-. next-window

      # Default colors
      set-option -g status-style fg=colour145,bg=colour235

      # Window titles
      set-window-option -g window-status-style fg=default,bg=default
      set-window-option -g window-status-current-style fg=white,bold,bg=default
      set-window-option -g window-status-activity-style fg=default,noreverse,bg=default

      # Pane borders
      set-option -g pane-border-style fg=colour240,bg=default
      set-option -g pane-active-border-style fg=colour76,bg=default

      # Message text
      set-option -g message-style fg=colour76,bg=default
      set-option -g message-command-style fg=colour75,bg=default

      # Copy mode
      set-window-option -g mode-style fg=default,bg=colour240
      set -g status-left-length 30
      set -g  status-left '#S:  '
      set -g window-status-separator '  '
      set -g status-right '#{?client_prefix, prefix ,}'
      run-shell ${pkgs.tmuxPlugins.pain-control.rtp}
      run-shell ${pkgs.tmuxPlugins.sensible.rtp}
      run-shell ${pkgs.tmuxPlugins.resurrect.rtp}
    '';
}
