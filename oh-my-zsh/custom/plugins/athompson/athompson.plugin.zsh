c() { cd ~/code/$1; }
_c() { _files -W ~/code -/; }
compdef _c c

PATH=$PATH:~/bin

export EDITOR='vim'

# autocorrect is more annoying than helpful
unsetopt correct_all

# a few aliases I like
alias gs='git status'
alias gd='git diff'
