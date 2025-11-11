return {
  {
    'inkarkat/vim-mark',
    enabled = false,
    event = 'VeryLazy',
    keys = {
      {
        '<leader>j.',
        '<Plug>MarkSet<CR>',
        desc = 'Set Mark',
      },

      {
        '<leader>jl',
        '<Plug>MarkAllClear<CR>',
        desc = 'C[l]ear All Marks',
      },
    },
  },
}
