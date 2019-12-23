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
    };
  };

  time.timeZone = "Europe/Bucharest";

  environment.etc = {
    "NetworkManager/dnsmasq.d/10-dns-lxcd.conf".text = ''
      server=/local/10.0.3.1
      server=/lxd/10.0.4.1
    '';
  };

  environment.variables = {
    EDITOR = "vim";
    VISUAL = "vim";
    PATH = "$PATH:~/.local/bin";
  };

  fonts = {
    fontconfig = {
      penultimate.enable = true;
      defaultFonts = {
        monospace = [ "DejaVuSansMono Nerd Font" ];
        sansSerif = [ "DejaVu Sans" ];
      };
    };
    fonts = with pkgs; [ nerdfont_dejavu ];
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

  virtualisation = {
    lxc.enable = true;
    docker.enable = true;
  };

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
    # (import ./overlays/emacs)
    (import ./overlays/vim)
    # (import ./overlays/neovim)
    (import ./overlays/lazygit)
    (import ./overlays/lsp)
    (import ./overlays/chromium)
    (import ./overlays/kakoune)
    # (import ./overlays/st)
    (import ./overlays/alacritty)
    (import ./overlays/fonts)
    # (import ./overlays/ueberzug)
    # (import ./overlays/nixfmt)
    # (import ./overlays/popcorn)
    # (import ./overlays/nodeEnv)
  ];

}
