local _COMMENT = [[

  Auto-Completion
  - [x] nvim-cmp
  - [.] cmp-nvim-lsp cmp_nvim_lsp 
      - DISABLED: { name = 'nvim_lsp' }, -- pn2024_WIP

]]
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

opt.undofile = true -- // pn2024 [kickstart]

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

-- ## TreeSitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'}) -- [nvim-treesitter]
  Plug('nvim-treesitter/nvim-treesitter-refactor') -- [nvim-treesitter-refactor]
  Plug('nvim-treesitter/nvim-treesitter-textobjects') -- [nvim-treesitter-textobjects]

  Plug('nvim-treesitter/nvim-treesitter-context') -- [nvim-treesitter-context]

Plug('nvim-lua/plenary.nvim')
  -- ## Telescope
  Plug('nvim-telescope/telescope.nvim') -- [telescope.nvim]
  -- ## LSPconfig
  Plug('neovim/nvim-lspconfig') -- [nvim-lspconfig]
    -- ## Auto-Completion
    -- // https://github.com/hrsh7th/nvim-cmp#setup -- [nvim-cmp]
    -- Plug 'hrsh7th/cmp-nvim-lsp' -- pn2024_WIP
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    -- ## Auto-Completion - LuaSnip
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

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

-- TODO:
--   [ ] CHECK the keymaps... 
--   [ ] 'f_' OR 's_'  ??
if Vim_Plugin_installed('telescope.nvim') then
  -- // https://github.com/nvim-telescope/telescope.nvim#usage
  map('n', '<Leader>fk', '<cmd>Telescope keymaps<CR>')

  map('n', '<Leader>fb', '<cmd>Telescope buffers<CR>')

  map('n', '<Leader>ff', '<cmd>Telescope find_files<CR>')
  map('n', '<Leader>fF', '<cmd>Telescope find_files hidden=true<CR>')

  -- // https://www.reddit.com/r/neovim/comments/rkh3o0/telescope_live_grep_on_a_single_file_only/
  -- // fgb: current Buffer; fgo: Open files; fgcs: cwd=src; fgcd: cwd=docs; etc 
  map('n', '<Leader>fgb',  '<cmd>Telescope live_grep search_dirs={vim.fn.expand("%:p")}<CR>')
  map('n', '<Leader>fgo',  '<cmd>Telescope live_grep grep_open_files=true<CR>')
  map('n', '<Leader>fgcs', '<cmd>Telescope live_grep cwd=src<CR>')
  map('n', '<Leader>fgcd', '<cmd>Telescope live_grep cwd=docs<CR>')
  map('n', '<Leader>fgct', '<cmd>Telescope live_grep cwd=tests<CR>')
  map('n', '<Leader>fG',   '<cmd>Telescope live_grep<CR>')

  map('n', '<Leader>fh', '<cmd>Telescope git_files<CR>')

  map('n', '<Leader>ft', '<cmd>Telescope treesitter<CR>')

  -- // https://www.youtube.com/watch?v=stqUbv-5u2s
  -- // https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
  vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, {desc='[?] Find recently opened files'}) -- // 2023
  vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' }) -- // 2023
  vim.keymap.set('n', '<leader>/', function() -- // 2023
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })
end

if Vim_Plugin_installed('nvim-treesitter') then
_COMMENT = [[
  " // Run `:TSInstallInfo` to get list of parsers 
  "
  " // ALT: install *manually* - (eg. run `:TSInstall lua`) 
  "
  " ( FYI: For settings/info, run `:TSModuleInfo` ) 
  "
]]
  require('nvim-treesitter.configs').setup({
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    -- ensure_installed = "maintained", -- ORIG
    ensure_installed = {
      "python", "javascript", "typescript",
      "vue", "lua",
      "json", "toml", "yaml",
      "css", "html", "scss",
      "markdown",
      "pug", -- [OPTION]
      -- "markdown", -- // 2023
      "markdown_inline" -- // 2023
      -- "dockerfile",
      -- "php",
      -- "go", "svelte",
      -- "java", "kotlin", "ruby", "rust" -- !! kotlin is huge! (17.9 MB)
    },
    ignore_install = { }, -- List of parsers to ignore installing

    highlight = {
      enable = true, -- false will disable the whole extension

      -- // ORIG: DISABLE "vue" - otherwise, conflicts with `vim-vue...` and `pug`
      -- disable = { "pug" },  -- // [OPTION]

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
    -- // https://github.com/nvim-treesitter/nvim-treesitter#incremental-selection
    incremental_selection = {
      enable = true,
      keymaps = {
        -- // https://github.com/nvim-treesitter/nvim-treesitter/issues/509#issuecomment-699176722
        init_selection    = '<C-n>', -- 'gnn',
        node_incremental  = '<C-n>', -- 'grn',
        node_decremental  = '<C-m>', -- 'grm'
        scope_incremental = '<C-s>', -- 'grc'
      },
    },

    -- [treesitter-refactor] // https://github.com/nvim-treesitter/nvim-treesitter-refactor
    refactor = {
      -- highlight_definitions = { enable = true },
      highlight_current_scope = { enable = true }, -- // [OPTION]

      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        },
      },

      navigation = {
        enable = true,
        keymaps = {
          goto_definition = "gnd",
          list_definitions = "gnD",
          list_definitions_toc = "gO",
          goto_next_usage = "<a-*>",
          goto_previous_usage = "<a-#>",
        },
      },
    },

    -- [nvim-treesitter-textobjects]
    textobjects = {
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
    },
  })

  if Vim_Plugin_installed('nvim-treesitter-context') then
    require'treesitter-context'.setup {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
      patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
              'class',
              'function',
              'method',
              'for', -- These won't appear in the context
              'while',
              'if',
              'switch',
              'case',
          },
      },
      exact_patterns = {
      },

      -- [!] The options below are exposed but shouldn't require your attention,
      --     you can safely ignore them.

      zindex = 20, -- The Z-index of the context window
    }
  end

  -- // re: `highlight_current_scope` [OPTION]
  if true then -- TEMP
  cmd [[
    :highlight TSCurrentScope cterm=NONE  gui=NONE
    :highlight TSComment      cterm=ITALIC  gui=ITALIC
    :highlight TSString       cterm=ITALIC  gui=ITALIC
  ]]
  end
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
      cmd = {'bun', 'x', '-b', 'pyright-langserver', '--stdio'},
      -- // Ternary `COND and A or B` - http://lua-users.org/wiki/TernaryOperator
      capabilities = Vim_Plugin_installed('cmp_nvim_lsp')
        and require('cmp_nvim_lsp').default_capabilities() -- [nvim-cmp]
        or nil
    })
  end
  
  if Vim_Plugin_installed('nvim-cmp') then -- [nvim-cmp]
    local cmp = require'cmp'
    local luasnip = require('luasnip') -- [LuaSnip]
    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' }, -- [kickstart] TODO: ??
     
      -- [kickstart] Please read `:help ins-completion`
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        -- Scroll the documentation window [b]ack / [f]orward
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- Accept ([y]es) the completion.
        --  This will auto-import if your LSP supports it.
        --  This will expand snippets if the LSP sent a snippet.
        ['<C-y>'] = cmp.mapping.confirm { select = true },

        -- If you prefer more traditional completion keymaps,
        -- you can uncomment the following lines
        --['<CR>'] = cmp.mapping.confirm { select = true },
        --['<Tab>'] = cmp.mapping.select_next_item(),
        --['<S-Tab>'] = cmp.mapping.select_prev_item(),

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ['<C-Space>'] = cmp.mapping.complete {},

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion),
        -- see: https://github.com/L3MON4D3/LuaSnip#keymaps
      },

      -- [kickstart]
      -- sources = {
      --   { name = 'nvim_lsp' },
      --   { name = 'luasnip' },
      --   { name = 'path' },
      -- },
      sources = cmp.config.sources({
        -- { name = 'nvim_lsp' }, -- pn2024_WIP
        { name = 'luasnip' },
        { name = 'path' },
      }, {
        { name = 'buffer' },
      })
    })
 
    -- // https://github.com/hrsh7th/nvim-cmp#setup
    -- >> Set up lspconfig. Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    --   capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- }
  end
end
