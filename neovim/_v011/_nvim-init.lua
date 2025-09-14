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

vim.opt.undofile = true -- // pn2024 [kickstart]

-- [SylvanFranklin_init_lua](https://github.com/SylvanFranklin/.config/blob/main/nvim/init.lua)
-- vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])
-- vim.opt.signcolumn = 'yes'
vim.opt.winborder = 'rounded'


-- ## KEYs, KEYMAPs
-- [pn]
-- // https://tuckerchapman.com/2018/06/16/how-to-use-the-vim-leader-key/
vim.g.mapleader = ' ' -- // ALT: ','

-- ** MAP Function
local function keymap(mode, lhs, rhs, opts)
  local options = {noremap=true, silent=true} -- // ORIG: {noremap=true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options) -- // ORIG: vim.api.nvim_set_keymap(....)
end

keymap('n', ';', ':', {silent=false}) -- // [VIM] nnoremap ; :
keymap('t', '<Esc><Esc>', '<C-\\><C-n>') -- // [VIM] tnoremap <Esc><Esc> <C-\><C-n>
-- // toggle ON; and toggle OFF
-- keymap('n', '<C-UP><C-UP>', ':FloatermToggle<CR>')
-- keymap('t', '<C-DOWN><C-DOWN>', '<C-\\><C-n>:FloatermToggle<CR>') -- // ALT: '<Esc><Esc><Esc>'


-- ## PLUG-INs
-- // Installed in DEFAULT dir: ~/.local/share/$NVIM_APPNAME/plugged/
local Plug = vim.fn['plug#']
vim.fn['plug#begin']()
  Plug('catppuccin/nvim', { ['as']='catppuccin', ['tag']='v1.11.0' })
  Plug('ibhagwan/fzf-lua') -- // ALT: Telescope

  -- Plug('nvimdev/lspsaga.nvim') -- // NOT needed - re: *native* LSP

  -- Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
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
  keymap('n', '<Leader>/', ':FzfLua grep_curbuf<CR>', {desc='Find in CURRENT buffer'})
  keymap('n', '<Leader><Space>', ':FzfLua buffers<CR>', {desc='Find BUFFERS'})
  keymap('n', '<Leader>fk', ':FzfLua keymaps<CR>', {desc='Find keymaps'})
end


-- ** (Native) LSP 
if vim.lsp ~= nil then
  -- // `inlay_hint` - https://neovim.io/doc/user/lsp.html#lsp-inlay_hint
  keymap('n', '<Leader>H', ':lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>', {desc='lsp: Toggle INLAY HINTS'})

  -- // `vsplit` - https://vi.stackexchange.com/a/42124
  -- // ALT: 3rd arg: `function() vim.cmd('split'); vim.lsp.buf.definition(); end`
  keymap('n', '<Leader>gd', ':split<CR>:lua vim.lsp.buf.definition()<CR>', {desc='lsp: Go to Definiton...'})
 
 
  -- // TODO: `vim.diagnostic` and `virtual_lines` `virtual_text`
  -- // [gpanders_011](https://gpanders.com/blog/whats-new-in-neovim-0-11)
  -- // https://qmacro.org/blog/posts/2025/06/10/a-modern-and-clean-neovim-setup-for-cap-node.js-configuration-and-diagnostics/


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
