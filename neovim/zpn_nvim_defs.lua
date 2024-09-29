local _COMMENT = [[
-- ** ITERATE thro a table - https://stackoverflow.com/a/17437077
-- for k, v in pairs(require('lspconfig.util'))
--   do print (k, v)
-- end

-- for k, v in pairs(require('lspconfig.util').get_lsp_clients())
-- -- for k, v in pairs(require('lspconfig.util').get_lsp_clients({name = 'intelephense'}))
--   do print (k, v)
-- end

local my_data = {
  { id = 110, name = 'Ami', },
  { id = 120, name = 'Bob', },
}
my_data = vim.tbl_deep_extend('force', my_data, {
  { id = 130, name = 'Chas', },
})
-- for k, v in pairs(my_data)
--   do print (k, v.name)
-- end
]]
_COMMENT = nil

-- REF: http://lua-users.org/wiki/ModuleDefinition
local M = {}

function M.hello() print('Hello') end

-- # LSPCONFIG
M.lspconfig = {
  -- ## LUA
  lua_ls = {
    -- cmd = {'nothing_123'}, -- TEMP:
    settings = {
      -- [kickstart]
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    }
  },
}

-- # TREESITTER
M.treesitter = {
  MSG = 'TODO',
}

return M
