{ config, lib, pkgs, options, ... }:
with lib;

{

  boot.kernelPackages = pkgs.linuxPackages_latest;

  nix.buildCores = 0;

  console = {
    font = "ter-118n";
    keyMap = "us";
    packages = [ pkgs.terminus_font ];
  };

  i18n.defaultLocale = "en_US.UTF-8";

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
    EDITOR = "neovim";
    VISUAL = "neovim";
    PAGER = mkForce "${pkgs.bat}/bin/bat";
    BAT_PAGER = "${pkgs.less}/bin/less -RF";
    BAT_THEME = "TwoDark";
    BAT_STYLE = "numbers,changes,header";
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
  };

  programs.git = {
    enable = true;
    lfsEnable = true;
    user = ''
      name = vasile luta
      email = elsile69@yahoo.com
    '';
    core = ''
      editor = ${pkgs.vim}/bin/vim
      excludesfile = ~/.gitignore
    '';
    status = ''
      showuntrackedfiles = all
    '';
    rerere = ''
      enabled = 1
      autoupdate = 1
    '';
    color = ''
      ui = auto
    '';
    colorBranch = ''
      current = yellow reverse
      local = yellow
      remote = green
    '';
    colorDiff = ''
      meta = blue
      frag = black
      old = red
      new = green
    '';
    colorStatus = ''
      added = green
      changed = yellow
      untracked = cyan
    '';
    diff = ''
      tool = vimdiff
    '';
    diffTool = ''
      prompt = false
      trustExitCode = true
    '';
    merge = ''
      conflictStyle = diff3
    '';
    mergeTool = ''
      tool = vimdiff
      prompt = false
      keepBackup = false
    '';
    alias = ''
      lg = log --oneline --graph --all
    '';
    extraPackages = with pkgs; [ gitAndTools.tig gitAndTools.git-imerge ];
  };

  virtualisation = {
    lxc = {
      enable = true;
      lxcfs.enable = true;
      net.enable = true;
    };
    lxd.enable = true;
    # virtualbox.host.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs;
    [ acl wget neovim ];

  nixpkgs.overlays = [
    (import ./overlays/packages)
    (import ./overlays/tig)
    (import ./overlays/tmux)
    (import ./overlays/vim)
    (import ./overlays/neovim)
    (import ./overlays/lazygit)
    (import ./overlays/lsp)
    (import ./overlays/chromium)
    (import ./overlays/kakoune)
    (import ./overlays/alacritty)
    (import ./overlays/fonts)
    (import ./overlays/lxd)
    (import ./overlays/nixfmt)
    (import ./overlays/dmenu-wayland)
  ];

}
