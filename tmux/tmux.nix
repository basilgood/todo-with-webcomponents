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

    # Statusbar formatting
    set -g status-bg black
    set -g status-fg white
    set -g status-left ""
    setw -g window-status-current-style fg=black,bg=white
    set -g status-right "#{prefix_highlight} #S@#h"

    run-shell ${pkgs.tmuxPlugins.pain-control.rtp}
    run-shell ${pkgs.tmuxPlugins.sensible.rtp}
    run-shell ${pkgs.tmuxPlugins.resurrect.rtp}
    run-shell ${pkgs.tmuxPlugins.prefix-highlight.rtp}
  '';
}
