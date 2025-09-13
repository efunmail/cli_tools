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
vim.keymap.set('n', ';', ':', {silent=false}) -- // [VIM] nnoremap ; :
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>') -- // [VIM] tnoremap <Esc><Esc> <C-\><C-n>
-- // toggle ON; and toggle OFF
-- vim.keymap.set('n', '<C-UP><C-UP>', ':FloatermToggle<CR>')
-- vim.keymap.set('t', '<C-DOWN><C-DOWN>', '<C-\\><C-n>:FloatermToggle<CR>') -- // ALT: '<Esc><Esc><Esc>'

-- // ALT: [VIM] 3rd arg: ':FzfLua buffers'
vim.keymap.set('n', '<leader><space>', function() FzfLua.buffers() end, { desc = '[ ] Find existing buffers' })


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
