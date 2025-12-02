return {
  'L3MON4D3/LuaSnip',
  lazy = true,
  build = (not LazyVim.is_win()) and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp" or nil,
  dependencies = {
    {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
        require('luasnip.loaders.from_vscode').lazy_load { paths = { vim.fn.stdpath 'config' .. '/snippets' } }
      end,
    },
  },
  keys = function()
    return {}
  end,
  opts = {
    history = true,
    delete_check_events = 'TextChanged',
  },
  config = function()
    local ls = require 'luasnip'
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node

    ls.add_snippets('javascript', {
      s('logonce', {
        t 'useEffect(() => {',
        t { '', "  console.log('" },
        i(1, 'varName'),
        t ":', ",
        f(function(args)
          return args[1][1]
        end, { 1 }),
        t ');',
        t { '', '}, [' },
        f(function(args)
          return args[1][1]
        end, { 1 }),
        t ']);',
        i(0),
      }),
    })

    -- Also add it for javascriptreact and typescriptreact
    ls.add_snippets('javascriptreact', {
      s('logonce', {
        t 'useEffect(() => {',
        t { '', "  console.log('" },
        i(1, 'varName'),
        t ":', ",
        f(function(args)
          return args[1][1]
        end, { 1 }),
        t ');',
        t { '', '}, [' },
        f(function(args)
          return args[1][1]
        end, { 1 }),
        t ']);',
        i(0),
      }),
    })

    ls.add_snippets('typescriptreact', {
      s('logonce', {
        t 'useEffect(() => {',
        t { '', "  console.log('" },
        i(1, 'varName'),
        t ":', ",
        f(function(args)
          return args[1][1]
        end, { 1 }),
        t ');',
        t { '', '}, [' },
        f(function(args)
          return args[1][1]
        end, { 1 }),
        t ']);',
        i(0),
      }),
    })
  end,
}
