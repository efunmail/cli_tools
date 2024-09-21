## PRE-setup

RENAME the 4 existing `nvim/` dirs to `nvim-KICK/`

```sh
for DIR in ~/.config ~/.local/share ~/.local/state ~/.cache; do mv $DIR/nvim $DIR/nvim-KICK; done
```

## Install Vim-Plug

- https://github.com/junegunn/vim-plug#neovim

> sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
>   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```


## Init

- Config file: `nvim-init.lua` // based on `094-nvim-init.lua`
    - [ ] TODO: Can put *'global'*(?) version in `~/.config/nvim/`

- Run, with command (`PlugInstall`)

```sh
~/neovim/0101/bin/nvim -u nvim-init.lua -c 'PlugInstall'
```
