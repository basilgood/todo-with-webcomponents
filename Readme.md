# Nixos configuration and dotfiles

```shell
$ git clone git@github.com:basilgood/nix-home.git Projects/nixos
```

```rft
In /etc/nixos/configuration.nix file:
  imports = [ ./nixos/profiles/profile.nix ];
In /etc/nixos folder:
  ln -sf ~/home/user/Projects/nixos nixos
In /home/user/.config folder:
  ln -sf /home/user/Projects/nixos/nix-home nixpkgs
```

For dotfiles without sudo:

```shell
$ nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
$ nix-channel --update
$ nix-shell '<home-manager>' -A install
$ home-manager switch
```

For nixos:

```shell
$ sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
$ sudo nix-channel --update
$ sudo nixos-rebuild switch
```
