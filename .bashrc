
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PS1="\u@\h:\w> "

# history $B$K%3%^%s%I<B9T;~9o$r5-O?$9$k(B
HISTTIMEFORMAT='%Y-%m-%dT%T%z '

# less$BJ8;z2=$1(B
export LESSCHARSET=utf-8

# alias setting
alias gitst='git status'
alias gitch='git checkout'
alias diffc='for file in `git diff --name-only`;do perl -c $file;done'
alias res_apache='sudo apachectl restart'
alias gitcon='git branch --contains '

# mysqlconn

# show git branch
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}
function promps {
# want to change color
    local  BLUE="\[\e[1;34m\]"
    local  RED="\[\e[1;31m\]"
    local  GREEN="\[\e[1;32m\]"
    local  WHITE="\[\e[00m\]"
    local  GRAY="\[\e[1;37m\]"

    case $TERM in
        xterm*) TITLEBAR='\[\e]0;\W\007\]';;
        *)      TITLEBAR="";;
    esac
    local BASE="\u@\h"
    PS1="${TITLEBAR}${GREEN}${BASE}${WHITE}:${BLUE}\W${GREEN}\$(parse_git_branch)${BLUE}\$${WHITE} "
}
promps
