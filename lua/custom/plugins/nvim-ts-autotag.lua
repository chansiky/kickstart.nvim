return {
  {
    'windwp/nvim-ts-autotag',
    -- event = 'LazyFile',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    opts = {},
  },
}
