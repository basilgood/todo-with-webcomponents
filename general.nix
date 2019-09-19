{ config, lib, pkgs, options, ... }:

{

  boot = { kernelPackages = pkgs.linuxPackages_latest; };

  nix.buildCores = 0;

  i18n = {
    consoleFont = "ter-118n";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
    consolePackages = [ pkgs.terminus_font ];
  };

  powerManagement = { enable = true; };

  hardware = {
    pulseaudio.enable = true;
    cpu.amd.updateMicrocode = true;
    opengl = {
      enable = true;
      extraPackages = with pkgs; [ libvdpau-va-gl vaapiVdpau ];
    };
  };

  networking = {
    hostName = "merlin";
    networkmanager = {
      enable = true;
      dns = "dnsmasq";
      dynamicHosts = { enable = true; };
    };
  };

  time.timeZone = "Europe/Bucharest";

  environment.etc = {
    "NetworkManager/dnsmasq.d/10-dns-lxcd.conf".text = ''
      server=/local/10.0.3.1
      server=/lxd/10.0.4.1
    '';
  };

  environment.sessionVariables = {
    # Allow GTK 2.0/3.0 themes to be found.
    GTK_DATA_PREFIX = "/run/current-system/sw";
    # Allow KDE apps to work better in i3.
    DESKTOP_SESSION = "kde";
  };

  environment.variables = let vim = "${pkgs.vim}/bin/vim";
  in {
    EDITOR = vim;
    VISUAL = vim;
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [ corefonts nerdfonts ];
  };

  services.upower.enable = true;
  services.udev.packages = with pkgs; [ brightnessctl android-udev-rules ];

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
  };

  programs = {
    ssh.startAgent = true;
    java.enable = true;
    tmux = import ./tmux/tmux.nix { inherit pkgs; };
    git.enable = true;
    git.lfsEnable = true;
    git.name = "vasile luta";
    git.email = "elsile69@yahoo.com";
    git.editor = "${pkgs.vim}/bin/vim";
    git.pager =
      "${pkgs.gitAndTools.diff-so-fancy}/bin/diff-so-fancy | ${pkgs.less}/bin/less --tabs=1,5 -XFR";
    git.extraConfig = "";
    git.difftool = "vim";
    git.mergetool = "meld";
    git.interface = pkgs.gitAndTools.tig;
  };

  virtualisation = { lxc.enable = true; };

  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.packageOverrides = pkgs: {
  #   nur = import (builtins.fetchTarball
  #     "https://github.com/nix-community/NUR/archive/master.tar.gz") {
  #       inherit pkgs;
  #     };
  # };

  environment.systemPackages = with pkgs; [ acl wget ];

  nixpkgs.overlays = [
    (import ./overlays/packages)
    (import ./overlays/tig)
    (import ./overlays/tmux)
    (import ./overlays/emacs)
    (import ./overlays/vim)
    # (import ./overlays/lsp)
    (import ./overlays/chromium)
    (import ./overlays/st)
    (import ./overlays/nixfmt)
    # (import ./overlays/popcorn)
    # (import ./overlays/nodeEnv)
  ];

}
