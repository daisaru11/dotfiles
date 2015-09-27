## Default shell configuration
#
# set prompt



## Prompt displaying configuration
# 
#
autoload colors
colors
DEFAULT=$'%{\e[1;0m%}'
RESET="%{${reset_color}%}"
#GREEN=$'%{\e[1;32m%}'
GREEN="%{${fg[green]}%}"
#BLUE=$'%{\e[1;35m%}'
BLUE="%{${fg[blue]}%}"
RED="%{${fg[red]}%}"
CYAN="%{${fg[cyan]}%}"
MAGENTA="%{${fg[magenta]}%}"
YELLOW="%{${fg[yellow]}%}"
WHITE="%{${fg[white]}%}"


## Git
#
setopt prompt_subst
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:git:*' unstagedstr '%F{red}+%f'
zstyle ':vcs_info:git:*' formats "%F{green}[%b] %c%u%f"
zstyle ':vcs_info:git:*' actionformats "%F{green}[%b!%a] %c%u%f"

_vcs_precmd () { vcs_info }
add-zsh-hook precmd _vcs_precmd

case ${UID} in
0)
	#ROOT
	PROMPT="[${BLUE}%n@%m${RESET}] ${BLUE}#${RESET} "
	PROMPT2="%B${BLUE}%_#${RESET}%b "
	SPROMPT="%B${BLUE}%r is correct? [n,y,a,e]:${RESET}%b "
	RPROMPT="${BLUE}[%/]${RESET}"
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
		PROMPT="${CYAN}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
	;;
*)
	#USER
	PROMPT='${RESET}${BLUE}${WINDOW:+"[$WINDOW]"}${RESET}%% %{$fg_bold[blue]%}%n@%m ${RESET}@ ${vcs_info_msg_0_} ${YELLOW}%(5~,%-2~/.../%2~,%~)% ${RESET} :
${WHITE}$ ${RESET}'
	RPROMPT='${RESET} ${WHITE}[%D %*] ${RESET}'
	SPROMPT="%B${BLUE}%r is correct? [n,y,a,e]:${RESET}%b "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
		PROMPT="${CYAN}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
	PROMPT="
${PROMPT}"
	;;
esac



# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# 無駄な末尾の / を削除する
setopt auto_remove_slash



## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data



## Completion configuration
#
#unsetopt auto_list
unsetopt menu_complete

fpath=(~/.zsh/functions/Completion ${fpath})
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

typeset -ga chpwd_functions

autoload -U is-at-least
if is-at-least 4.3.11; then
  autoload -U chpwd_recent_dirs cdr
  chpwd_functions+=chpwd_recent_dirs
  zstyle ":chpwd:*" recent-dirs-max 500
  zstyle ":chpwd:*" recent-dirs-default true
  zstyle ":completion:*" recent-dirs-insert always
fi

##↑Allow Key completion
#
#zstyle ':completion:*:default' menu select true

## Alias configuration
##
## expand aliases before completing
##
#setopt complete_aliases     # aliased ls needs if file/dir completions work

# 補完表示を全てする
zstyle ':completion:*' verbose 'yes'
## 補完の機能を拡張
#zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
## 補完候補で入力された文字でまず補完してみて、補完不可なら大文字小文字を変換して補完する
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z} r:|[-_.]=**' '+m:{A-Z}={a-z} r:|[-_.]=**'



## Alias
#
#
alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
	alias ls="ls -G -w"
	;;
linux*)
	alias ls="ls --color"
	;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias cp="cp -i"

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*)
	precmd() {
		echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
	}
	export LSCOLORS=exfxcxdxbxegedabagacad
	export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
	zstyle ':completion:*' list-colors \
	'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
	;;
esac

# peco
#
function peco-select-history() {
	local tac
	if which tac > /dev/null; then
		tac="tac"
	else
		tac="tail -r"
	fi
	BUFFER=$(\history -n 1 | \
		eval $tac | \
		peco --query "$LBUFFER")
	CURSOR=$#BUFFER
	zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function peco-cdr () {
	local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
	if [ -n "$selected_dir" ]; then
		BUFFER="cd ${selected_dir}"
		zle accept-line
	fi
	zle clear-screen
}
zle -N peco-cdr
bindkey '^xl' peco-cdr

function peco-src () {
	local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
	if [ -n "$selected_dir" ]; then
		BUFFER="cd ${selected_dir}"
		zle accept-line
	fi
	zle clear-screen
}
zle -N peco-src
bindkey '^xs' peco-src


alias -g GB='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'   
alias -g GL='`git log --oneline --branches | peco --prompt "GIT LOG>" | awk "{print \\$1}"`'
alias -g GS='`git status --short | peco --prompt "GIT STATUS>" | awk "{print \\$2}"`'


## Key binds
#
#
bindkey -e
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end


## Extra settings
#
[ -f ~/.zshrc.platforms ] && source ~/.zshrc.platforms

