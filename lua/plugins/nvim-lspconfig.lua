return {
  -- fzflua settings
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
      -- stylua: ignore
      ["*"] = {
        keys = {
          { "gd", "<cmd>FzfLua lsp_definitions     jump1=true ignore_current_line=true<cr>", desc = "Goto Definition", has = "definition" },
          { "gr", "<cmd>FzfLua lsp_references      jump1=true ignore_current_line=true<cr>", desc = "References", nowait = true },
          { "gI", "<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>", desc = "Goto Implementation" },
          { "gy", "<cmd>FzfLua lsp_typedefs        jump1=true ignore_current_line=true<cr>", desc = "Goto T[y]pe Definition" },
        }
      },
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },
}
