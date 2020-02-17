{ pkgs }: {
  enable = true;
  baseIndex = 1;
  terminal = "tmux-256color";
  keyMode = "vi";
  extraConfig = ''
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

    # theme
    set -g status-style bg=colour237,fg=white
    set -g pane-active-border-style fg=colour241
    set -g pane-border-style fg=colour237
    set -g message-style bg=colour239,fg=colour223
    set -g message-command-style bg=colour239,fg=colour223
    set -g display-panes-active-colour colour250
    set -g display-panes-colour colour237
    set -g mode-style fg=brightwhite,bg=cyan

    # Prefix Highlight
    set -g @prefix_highlight_fg 'brightwhite'
    set -g @prefix_highlight_bg 'blue'
    set -g @prefix_highlight_show_copy_mode on
    set -g @prefix_highlight_copy_mode_attr fg=brightwhite,bg=cyan
    set -g @prefix_highlight_prefix_prompt 'Prefix'
    set -g @prefix_highlight_copy_prompt 'Copy'

    # Statusbar formatting
    set -g status-interval 3
    set -g status-left ""
    set -g status-right-length 40
    set -g status-right "#{prefix_highlight} #S@#h "
    setw -g window-status-format "#[bg=colour237,fg=white] #I: #W "
    setw -g window-status-current-format "#[bg=colour239,fg=white] #I: #W "

    run-shell ${pkgs.tmuxPlugins.pain-control.rtp}
    run-shell ${pkgs.tmuxPlugins.sensible.rtp}
    run-shell ${pkgs.tmuxPlugins.resurrect.rtp}
    run-shell ${pkgs.tmuxPlugins.prefix-highlight.rtp}
  '';
}
