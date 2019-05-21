# Sensible Bash modified
# GENERAL OPTIONS ##
# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=3

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# ## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# only start cycling full results on the second Tab press
bind "set menu-complete-display-prefix on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

# Colored completion based on filetype
bind "set colored-stats on"

# When completing in middle of word, don't dupe matching text after word
bind "set skip-completed-text on"

# Append symbol for file, in tab completion
bind "set visible-stats on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

# Show all autocomplete results at once
bind "set page-completions off"

# When completing in middle of word, don't dupe matching text after word
bind "set skip-completed-text on"

# disable any kind of bell (annoying on failed completion)
bind "set bell-style none"

# Steps through list
bind '"\t": menu-complete'
bind '"\e[Z": menu-complete-backward'

# Enable 8 bit input (doesn't clear 8th bit in chars it reads)
set meta-flag on
# Same flag...
set input-meta on
# Display chars' 8th bit set directly, instead of esc sequence
set output-meta on
# Prevent 8th bit strip
set convert-meta off

# SANE HISTORY DEFAULTS

# Append to the history file, don't overwrite it
shopt -s histappend
## reedit a history substitution line if it failed
shopt -s histreedit
## edit a recalled history line before executing
shopt -s histverify
# Save multi-line commands as one command
shopt -s cmdhist
# save multi-line commands to the history with embedded newlines
shopt -s lithist

# Record each line as it gets issued
alias hfix='history -n && history | sort -k2 -k1nr | uniq -f1 | sort -n | cut -c8- > ~/.tmp$$ && history -c && history -r ~/.tmp$$ && history -w && rm ~/.tmp$$'

# Set no limit for history file size
HISTFILESIZE=-1
HISTSIZE=-1

# Avoid duplicate entries
HISTCONTROL=ignoredups:erasedups

# keybind
bind '"\e[P": delete-char'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'
bind '"\C-h": backward-kill-word'
bind '"\e[1;5C": forward-word'
bind '"\e[1;5D": backward-word'
bind '"\e[M": kill-word'

# BETTER DIRECTORY NAVIGATION

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
CDPATH="."

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars

# Examples:
export projects="$HOME/Projects"

# editor
VISUAL=vim
EDITOR="$VISUAL"
PAGER=less
LESS='-XFr'

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# always use color output for `ls`
eval "$(dircolors ~/.dircolors)"
alias ls='ls --color'
alias less='less --RAW-CONTROL-CHARS'

# grep with colors
alias grep='grep --color=auto'

# show $PATH in a readable way
alias path='echo -e ${PATH//:/\\n}'
PATH=~/.local/bin:$PATH

# tmux
alias qa='tmux kill-session -t'

# extract most know archives.
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1;;
      *.tar.gz)    tar xzf $1;;
      *.tar.xz)    tar Jxvf $1 ;;
      *.bz2)       bunzip2 $1;;
      *.rar)       unrar e $1;;
      *.gz)        gunzip $1;;
      *.tar)       tar xf $1;;
      *.tbz2)      tar xjf $1;;
      *.tgz)       tar xzf $1;;
      *.zip)       unzip $1;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1;;
      *)     echo "'$1' cannot be extracted.";;
    esac
  else
    echo "'$1' is not a valid file."
  fi
}

# prompt

# new line
NL='
'
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWDIRTYSTATE=1
VIRTUAL_ENV_DISABLE_PROMPT=1

bold=$(tput bold)
red=$(tput setaf 1)
yellow=$(tput setaf 3)
cyan=$(tput setaf 6)
magenta=$(tput setaf 5)
reset=$(tput sgr0)

set_active_venv() {
  export ACTIVE_VENV=""
  if [ "$VIRTUAL_ENV" != "" ]; then
    export ACTIVE_VENV="(`basename \"$VIRTUAL_ENV\"`)"
  fi
}

active_nix_shell() {
  if [ -n "$IN_NIX_SHELL" ]; then
    # export NSHELL=""
    export NSHELL="nix "
  fi
}

PROMPT_COMMAND='\
  set_active_venv; active_nix_shell; __git_ps1 \
  "${NL}\[$yellow\]${ACTIVE_VENV}${NSHELL}\[$reset\]\[$red\]\${?#0}\[$reset\]\[$bold\]\[$cyan\]\w\[$reset\]" \
  "\[$magenta\]${NL}❯\[$reset\] "'

PROMPT_COMMAND="hfix; $PROMPT_COMMAND"

stty -ixon
