## Neovim

- Dirs:

```
~/.config/nvim/

~/.local/share/nvim/
~/.local/state/nvim/

~/.cache/nvim/
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
