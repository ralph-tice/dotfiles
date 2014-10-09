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
alias ff-stg-playnether.com='ssh ops@172.16.2.154'

ssh_aws_list() {
    echo $1 | awk -F' ' '{ print $2 }' | xargs -I {} ssh -o StrictHostKeyChecking=no {} "echo;ec2metadata|grep public-hostname;$2"
}

ssh_list() {
    echo $1 | xargs -I {} ssh -o StrictHostKeyChecking=no {} "echo;ec2metadata|grep public-hostname;$2"
}

bump_cookbook() {
    COOKBOOK=${PWD##*/}
    VERSION=`grep version metadata.rb | sed "s/version //" | sed "s/'//g"`

    ga metadata.rb
    g commit -m "Bumping $COOKBOOK cookbook to $VERSION"
}

bump_cookbook_env() {
    COOKBOOK=$1
    VERSION=$2
    ENV=$3
    FILE="$4.json"

    ga $FILE
    g commit -m "Bumping $COOKBOOK cookbook to $VERSION in $ENV"
}

bump_cookbook_ci() {
    COOKBOOK=$1
    VERSION=$2
    bump_cookbook_env $COOKBOOK $VERSION 'ci' 'firepub-sandbox'
}

bump_cookbook_qa() {
    COOKBOOK=$1
    VERSION=$2
    bump_cookbook_env $COOKBOOK $VERSION 'qa' 'qa2mber'
}

bump_cookbook_prod() {
    COOKBOOK=$1
    VERSION=$2
    bump_cookbook_env $COOKBOOK $VERSION 'prod' 'production2'
}

scp() {
    if [[ "$@" =~ : ]];then
        /usr/bin/scp $@
    else
        echo 'You forgot the colon dumbass!'
    fi
} # Catch a common scp mistake.

chef-boostrap() {
    HOSTNAME=$1
    ROLE=$2
    BOOTSTRAP_SCRIPT=/home/athompson/code/firepub/scripts/chef-bootstrap/bootstrap.sh
    CHEF_SETUP=/home/athompson/code/firepub/scripts/chef-bootstrap/chef-setup.tar.gz
    scp $BOOTSTRAP_SCRIPT $HOSTNAME: 
    scp $CHEF_SETUP $HOSTNAME: 
    ssh $HOSTNAME "~/bootstrap.sh"
    ssh $HOSTNAME "cd /etc/chef && sudo tar -xzf ~/chef-setup.tar.gz && sudo mv ./chef-setup/* . && sudo rmdir ./chef-setup && cd -"
    ssh $HOSTNAME "sudo ruby /etc/chef/chef-setup.rb --environment $ENVIRONMENT --role $ROLE"

}

}
