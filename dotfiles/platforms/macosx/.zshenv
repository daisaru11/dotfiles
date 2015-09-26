## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

##
# home bin
#
export PATH=$HOME/bin:$PATH

##
# EDITOR
#
export EDITOR=vim
alias vi=vim

[ -x /usr/local/bin/vim ] && alias vim=/usr/local/bin/vim
#if [[ -x /Applications/MacVim.app/Contents/MacOS/Vim ]]; then
#	alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
#fi

##
# SCREEN
#
[ -x /usr/local/bin/screen ] && alias screen=/usr/local/bin/screen
[ -x $HOME/local/bin/screen ] && alias screen=$HOME/local/bin/screen

##
# ctags
#
[ -x /usr/local/Cellar/ctags/5.8/bin/ctags ] && alias screen=/usr/local/Cellar/ctags/5.8/bin/ctags

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


##
# Direnv
#
if [ -x "`which direnv`" ]; then
	eval "$(direnv hook zsh)"
fi
