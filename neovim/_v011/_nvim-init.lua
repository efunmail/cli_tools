local _COMMENT_info = [[
  ## INFO

  ### NVIM_APPNAME
  - Lua: `os.getenv('NVIM_APPNAME')`

  ### 'config' dir
  // https://neovim.io/doc/user/lua-guide.html#lua-guide-config
  - Lua: `vim.fn.stdpath('config')`
  - Vim: `:echo stdpath('config')`

  ### 'data' dir
  // https://stackoverflow.com/a/70830232
  - DEFAULT 'plug-in' dir is `/plugged` under 'data'

  - Vim: `:lua FzfLua.files({cwd=vim.fn.stdpath('data')..'/plugged', query='lspconfig pyright'})`
]]
-- ## OPTIONs
-- [pn]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
-- // https://www.linux.com/tutorials/vim-tips-using-tabs/
--    Opening a tab: :tabf <TAB>
--    Moving between tabs: :tabnext :tabprevious
vim.opt.showtabline = 2

vim.opt.undofile = true -- // [kickstart]

-- // [SylvanFranklin_init_lua]
-- vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])
-- vim.opt.signcolumn = 'yes'
vim.opt.winborder = 'rounded'


-- !! NOTE: Must be defined BEFORE plug-ins are loaded. [kickstart]
-- // https://tuckerchapman.com/2018/06/16/how-to-use-the-vim-leader-key/
vim.g.mapleader = ' ' -- // ALT: ','
vim.g.maplocalleader = ' '

-- ** MAP Function
local function keymap(mode, lhs, rhs, opts)
  local options = {noremap=true, silent=true} -- // ORIG: {noremap=true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options) -- // ORIG: vim.api.nvim_set_keymap(....)
end

keymap('n', ';', ':', {silent=false}) -- // [VIM] nnoremap ; :
keymap('t', '<Esc><Esc>', '<C-\\><C-n>') -- // [VIM] tnoremap <Esc><Esc> <C-\><C-n>
-- // [FloatermToggle] Toggle ON; and Toggle OFF
-- keymap('n', '<C-UP><C-UP>', ':FloatermToggle<CR>')
-- keymap('t', '<C-DOWN><C-DOWN>', '<C-\\><C-n>:FloatermToggle<CR>') -- // ALT: '<Esc><Esc><Esc>'

-- // [kickstart] CLEAR 'search' highlights. (See `:help hlsearch`)
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')



-- // DEFAULT dir for plug-ins - https://stackoverflow.com/a/70830232
-- // ( `~/.local/share/$NVIM_APPNAME/plugged/` )
local PLUGIN_DIR = vim.fn.stdpath('data')..'/plugged'

local Plug = vim.fn['plug#']
vim.fn['plug#begin'](PLUGIN_DIR)
  Plug('catppuccin/nvim', {['as']='catppuccin', ['tag']='v1.11.0'})
  Plug('ibhagwan/fzf-lua') -- // ALT: Telescope

  Plug('saghen/blink.cmp', {['version']='v1.7.0'}) -- // NOTE: 'version' 

  -- Plug('neovim/nvim-lspconfig') -- // TIP: for `cue`...
  Plug('nvimdev/lspsaga.nvim') -- , {['as']='lspsaga'})

  -- TODO: leap.nvim
 
  -- TODO: Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
vim.fn['plug#end']()
-- // ALT: vim commands
-- vim.cmd([[
--   call plug#begin()
--     Plug 'catppuccin/nvim', { 'as':'catppuccin', 'tag':'v1.11.0' }
--   call plug#end()
-- ]])

if vim.g.plugs['catppuccin'] ~= nil then
  vim.cmd.colorscheme('catppuccin-mocha') -- // ALT: vim.cmd([[ colorscheme catppuccin-mocha ]])
end

_INFO_fzf_lua = [[

File: `~/.local/share/$NVIM_APPNAME/plugged/fzf-lua/doc/fzf-lua.txt`

- `builtin = {`

```lua
["<M-Esc>"]     = "hide"

["<S-down>"]    = "preview-page-down",
```

- `actions = {`

```lua
["enter"]       = actions.file_edit_or_qf,

["ctrl-t"]      = actions.file_tabedit,
```

]]
if vim.g.plugs['fzf-lua'] ~= nil then
  keymap({'i','n'}, '<A-Up>', '<cmd>FzfLua<CR>', {desc='Search FZFLua (BUILTIN)'}) -- // `ALT` key
  keymap({'i','n'}, '<A-L>', '<cmd>FzfLua builtin query=lsp<CR>', {desc='Search FZFLua (BUILTIN) "LSP"'}) -- // `ALT` key
  keymap({'i','n'}, '<A-.>', '<cmd>FzfLua keymaps<CR>', {desc='Search for KEYMAP'})
  keymap({'i','n'}, "<A-'>", '<cmd>FzfLua registers<CR>', {desc='Search REGISTERS'})
  keymap({'i','n'}, '<A-;>', '<cmd>FzfLua command_history<CR>', {desc='Search Command History'})

  -- // `query` `expand` - https://github.com/ibhagwan/fzf-lua/issues/835
  keymap({'i','n'}, '<A-/>', '<cmd>lua FzfLua.grep_curbuf({query=vim.fn.expand("<cword>")})<CR>', {desc='Search CURRENT buffer'})

  keymap('n', '<Leader><Space>', ':FzfLua buffers<CR>', {desc='Search for BUFFER'}) -- // `file_drop_or_qf`
  keymap('n', '<Leader>sf', ':FzfLua files<CR>', {desc='Search for FILE'})
  keymap('n', '<Leader>sfp', function() FzfLua.files({
      cwd=PLUGIN_DIR, query='^nvim-lspconfig pyright'
    }) end,
    {desc='Search for FILE in `PLUGGED/`'}
  )

  keymap('n', '<Leader>nh',
    -- // TODO: `<cmd>FzfLua grep_curbuf query=stdpath<CR>` can be appended??
    '<cmd>FzfLua helptags query=standard-path<CR>',
    {desc='Search HELP for `standard-path`'}
  )

  -- // https://github.com/ibhagwan/fzf-lua#insert-mode-completion
  keymap({'i','n','v'}, '<C-x><C-f>', '<cmd>FzfLua complete_path<CR>', {desc="Auto-complete PATH"})

  -- // `incoming_calls` - (Also, see `outgoing_calls`.)
  keymap('n', '<Leader>lci', ':FzfLua lsp_incoming_calls<CR>', {desc='[lsp]: INCOMING calls.'})
 
  -- // `file_drop_or_qf` - https://github.com/ibhagwan/fzf-lua/issues/2295
  local file_drop_or_qf = function(selected, opts)
    if #selected > 1 then require('fzf-lua.actions').file_sel_to_qf(selected, opts)
    else require('fzf-lua.actions').vimcmd_entry("drop", selected, opts)
    end
  end

  require('fzf-lua').setup({
    actions = {
      files = {
        ['default'] = file_drop_or_qf, -- // "drop" to *existing* tab
      },
    },
  })
 
  local fzf_ast_grep = function()
    -- https://www.reddit.com/r/neovim/comments/1hyy02q/astgrep_with_fzflua/
    require("fzf-lua").fzf_live(
      "ast-grep --context 0 --heading never --pattern <query> 2> /dev/null", {
        exec_empty_query = false,
        actions = {
          ["default"] = require "fzf-lua".actions.file_edit,
          ["ctrl-q"] = {
            -- Send results to the quickfix list
            fn = require("fzf-lua").actions.file_edit_or_qf,
            prefix = "select-all+"
          }
        }
      }
    )
  end
  keymap('n', '<Leader>sg', function() fzf_ast_grep() end, {desc='WIP: AST-GREP search...'})
end


if vim.g.plugs['blink.cmp'] ~= nil then
  local blink = require('blink.cmp')
  blink.setup({
    -- keymap = { preset = 'super-tab' }
    keymap = {
      preset = 'super-tab',
      -- // https://www.reddit.com/r/neovim/comments/1hk1t35/a_custom_blink_config/
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
      ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
    }
  })
end


-- ** (Native) LSP 
if vim.lsp ~= nil then
  -- // `inlay_hint` - https://neovim.io/doc/user/lsp.html#lsp-inlay_hint
  keymap('n', '<Leader>H', ':lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>', {desc='lsp: Toggle INLAY HINTS'})

  -- // `vsplit` - https://vi.stackexchange.com/a/42124
  -- // ALT: 3rd arg: `function() vim.cmd('split'); vim.lsp.buf.definition(); end`
  keymap('n', '<Leader>gd', ':split<CR>:lua vim.lsp.buf.definition()<CR>', {desc='lsp: Go to DEFINITON'})
 
 
  -- // TODO: `vim.diagnostic` and `virtual_lines` `virtual_text`
  -- // [gpanders_011]
  -- // https://qmacro.org/blog/posts/2025/06/10/a-modern-and-clean-neovim-setup-for-cap-node.js-configuration-and-diagnostics/

  -- // `checkhealth`
  keymap('n', '<Leader>chl', ':checkhealth vim.lsp<CR>', {desc='health: Check vim.LSP'})


  -- vim.lsp.config['luals'] = {
  --   cmd = { 'lua_ls', '--WIP' },
  --   root_markers = { 'WIP.lua' },
  --   filetypes = {'lua'},
  -- }
  vim.lsp.config['basedpyright'] = {
    cmd = { 'basedpyright-langserver', '--stdio' },
    -- cmd = { 'basedpyright-langserver-bun', '--stdio' }, -- // OKAY
    -- root_markers = { 'pyrightconfig.json' }, -- TODO: optional??
    filetypes = {'python'},
  }
 
  vim.lsp.config['cue'] = {
    -- // https://github.com/dagger/cuelsp
    cmd = { 'cuelsp' }, -- !! NOTE: OKAY, but `cuelsp` is NOT maintained!!
  
    -- // https://github.com/cue-lang/cue/wiki/LSP:-Getting-started
    -- cmd = { 'cue', 'lsp', }, -- !! NOTE: ALPHA version - v0.15.0-alpha.1

    root_dir = vim.fn.getcwd(), -- // https://vi.stackexchange.com/a/43942
    -- root_markers = {''}, -- // ALT: is okay // ORIG: {'cue.mod','.git'} 

    filetypes = {'cue'},
  }

  -- // INFO: marksman 
  -- - https://github.com/artempyanykh/marksman/releases/download/2024-12-18/marksman-linux- x64
  -- - sha256sum: b9cb666c643dfd9b699811fdfc445ed4c56be65c1d878c21d46847f0d7b0e475
  -- //- https://www.reddit.com/r/HelixEditor/comments/1ibkb4u/comment/m9nqdb6/
  vim.lsp.config['marksman'] = {
    cmd = { 'marksman', 'server' },
    -- root_markers = { '.marksman.toml', 'git' }, 
    filetypes = {'markdown'},
  }
                                                                                      

  -- // [gpanders_011]
  vim.lsp.enable({
    -- 'luals'
    'basedpyright',
    'cue',
    'marksman',
  })
end


if vim.g.plugs['lspsaga.nvim'] ~= nil then
  require('lspsaga').setup()

  -- // TODO:
  --    Lspsaga finder
  --    ...
  keymap('n', '<Leader>ld', ':Lspsaga peek_definition<CR>', {desc='lspsaga: Peek DEFINITION'})
  -- // NOTE: `gra` is *built-in* Code Action
  -- // Built-in uses line diagnostic; lspsaga's uses cursor diag. - https://nvimdev.github.io/lspsaga/codeaction/
  keymap('n', '<Leader>lca', ':Lspsaga code_action<CR>', {desc='lspsaga: Code ACTION'})

  keymap('n', '<Leader>lcd', ':Lspsaga show_cursor_diagnostics<CR>', {desc='lspsaga: Show *cursor* DIAGNOS.'})
  keymap('n', '<Leader>lcl', ':Lspsaga show_line_diagnostics<CR>', {desc='lspsaga: Show *line* DIAGNOS.'})

  -- // `outgoing_calls` - (Also, see `incoming_calls`.)
  keymap('n', '<Leader>lco', ':Lspsaga outgoing_calls<CR>', {desc='lspsaga: OUTGOING calls.'})

  keymap('n', '<Leader>lo', ':Lspsaga outline<CR>', {desc='lspsaga: Show OUTLINE. `e`, `o`.'})

  keymap('n', '<C-Up><C-Up>', ':Lspsaga term_toggle<CR>', {desc='lspsaga: [NORM] Toggle TERMINAL'})
  keymap('t', '<C-Down><C-Down>', '<C-\\><C-n>:Lspsaga term_toggle<CR>', {desc='lspsaga: [TERM] Toggle TERMINAL'})
end

-- [kickstart](https://github.com/nvim-lua/kickstart.nvim)
-- [gpanders_011](https://gpanders.com/blog/whats-new-in-neovim-0-11)
-- [SylvanFranklin_init_lua](https://github.com/SylvanFranklin/.config/blob/main/nvim/init.lua)
