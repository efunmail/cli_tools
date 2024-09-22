## Neovim

- Dirs:

```
~/.config/nvim/

~/.local/share/nvim/
~/.local/state/nvim/

~/.cache/nvim/
```

### NVIM_APPNAME

https://neovim.io/doc/user/starting.html

> **Standard Paths**
>
> `vim.fn.stdpath('config')`, etc.

- Can specify `NVIM_APPNAME` on cmd-line:

    - Dirs will be: `~/.config/$NVIM_APPNAME/`, etc

```sh
NVIM_APPNAME=nvim-PN nvim
# ==================
```

## Kickstart

Repo: https://github.com/nvim-lua/kickstart.nvim

### `init.lua` (`~/.config/nvim/init.lua`)

- Allow *'undo history'* to **persist**:

```lua
vim.opt.undofile = true
```

## Neovim v0.10

- Switch *'inlay hints'* ON or OFF:

```vim
:lua vim.lsp.inlay_hint.enable(true,nil)

:lua vim.lsp.inlay_hint.enable(false,nil)
```

- Reference:

    - `inlay-hints.nvim`: https://github.com/MysticalDevil/inlay-hints.nvim/blob/master/lua/inlay-hints/utils.lua#L70
    - `function M.toggle_inlay_hints()`
  
## VimPlug

- After *adding* a plugin (e.g. `nvim-init.lua`), **install** by:

```sh
NVIM_APPNAME=nvim-PN ~/neovim/0101/bin/nvim -c 'PlugInstall'
```

- Create a **snapshot** of plugins with their hashes:

```vim
PlugSnapshot my-snapshot.vim
```
