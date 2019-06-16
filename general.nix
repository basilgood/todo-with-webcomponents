{ config, lib, pkgs,options, ... }:

{

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
  };

  nix.buildCores = 4;

  i18n = {
    consoleFont = "ter-118n";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
    consolePackages = [ pkgs.terminus_font ];
  };

  powerManagement = {
    enable = true;
  };

  hardware = {
    pulseaudio.enable = true;
    cpu.amd.updateMicrocode = true;
    opengl = {
      enable = true;
      extraPackages = with pkgs; [ libvdpau-va-gl vaapiVdpau ];
    };
  };

  networking.networkmanager = {
    enable = true;
    dns = "dnsmasq";
    dynamicHosts =  {
      enable = true;
    };
  };

  environment.etc = {
    "NetworkManager/dnsmasq.d/10-dns-lxcd.conf".text = ''
      server=/local/10.0.3.1
      server=/lxd/10.0.4.1
    '';
  };

  environment.sessionVariables =
  {
    # Allow GTK 2.0/3.0 themes to be found.
    GTK_DATA_PREFIX = "/run/current-system/sw";
    # Allow KDE apps to work better in i3.
    DESKTOP_SESSION = "kde";
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      nerdfonts
    ];
  };

  services.upower.enable = true;
  services.udev.packages = with pkgs; [
    brightnessctl
    android-udev-rules
  ];

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
  };

  programs         = {
    ssh.startAgent = true;
    java.enable    = true;
    # zsh = {
    #   enable = true;
    #   autosuggestions = {
    #     enable = true;
    #     highlightStyle = "fg=241";
    #   };
    #   enableCompletion = true;
    #   syntaxHighlighting.enable = true;
    #   ohMyZsh.theme = "spaceship";
    #   interactiveShellInit = ''
    #     export SPACESHIP_VI_MODE_COLOR=black
    #   '';
    # };
    tmux           = import ./tmux/tmux.nix {inherit pkgs;};
  };

  virtualisation = {
    lxc.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (import ./overlays/zsh)
    (import ./overlays/waybar)
    (import ./overlays/tig)
    (import ./overlays/tmux)
    (import ./overlays/alacritty)
    (import ./overlays/st)
    (import ./overlays/neovim)
  ];

}
