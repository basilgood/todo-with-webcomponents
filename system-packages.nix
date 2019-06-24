pkgs:
with pkgs; [
  # common
  acl
  tree
  wget
  htop
  xclip
  p7zip
  unzip
  lm_sensors
  keepassxc
  pavucontrol
  fzy
  fzf
  bat
  fd
  ag
  fasd
  file
  mupdf
  pciutils
  mimeo
  nixfmt
  popcornTime

  # wayland specific
  xwayland

  # browsers
  chromium
  firefox-wayland

  # launcher
  j4-dmenu-desktop

  # terminals
  lxterminal
  st

  # editor
  vimHugeX
  neovim
  editorconfig-core-c
  gimp-with-plugins

  # linters
  vim-vint
  python37Packages.yamllint

  # git
  git
  gitAndTools.tig
  gitAndTools.diff-so-fancy
  lazygit
  smartgithg

  spotify
  mpv
  moc
  feh

]
