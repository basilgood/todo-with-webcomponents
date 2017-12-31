BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
# Load Antigen
source ~/.antigen/antigen.zsh
#
# Antigen Theme
#
antigen bundle mafredri/zsh-async
antigen theme geometry-zsh/geometry
#
# Antigen Bundles
#
antigen bundle robbyrussell/oh-my-zsh lib/

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen bundle git
antigen bundle tmuxinator
antigen bundle rupa/z

antigen bundle pip
antigen bundle python
antigen bundle virtualenv

antigen bundle ssh-agent

antigen apply

source ~/.alias

