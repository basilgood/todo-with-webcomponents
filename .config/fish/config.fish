if not test -e ~/.config/fish/functions/fisher.fish
  echo "Installing fisher"
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
  echo "Installing fisher plugins"
  fisher
end

function _dircolors_set_256_color
  if command -s dircolors > /dev/null; and test -e ~/.dircolors.256
    eval (dircolors -c ~/.dircolors.256 | sed 's/>&\/dev\/null$//')
  end
end

_dircolors_set_256_color

set NPM_PACKAGES "$HOME/.npm-packages"
if test -x "$NPM_PACKAGES/bin"
    set PATH "$NPM_PACKAGES/bin" $PATH
end

set RUBY_PATH "$HOME/.gem/ruby/2.3.0/bin"

if test -x "$RUBY_PATH"
  set -gx PATH "$RUBY_PATH" $PATH
end

set MY_LOCAL_BIN "$HOME/.local/bin"
if test -x "$MY_LOCAL_BIN"
    set PATH "$MY_LOCAL_BIN" $PATH
end

set -g EDITOR nvim

alias gP='git push'
alias ga='git add .'
alias gb='git branch'
alias gck='git checkout'
alias gc='git commit'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit '
alias glp='git log -p'
alias gp='git pull; and echo'
alias gps='git push; and echo; and git status; and echo'
alias gs='git status'

alias nv='nvim'
alias v='vim'

alias vu='vagrant up'
alias vp='vagrant provision'
alias vrp='vagrant reload --provision'
alias vd='vagrant destroy'
alias vs='vagrant ssh'
alias vh='vagrant halt'

alias ds='dotfiles status'
alias da='dotfiles add'
alias dc='dotfiles commit'
alias df='dotfiles diff'
alias dp='dotfiles pull'
alias dP='dotfiles push'

