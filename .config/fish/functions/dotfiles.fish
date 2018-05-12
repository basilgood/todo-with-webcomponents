function dotfiles
    git -c core.excludesFile=~/.dotignore --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end

