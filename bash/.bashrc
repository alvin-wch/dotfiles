#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias la='ls -la --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias gitroot='cd "$(git rev-parse --show-toplevel)"'

PS1='[\u@\h \W]\$ '

# Automatically search the official repositories when entering unrecognized command (requires 'pkgfile' package)
# source /usr/share/doc/pkgfile/command-not-found.bash

# Enables usage of __git_ps1() function in .bashrc which shows the current git branch in terminal prompt
source /usr/share/git/completion/git-prompt.sh
export PS1='\[\033[93m\][\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[35m\]$(__git_ps1)\[\e[00m\]\[\033[93m\]]\[\033[37m\]$ '

# Disable pause terminal output (XOFF)
stty -ixon

# Adds LLVM18 Clang binaries to PATH
export PATH="/usr/lib/llvm18/bin/:$PATH"
