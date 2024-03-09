return {
  'ahmedkhalf/project.nvim',
  opts = {
    manual_mode = false,
    -- { "lsp", "pattern" },
    detection_methods = { 'pattern' },
    patterns = {
      '.git',
      '_darcs',
      '.hg',
      '.bzr',
      '.svn',
      'Makefile',
      'package.json',
    },
    -- Table of lsp clients to ignore by name
    -- eg: { "efm", ... }
    ignore_lsp = {},

    -- Don't calculate root dir on specific directories
    -- Ex: { "~/.cargo/*", ... }
    exclude_dirs = {},

    -- Show hidden files in telescope
    show_hidden = false,

    -- When set to false, you will get a message when project.nvim changes your
    -- directory.
    silent_chdir = true,

    -- What scope to change the directory, valid options are
    -- * global (default)
    -- * tab
    -- * win
    scope_chdir = 'global',

    -- Path where project.nvim will store the project history for use in
    -- telescope
    datapath = vim.fn.stdpath('data'),
  },
  -- config = function()
  --   require('project_nvim').setup({
  --     patterns = { '.git', 'Makefile', '*.sln', 'build/env.sh', 'package.json' },
  --     sync_root_with_cwd = true,
  --     respect_buf_cwd = true,
  --     update_focused_file = {
  --       enable = true,
  --       update_root = true,
  --     },
  --   })
  -- end,
}
