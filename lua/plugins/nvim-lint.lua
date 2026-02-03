return {
  {
    'mfussenegger/nvim-lint',
    opts = {
      linters_by_ft = {
        -- potentially you will have to make sure markdownlint-cli2 is installed `npm install -g markdownlint-cli2`
        markdown = { 'markdownlint-cli2' },
      },
      linters = {
        ['markdownlint-cli2'] = {
          args = {
            '--config',
            -- <not-working>
            -- vim.fn.stdpath 'config' .. '/.markdownlint-cli2.jsonc',
            -- </not-working>

            -- <config "local ~/.config/nvim folder">
            vim.fn.stdpath 'config' .. '/.markdownlint.json',
            -- </config>

            -- <config "global HOME(~) folder">
            -- vim.fn.expand '~/.markdownlint.json',
            -- </config>
          },
        },
      },
    },
  },
}
