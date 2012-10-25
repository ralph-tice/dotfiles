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
#alias matrix='echo -e "\e[1;40m" ; clear ; characters=$( jot -c 94 33 | tr -d \'\n\' ) ; while :; do echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 )) $characters ;sleep 0.05; done|gawk \'{ letters=$5; c=$4; letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}\''

