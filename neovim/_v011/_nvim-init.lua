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

-- // FzfLua
keymap('n', '<Leader>/', ':FzfLua grep_curbuf<CR>', {desc='Find in CURRENT buffer'})
keymap('n', '<Leader><Space>', ':FzfLua buffers<CR>', {desc='Find BUFFERS'})
keymap('n', '<Leader>fk', ':FzfLua keymaps<CR>', {desc='Find keymaps'})


-- ## PLUG-INs
-- // Installed in DEFAULT dir: ~/.local/share/$NVIM_APPNAME/plugged/
local Plug = vim.fn['plug#']
vim.fn['plug#begin']()
  Plug('catppuccin/nvim', { ['as']='catppuccin', ['tag']='v1.11.0' })
  Plug('ibhagwan/fzf-lua') -- // ALT: Telescope
  -- Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
vim.fn['plug#end']()
-- // ALT: vim commands
-- vim.cmd([[
--   call plug#begin()
--     Plug 'catppuccin/nvim', { 'as':'catppuccin', 'tag':'v1.11.0' }
--   call plug#end()
-- ]])

vim.cmd.colorscheme('catppuccin-mocha')
-- // ALT: vim.cmd([[ colorscheme catppuccin-mocha ]])


-- ** (Native) LSP 
-- // https://gpanders.com/blog/whats-new-in-neovim-0-11
vim.lsp.enable({
  -- 'luals'
  'pyright'
})


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


-- vim.cmd.colorscheme('catppuccin-mocha')
