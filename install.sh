#!/bin/sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dot
############################

########## Variables

dir=~/.dot                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="nixpkgs bashrc gemrc npmrc tmux.conf vim zshrc alias"        # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv ~/.$file ~/dotfiles_old/
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

# It adds all symlinks to a .gitignore file that aren't in there already.
for f in $(git status --porcelain | grep '^??' | sed 's/^?? //'); do
    if test -L "$f"
    then
        test -L "$f" && echo $f >> .gitignore;
    elif test -d "$f"
    then
        find ${f%/} -type l -not -exec grep -q "^{}$" .gitignore \; -print >> .gitignore
    fi
done
