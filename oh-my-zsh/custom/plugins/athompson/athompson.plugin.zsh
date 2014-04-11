c() { cd ~/code/$1; }
_c() { _files -W ~/code -/; }
compdef _c c

PATH=$PATH:~/bin
PATH=/home/ubuntu/tools/Maven/Default/bin:$PATH

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
alias git-personal-add-ssh-key='ssh-add ~/.ssh/id_rsa_github_personal'
alias gmlg='git log --author=athompson@fireforgegames.com'
alias tlf='tail -f'
alias ff-ci='ssh -i ~/.ssh/jenkins.pem ubuntu@dev.office.firepub.net'
alias ff-stg='ssh -i ~/.ssh/jenkins.pem ubuntu@staging.office.firepub.net'
alias ff-stg-playnether.com='ssh ops@172.16.2.154'
alias chef-server='ssh -i ~/.ssh/id_rsa_athompson athompson@ec2-23-22-208-71.compute-1.amazonaws.com'

git-cherry-pick-last-commit() {
    set -x
    original_branch=`current_branch`
    commitish=`gmlg -n 1 | cut -d ' ' -f 1`
    echo $commitish
    g co $@ && gl && g cherry-pick "$commitish"
    echo "Please push you changes at you convenience"
    echo "Returning you to your original branch"
    g co $original_branch
    set +x
}
