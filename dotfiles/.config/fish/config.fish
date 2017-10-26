

. ~/.config/fish/func.fish
. ~/.config/fish/env.fish

function fish_user_key_bindings
  bind \cr peco_history
  bind \cf peco_z
end

balias vi nvim
balias vim nvim

if not test -f $HOME/.config/fish/functions/fisher.fish
  curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  fisher
end
