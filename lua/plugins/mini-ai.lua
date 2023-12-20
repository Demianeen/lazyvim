return {
  {
    'echasnovski/mini.ai',
    opts = function()
      local ai = require('mini.ai')
      return {
        custom_textobjects = {
          P = ai.gen_spec.treesitter({
            a = '@parameter.outer',
            i = '@parameter.inner',
          }, {}),
        },
      }
    end,
  },
  {
    'folke/which-key.nvim',
    opts = function(_, _)
      local wk = require('which-key')
      wk.register({
        mode = { 'o', 'x' },
        a = {
          P = 'Parameter',
        },
        i = {
          P = 'Parameter',
        },
      })
    end,
  },
}
