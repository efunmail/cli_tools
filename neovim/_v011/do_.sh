#!/usr/bin/env bash

# // RUN: NVIM_APPNAME=nvim-pn-00 $0 -u _nvim-init.lua -S my-session.vim

_NEOVIM_DIR=$HOME/neovim/v0.11.4


NVIM_APPNAME=${NVIM_APPNAME:-nvim_app}
export NVIM_APPNAME
: <<'COMMENT_NVIM_APPNAME'
  ## DIRs
  
  // https://github.com/jellydn/tiny-nvim#cleanup
   
  ~/.config/APPNAME
  ~/.local/share/APPNAME
  ~/.cache/APPNAME
  ~/.local/state/APPNAME
COMMENT_NVIM_APPNAME


do_:install:vim-plug() {
  local _VIM_PLUG="$HOME/.local/share/$NVIM_APPNAME/site/autoload/plug.vim"

  if [ ! -e "$_VIM_PLUG" ]; then
    curl -fLo "$_VIM_PLUG" \
      --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
}
# do_:install:vim-plug

do_:run() {
  $_NEOVIM_DIR/bin/nvim "$@"
}
do_:run "$@"
