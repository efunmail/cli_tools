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


-- ## PLUG-INs
-- // Installed in DEFAULT dir: ~/.local/share/$NVIM_APPNAME/plugged/
local Plug = vim.fn['plug#']
vim.fn['plug#begin']()
  Plug('catppuccin/nvim', {['as']='catppuccin', ['tag']='v1.11.0'})
  Plug('ibhagwan/fzf-lua') -- // ALT: Telescope

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

if vim.g.plugs['fzf-lua'] ~= nil then
  keymap('n', '<Leader>/', ':FzfLua grep_curbuf<CR>', {desc='Search CURRENT buffer'})
  keymap('n', '<Leader>?', ':FzfLua keymaps<CR>', {desc='Search for KEYMAP'})
  -- keymap('n', '<Leader>sk', ':FzfLua keymaps<CR>', {desc='Search for KEYMAP'})
  keymap('n', '<Leader><Space>', ':FzfLua buffers<CR>', {desc='Search for BUFFER'})
  keymap('n', '<Leader>sf', ':FzfLua files<CR>', {desc='Search for FILE'})

  keymap('n', '<A-Up>', ':FzfLua command_history<CR>', {desc='Search Command History'}) -- // `ALT` key
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
  --   filetypes = { 'lua' },
  -- }
  vim.lsp.config['pyright'] = {
    cmd = { 'basedpyright-langserver', '--stdio' },
    -- cmd = { 'basedpyright-langserver-bun', '--stdio' }, -- TODO: OKAY
    -- root_markers = { 'pyrightconfig.json' }, -- TODO: optional??
    filetypes = { 'python' }, -- TODO: 'py' ??
  }
 
  -- // [gpanders_011]
  vim.lsp.enable({
    -- 'luals'
    'pyright'
  })
end


if vim.g.plugs['lspsaga.nvim'] ~= nil then
  require('lspsaga').setup({})

  -- // TODO:
  --    Lspsaga finder
  --    ...
  keymap('n', '<Leader>ld', ':Lspsaga peek_definition<CR>', {desc='lspsaga: Peek DEFINITION'})

  keymap('n', '<C-Up><C-Up>', ':Lspsaga term_toggle<CR>', {desc='lspsaga: [NORM] Toggle TERMINAL'})
  keymap('t', '<C-Down><C-Down>', '<C-\\><C-n>:Lspsaga term_toggle<CR>', {desc='lspsaga: [TERM] Toggle TERMINAL'})
end

-- [kickstart](https://github.com/nvim-lua/kickstart.nvim)
-- [gpanders_011](https://gpanders.com/blog/whats-new-in-neovim-0-11)
-- [SylvanFranklin_init_lua](https://github.com/SylvanFranklin/.config/blob/main/nvim/init.lua)
