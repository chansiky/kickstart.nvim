return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = true,
  },

  {
    'catppuccin/nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    lazy = true,
    name = 'catppuccin',
    opts = {
      lsp_styles = {
        underlines = {
          errors = { 'undercurl' },
          hints = { 'undercurl' },
          warnings = { 'undercurl' },
          information = { 'undercurl' },
        },
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        mini = true,
        navic = { enabled = true, custom_bg = 'lualine' },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        snacks = true,
        telescope = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      -- require('tokyonight').setup {
      --   styles = {
      --     comments = { italic = false }, -- Disable italics in comments
      --   },
      -- }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    --
    -- config = function()
    --   vim.cmd 'colorscheme rose-pine'
    -- end,
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    -- priority = 1000, -- make sure to load this before all the other start plugins
    -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- config = function()
    --   vim.cmd 'colorscheme rose-pine'
    -- end,
  },

  {
    'eldritch-theme/eldritch.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
  },
}
