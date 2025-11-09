return {
  {
    'folke/snacks.nvim',
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      terminal = {
        win = {
          keys = {
            -- nav_h = { '<C-h>', term_nav 'h', desc = 'Go to Left Window', expr = true, mode = 't' },
            -- nav_j = { '<C-j>', term_nav 'j', desc = 'Go to Lower Window', expr = true, mode = 't' },
            -- nav_k = { '<C-k>', term_nav 'k', desc = 'Go to Upper Window', expr = true, mode = 't' },
            -- nav_l = { '<C-l>', term_nav 'l', desc = 'Go to Right Window', expr = true, mode = 't' },
            hide_slash = { '<C-/>', 'hide', desc = 'Hide Terminal', mode = { 't', 'n' } },
            hide_underscore = { '<c-_>', 'hide', desc = 'which_key_ignore', mode = { 't', 'n' } },
          },
        },
      },
    },
  -- stylua: ignore
  keys = {
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    { "<leader>dps", function() Snacks.profiler.scratch() end, desc = "Profiler Scratch Buffer" },
  },
  },
}
