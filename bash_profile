# rbenv init
# curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

eval "$(rbenv init -)"

# because i'm a bad person
alias vi=vim

# from james
alias sshd='ssh -i ~/.ssh/chef_dev.id_rsa -l ubuntu'
alias bfbi='brew file brew install'

# from brew install bash_completion, fixes __git_ps1 command not found error
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

function table() {
case "$1" in
  flip)
    echo "（╯°□°）╯︵ ┻━┻ "
    ;;
  set)
    echo "┬─┬ ノ( ゜-゜ノ)"
    ;;
  man)
    echo "(╯°Д°）╯︵ /(.□ . \)"
    ;;
  bear)
    echo "ʕノ•ᴥ•ʔノ ︵ ┻━┻"
    ;;
  jedi)
    echo "(._.) ~ ︵ ┻━┻"
    ;;
  pudgy)
    echo "(ノ ゜Д゜)ノ ︵ ┻━┻"
    ;;
  battle)
    echo "(╯°□°)╯︵ ┻━┻ ︵ ╯(°□° ╯)"
    ;;
  rage)
    echo "‎(ﾉಥ益ಥ）ﾉ ┻━┻"
    ;;
  herc)
    echo "(/ .□.)\ ︵╰(゜Д゜)╯︵ /(.□. \)"
    ;;
  *)
    echo "Pick one: flip set man bear jedi pudgy battle rage herc"
    #            exit 1
    ;;
esac
}

function eyes() {
echo "ಠ_ಠ"
}
function shrug() {
echo "¯\_(ツ)_/¯"
}

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

export AWS_DEFAULT_REGION=us-west-1
