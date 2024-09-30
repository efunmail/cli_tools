local M = {} -- [lua_module] REF: http://lua-users.org/wiki/ModuleDefinition


-- // NOTE: `name` has a DEFAULT value
function M.hello(name) return 'Hello, ' .. (name or 'there') .. '!'  end

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

  -- ## PYRIGHT 
  pyright = { },
  -- ## BASEDPYRIGHT 
  basedpyright = { },
}

-- # TREESITTER
M.treesitter = {
  MSG = 'TODO',
}


function M.string_match(s)
  -- REF: https://stackoverflow.com/a/77810559

  -- local path = "/path/to/your/file/filename.txt"
  local filename, extension = ("/some/path/filename.txt"):match("^.+/(.+)%.(.+)$")
  --                          =                         =
  print(filename, extension)
end


return M -- [lua_module]
