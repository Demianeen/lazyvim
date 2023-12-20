return {
  'gbprod/yanky.nvim',
  keys = {
    -- yank history remap
    {
      '<C-p>',
      function()
        require('telescope').extensions.yank_history.yank_history({})
      end,
      desc = 'Open Yank History',
      mode = { 'n', 'i', 'x' },
    },
    { '<leader>p', false },
    -- paste object
    {
      'ay',
      function()
        require('yanky.textobj').last_put()
      end,
      desc = 'Yanked text',
      mode = { 'o' },
    },
    -- blockwise paste
    {
      ']P',
      '<Plug>(YankyPutAfterBlockwise)',
      desc = 'Put indented after cursor (blockwise)',
    },
    {
      '[P',
      '<Plug>(YankyPutBeforeBlockwise)',
      desc = 'Put indented before cursor (blockwise)',
    },
  },
  opts = {
    preserve_cursor_position = {
      enabled = false,
    },
    textobj = {
      enabled = true,
    },
  },
}
