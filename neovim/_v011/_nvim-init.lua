-- ** PLUG-INs
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
