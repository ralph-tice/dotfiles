c() { cd ~/code/$1; }
_c() { _files -W ~/code -/; }
compdef _c c

PATH=$PATH:~/bin
PATH=/home/ubuntu/tools/Maven/Default/bin:$PATH

export EDITOR='vim'
export VAGRANT_DEFAULT_PROVIDER='virtualbox'

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
alias gmlg='git log --author=Andrew_Thompson@rapid7.com'
alias tlf='tail -f'

ssh_aws_list() {
    echo $1 | awk -F' ' '{ print $2 }' | xargs -I {} ssh -o StrictHostKeyChecking=no {} "echo;ec2metadata|grep public-hostname;$2"
}

ssh_list() {
    echo $1 | xargs -I {} ssh -o StrictHostKeyChecking=no {} "echo;ec2metadata|grep public-hostname;$2"
}

scp() {
    if [[ "$@" =~ : ]];then
        /usr/bin/scp $@
    else
        echo 'You forgot the colon dumbass!'
    fi
} # Catch a common scp mistake.

vaild_json() {
    FILE=$1
    ruby -rjson -e "p ! JSON.parse(File.open('$FILE').read).empty?"
}

# Given content like the following passed as the first argument
# this should build the methods needed to write most of the convection
# code for you.  You will have to do some massaging of the method names,
# but this takes most of the grunt work out.
# 
# Example:
# 
# % convection_gen_code ""Count" : String,
#"Handle" : String,
#"Timeout" : String"
convection_gen_code() {
    echo $1 | sed "s/\"//g" | cut -d ':' -f 1 | tr -d ' ' | xargs -I {} printf "property \:{}, '{}'\n"
}

# Usage:
# tunnel host port
# tunnel host remoteport localport
# tunnel host remoteport localport passthruhost
tunnel() {
    PROXYHOST=$1
    RPORT=$2
    LPORT=$3
    PASSTHRUHOST=$4

    if [ -z $LPORT ]; then
        LPORT=$RPORT
    fi

    if [ -z $PASSTHRUHOST ]; then
        PASSTHRUHOST=localhost
    fi

    ssh $PROXYHOST -L ${LPORT}:$PASSTHRUHOST:${RPORT}
}

es-cluster-url() {
    case $1 in
        "us-east-1")
            URL=$RAPID7_ES_EAST_1_ES_CLUSTER
            ;;
        "eu-central-1")
            URL=$RAPID7_EU_CENTRAL_1_ES_CLUSTER
            ;;
    esac
}

us-east-es-disk() {
    es-cluster-url "us-east-1"
    curl -s $URL/_nodes/stats/fs | jq --raw-output ".nodes[].fs.data[] | .available_in_bytes / .total_in_bytes * 100" | sort
}

eu-central-es-disk() {
    es-cluster-url "eu-central-1"
    curl -s $URL/_nodes/stats/fs | jq --raw-output ".nodes[].fs.data[] | .available_in_bytes / .total_in_bytes * 100" | sort
}

asgard-cache-clear() {
    echo "Clearing $1 caches"
    echo "Enter your username and press [ENTER]: "
    read name
    echo "Enter you password and press [ENTER]: "
    read -s pass
    curl -u $name:$pass -d "id=$1" $RAPID7_ASGARD/cache/fill
}

asgard-ami-cache-clear() {
    asgard-cache-clear "Multi-region Image"
}
