## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

##
# PATH
# see http://karur4n.hatenablog.com/entry/2016/01/18/100000
setopt no_global_rcs
export PATH=/usr/local/bin:/usr/sbin:/sbin:$PATH

##
# home bin
#
export PATH=$HOME/bin:$PATH

##
# EDITOR
#
export EDITOR=vim

##
# WORDCHARS
#
# '/'を削る
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

##
# node.js
#
#export NODE_PATH=/usr/local/lib/node_modules

##
# nodebrew
#
export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=$HOME/.nodebrew
export NODE_PATH=$HOME/.nodebrew/current/lib/node_modules

##
# pythonbrew
#
#[ -f $HOME/.pythonbrew/etc/bashrc ] && source $HOME/.pythonbrew/etc/bashrc
##
# PYTHONPATH
#
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

##
# virtualenvwrapper
#
#if [[ -x $(which virtualenvwrapper.sh) ]]
#then
#    export WORKON_HOME=$HOME/.virtualenvs
#    source `which virtualenvwrapper.sh`
#fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

##
# GOPATH
#
if [ -x "`which go`" ]; then
	export GOROOT=`go env GOROOT`
	export GOPATH=$HOME
	export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

