# z
. `brew --prefix`/etc/profile.d/z.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# eval
eval "$(sheldon source)"
eval "$(starship init zsh)"

# asdf
. /usr/local/opt/asdf/libexec/asdf.sh


# options
setopt share_history

