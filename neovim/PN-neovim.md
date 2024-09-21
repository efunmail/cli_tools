## Neovim

Assume binary is: `~/neovim/0101/bin/nvim`

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

## Config (nvim-init.lua)

- 'Plugin' dir:

```lua
local PLUGIN_DIR = '~/neovim/0101/plugged_PN_0101' -- // pn2024
-- ==============================================
```

- *Minimal* plugins...

```lua
local Plug = fn['plug#']
fn['plug#begin'](PLUGIN_DIR)

Plug('catppuccin/nvim') -- [catppuccin]

Plug('nvim-lua/plenary.nvim')

Plug('neovim/nvim-lspconfig') -- [nvim-lspconfig]
fn['plug#end']()
```

## Kickstart

### OmniFunc(?)

- [ ] 'Auto-completion' when typing a string with paths...

    - [ ] Perhaps part of *Telescope* or *Treesitter*?

```lua
s = '~/cli_tools/...'
```
