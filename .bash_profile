export EDITOR='vim'
export LC_CTYPE=en_US.UTF-8
export SVN_EDITOR='vim'

# prompt
export PS1='\w\$ '

# history
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# Misc
alias c='clear'
alias rmd='rm -rvf'
alias psa='ps aux'
alias x='exit'

# Subversion
alias svdi='svn diff | grep ^I'
alias svdm='svn st | grep ^?'
alias svnup='svn up --ignore-externals'

# Directories
alias ..='cd ..'
alias h='cd ~/'
alias lsd='ls -ldhA */'
alias lsh='ls -lhA'
alias ll='ls -lhA'
# alias lsh='ls -lAhG'

# Mac OS X
alias showAll='defaults write com.apple.Finder AppleShowAllFiles true; killAll Finder'
alias hideAll='defaults write com.apple.Finder AppleShowAllFiles false; killAll Finder'
alias deepSleepOn='sudo pmset -a hibernatemode 1'
alias deepSleepOff='sudo pmset -a hibernatemode 0'
alias nicetop='top -ocpu -O+rsize -s 5 -n 20'
alias hosts='sudo vim /etc/hosts'
alias flushdns='dscacheutil -flushcache'

# Special
alias here='export THERE_PWD=`echo $PWD`'
alias there='cd $THERE_PWD'

# Git
alias deletemerged='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# Local screens
alias swork='screen -x work'

# WordPress/PHP
alias phpe='find . -type f -name \*.php -exec php -l {} \;'
alias php='php -d display_errors=stderr -d xdebug.cli_color=1'

# pinking shears
alias pinking-shears='ack --print0 -f --php --js --css | xargs -0 perl -p -i -e "s/[\t ]+$//g"'

# grep ignoring .svn files
alias vgrep='find . -type f \! -path *.svn* -print0 | xargs -0 grep \$1'
# grep -l ignoring .svn files
alias lsgrep='find . -type f \! -path *.svn* -print0 | xargs -0 grep -l $1'

# find function definitions
function fungrep {
	find . -type f \! -name *.svn* -print0 | xargs -0 egrep "^[[:space:]]*function.*?$1";
}

# apply remote patch
function apply_patch() {
	curl -s "$@" | patch -p0
}

function apply_svn_patch() {
	# http://unix.stackexchange.com/questions/30091/fix-or-alternative-for-mktemp-in-os-x
	TMPFILE=$(mktemp /tmp/tmp.XXXXXXXXXX);
	curl -so $TMPFILE "$@";
	svn patch $TMPFILE;
	rm -f $TMPFILE;
}

# find string in dir, open all files in TextMate
function open_files() {
	local SEARCH=$1;

	SEARCH=$(echo $SEARCH | sed -e 's/\([\/.*\|\]\)/\\&/g');
	ack "$SEARCH" -l | xargs mate;
}

# open manual in Preview instead of Terminal
function pman() {
	man -t "$@" | open -f -a Preview;
}

# better SVN diff for running inside screen
function svndiff() {
	svn diff "${@}" | colordiff | less -R
}

# search/replace in PHP files
# phpsed "s/wp_cache_get/false;\/\//"
# phpsed "s/get_transient/false;\/\//"
phpsed() {
	find . \( -name "*.php" -print0 \)  | xargs -0 sed -i "$1";
}

# Tricks from http://mmb.pcb.ub.es/~carlesfe/unix/tricks.txt
# 1. show file listing *below* current directory without changing
# ls args: long format, sort my time modified, reverse order, show blocksize before listing, include .files
# function arg is the subdirectory to list
function lt() {
	ls -ltrsa "$@" | tail;
}
# 2. search active processes for a certain string
# example `psgrep EyeTV`
function psgrep() {
	ps aux | grep -v grep | grep "$@" -i --color=auto;
}
# 3. find a particular file by name
# exmaple `fname html5`
function fname() {
	find . -iname "*$@*";
}

# load bashrc if it exists
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
