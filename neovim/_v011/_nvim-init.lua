vim.cmd([[
  call plug#begin()
    Plug 'catppuccin/nvim', { 'as':'catppuccin', 'tag':'v1.11.0' }
  call plug#end()

]])


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


vim.cmd.colorscheme('catppuccin')
