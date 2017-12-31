dotfiles for linux for nixos linux
---
```bash
- git clone git@github.com:basilgood/.dot.git ~/.dot
```
- chmod +x .dot/install.sh

- .dot/install.sh

The script cleans up any old symlinks that may exist in our home directory and puts them into a folder called dotfiles_old. It then iterates through any files in our ~/.dot directory and it creates symlinks from our home directory to these files. It handles naming these symlinks and prepending a dot to their filename.

if not nixos:
```bash
- unlink .nixpkgs
```
if it is nixos:
```bash
- chmod +x .nixpkgs/install.sh
- .nixpkgs/install.sh
```



