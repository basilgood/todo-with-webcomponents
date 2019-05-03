{ pkgs, lib, config, options, ... }:

{
  nixpkgs.overlays = [
    (import ./overlays/vagrant)
    (import ./overlays/skype)
    (import ./overlays/chromium)
    (import ./overlays/st)
    (import ./overlays/dmenu)
    (import ./overlays/tig)
    (import ./overlays/lazygit)
  ];

  home = {
    file = {
      ".gitconfig".text = pkgs.lib.readFile ../dotfiles/gitconfig;
      ".bashrc".text = pkgs.lib.readFile ../dotfiles/bashrc;
      ".Xresources".text = pkgs.lib.readFile ../dotfiles/Xresources;
      ".dircolors".text = pkgs.lib.readFile ../dotfiles/dircolors;
      ".config/dunst/dunstrc".text = pkgs.lib.readFile ../dotfiles/dunst/dunstrc;
      ".config/i3/config".text = pkgs.lib.readFile ../dotfiles/i3/config;
      ".config/i3/compton.conf".text = pkgs.lib.readFile ../dotfiles/i3/compton.conf;
      ".config/i3/blocks.conf".text = pkgs.lib.readFile ../dotfiles/i3/blocks.conf;
      # ".config/vifm/vifmrc".text = pkgs.lib.readFile ../dotfiles/vifm/vifmrc;
      # ".config/vifm/colors/iceberg.vifm".text = pkgs.lib.readFile ../dotfiles/vifm/colors/iceberg.vifm;
    };
  };

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    ag
    fd
    universal-ctags
    fzf
    fzy
    usbutils
    bat
    aspell
    lf
    mc
    vifm
    nnn
    qbittorrent
    htop
    unzip
    zip
    unzip
    gimp-with-plugins

    ncmpcpp
    rofi

    chromium
    firefox
    chromedriver

    skypeforlinux
    libnotify
    zathura

    editorconfig-core-c
    vimHugeX
    (vim-vint.overridePythonAttrs(old: {
      checkPhase = false;
    }))

    keepassxc

    compton
    lm_sensors
    dmenu
    gnome3.dconf
    i3blocks
    i3lock-fancy
    pavucontrol
    mpg123
    dunst
    feh
    scrot
    st
    lxterminal

    git
    lazygit
    gitAndTools.tig
    gitAndTools.diff-so-fancy
    git-lfs
    gitkraken
    meld

    nodejs-10_x
    ruby

    vagrant_2
    redir
    bridge-utils
    ansible_2_6
    avocode
    distrobuilder

  ];

  gtk = {
    enable = true;
    theme = {
      package = pkgs.arc-theme;
      name = "Arc";
    };
    iconTheme = {
      package = pkgs.arc-icon-theme;
      name = "Arc";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  programs.tmux = with pkgs; {
    enable = true;
    package = tmux;
    terminal = "tmux-256color";
    plugins = [
      tmuxPlugins.resurrect
      tmuxPlugins.sensible
      tmuxPlugins.prefix-highlight
      tmuxPlugins.pain-control
    ];
    extraConfig = ''
      set -g base-index 1
      setw -g pane-base-index 1

      # Automatically set window title
      set-window-option -g automatic-rename on
      set-option -g set-titles on

      set-option -g renumber-windows on
      set-window-option -g xterm-keys on
      set -g default-terminal "xterm-256color"
      # set -ga terminal-overrides ",xterm-termite:Tc"
      set-option -ga terminal-overrides ",xterm-256color:Tc"


      set -g history-limit 10000
      set -sg escape-time 0
      set -g focus-events on

      setw -g mode-keys vi
      setw -g mouse on
      setw -g monitor-activity on

      unbind C-b
      set -g prefix C-Space
      bind C-Space send-prefix

      bind -n M-c new-window
      bind -n M-, previous-window
      bind -n M-. next-window
      bind -n M-z resize-pane -Z
      bind -n M-v split-window -h
      bind -n M-s split-window -v

      bind -n M-h resize-pane -L 5
      bind -n M-j resize-pane -D 5
      bind -n M-k resize-pane -U 5
      bind -n M-l resize-pane -R 5

      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

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

      # Clock mode
      set-window-option -g clock-mode-colour colour76
      set-window-option -g clock-mode-style 24

      # Plugins
      set-option -g @prefix_highlight_fg 'colour235'
      set-option -g @prefix_highlight_bg 'colour35'
      set-option -g @prefix_highlight_copy_mode_attr 'fg=colour235,bg=colour176'
      set -g status-left-length 30
      set -g status-right '#{prefix_highlight}'
      setw -g window-status-current-format '#{?window_zoomed_flag,#[fg=yellow],}#F#I #W '
    '';
  };

  services.mpd = {
    enable = true;
  };

  programs.home-manager = {
    enable = true;
    path = https://github.com/rycee/home-manager/archive/master.tar.gz;
  };
}
