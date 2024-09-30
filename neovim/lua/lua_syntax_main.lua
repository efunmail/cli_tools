_COMMENT = [[
  ## Run (using Neovim)

  ~/neovim/0101/bin/nvim -l lua_syntax_main.lua
]]

MAIN = require('lua_syntax')

print(MAIN.hello())
print(MAIN.hello('Ami'))

print(MAIN.treesitter.MSG)

print(MAIN.string_match())

MAIN.table_pairs()
