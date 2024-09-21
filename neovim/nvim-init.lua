-- ## LUA functions... // PN

-- ** Whether file `name` exists
-- // https://stackoverflow.com/a/4991602
local function file_exists(name)
   local f = io.open(name, 'r')
   if f ~= nil then io.close(f) return true
   else return false end
end
-- ** Whether command `cmd_str` is successful - eg. check an executable exists
-- // `os.execute`: https://stackoverflow.com/a/9676297
local function __os_exec_ok(cmd_str) return os.execute(cmd_str) == 0 end
-- ** Whether command `cmd_str` is successful - eg. `grep` (does NOT work with `os.execute()` above)
-- // `io.popen():read()` - https://stackoverflow.com/a/58902012
-- // `> ... > 2>&1` - https://linuxize.com/post/bash-redirect-stderr-stdout/#redirecting-stderr-to-stdout
local function popen_cmd_ok(cmd_str) return tonumber(io.popen(cmd_str .. ' > /dev/null 2>&1 ; echo $?'):read('*a')) == 0 end
-- ** Whether file `name` contains string `str`
local function file_contains(name, str) return popen_cmd_ok('grep' .. ' "' .. str .. '" ' .. name) end

-- ** Get value of ENV VAR `name`
-- // `os.getenv`: https://stackoverflow.com/questions/41800071
local function env_var(name)
  return os.getenv(name)
end
-- ** Whether ENV VAR `name` exists
local function env_var_exists(name) return env_var(name) ~= nil end

-- ** ALIASes  // [2]
local api = vim.api
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- to access global variables
local opt = vim.opt  -- to set options

-- ** Whether vim plug-in `name` is installed
local function Vim_Plugin_installed(name)
  -- // https://github.com/wbthomason/packer.nvim/issues/167#issue-787437860
  -- To show var: <VimScript> let g:plugs
  local plugs = g.plugs
  -- // https://stackoverflow.com/a/2282547
  return plugs[name] ~= nil
end

-- ** MAP Function  // [2]
local function map(mode, lhs, rhs, opts)
  local options = {noremap=true, silent=true} -- ORIG: {noremap=true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- // https://tuckerchapman.com/2018/06/16/how-to-use-the-vim-leader-key/
g.mapleader = ' '  -- ALT: ','

-- ## Set MAPPINGs - core
map('n', ';', ':', {silent=false}) -- VIM: nnoremap ; :

map('t', '<Esc><Esc>', '<C-\\><C-n>') -- VIM: tnoremap <Esc><Esc> <C-\><C-n>
-- // toggle ON; and toggle OFF
map('n', '<C-UP><C-UP>', ':FloatermToggle<CR>')
map('t', '<C-DOWN><C-DOWN>', '<C-\\><C-n>:FloatermToggle<CR>') -- // ALT: '<Esc><Esc><Esc>'

-- ## Set OPTIONs
opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.softtabstop = 0
opt.expandtab = true
opt.shiftwidth = 2
opt.smarttab = true
-- // https://www.linux.com/tutorials/vim-tips-using-tabs/
--    Opening a tab: :tabf <TAB>
--    Moving between tabs: :tabnext :tabprevious
opt.showtabline = 2

opt.undofile = true -- // pn2024 [kickstart.nvim]

-- ## AUTO-Commands // ToDo

-- ## PLUGINs  // [1]
_COMMENT = [[
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  <VimScript>:
    source %
    PlugInstall

    let g:plugs

    PlugClean
]]
-- local PLUGIN_DIR = '~/neovim/072/plugged_PN_temp_01' -- // 2023
-- local PLUGIN_DIR = '~/neovim/083/plugged_PN_temp_083' -- // 2023
-- local PLUGIN_DIR = '~/neovim/091/plugged_PN_temp_091' -- // 2023
local PLUGIN_DIR = '~/neovim/0101/plugged_PN_0101' -- // pn2024
-- ============================================== 

local Plug = fn['plug#']
fn['plug#begin'](PLUGIN_DIR)

Plug('catppuccin/nvim') -- [catppuccin] -- // 2023

Plug('vim-airline/vim-airline') -- [vim-airline]

Plug('nvim-lua/plenary.nvim')

Plug('neovim/nvim-lspconfig') -- [nvim-lspconfig]
fn['plug#end']()

if Vim_Plugin_installed('nvim') then cmd [[
  colorscheme catppuccin-mocha
]] end

if Vim_Plugin_installed('vim-airline') then
  -- // https://github.com/vim-airline/vim-airline#smarter-tab-line
  cmd [[
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
  ]]
end

if Vim_Plugin_installed('nvim-lspconfig') then
  local lspconfig = require 'lspconfig'

  -- ## MAP ...
  map('n', 'gd', ':split<CR>:lua vim.lsp.buf.definition()<CR>')
  map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')

  -- // https://github.com/neovim/nvim-lspconfig#configuration -- pn2024
  -- map('n', 'K',   '<cmd>lua vim.lsp.buf.hover()<CR>')

  -- // `v:` : https://github.com/nanotee/nvim-lua-guide#vimapinvim_replace_termcodes
  -- map('i', 'A-k', 'v:vim.lsp.buf.hover()') -- TODO ??

  -- // https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
  -- // `show_line_diagnostics`: https//github.com/neovim/nvim-lspconfig/issues/1046
  map('n', '<Leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
   
  -- // https://github.com/neovim/nvim-lspconfig#configuration -- pn2024
  -- map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  -- map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

  -- ** pyright
  if popen_cmd_ok('bun run -b pyright --version')
  and file_exists('pyrightconfig.json') then
    require'lspconfig'.pyright.setup({
      cmd = {'bun', 'x', '-b', 'pyright-langserver', '--stdio'}
    })
  end
end
