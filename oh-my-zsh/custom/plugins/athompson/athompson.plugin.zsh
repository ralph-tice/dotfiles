c() { cd ~/code/$1; }
_c() { _files -W ~/code -/; }
compdef _c c

PATH=$PATH:~/bin

export EDITOR='vim'

# autocorrect is more annoying than helpful
unsetopt correct_all

# disabling some dragons
unalias gp # git push
unalias git-svn-dcommit-push # git and svn mix 
unalias ggpush # git push current branch
unalias ggpnp # git pull and push current branch

# a few aliases I like
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias git-personal-repo-email='git config --add user.email netengr2009@gmail.com'
alias git-personal-add-ssh-key='ssh-add ~/.ssh/id_rsa_github_public'
alias gmlg='git log --author=athompson@constantcontact.com'
alias tlf='tail -f'
