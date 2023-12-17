local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require('lazy').setup({
  spec = {
    -- lazyvim default plugins
    {
      'LazyVim/LazyVim',
      import = 'lazyvim.plugins',
    },
    -- core
    { import = 'lazyvim.plugins.extras.ui.alpha' },
    { import = 'lazyvim.plugins.extras.test.core' },
    { import = 'lazyvim.plugins.extras.dap.core' },
    -- typescript
    { import = 'lazyvim.plugins.extras.linting.eslint' },
    { import = 'lazyvim.plugins.extras.formatting.prettier' },
    -- json
    { import = 'lazyvim.plugins.extras.lang.json' },
    -- markdown
    { import = 'lazyvim.plugins.extras.lang.markdown' },
    -- python
    { import = 'lazyvim.plugins.extras.lang.python' },
    { import = 'lazyvim.plugins.extras.formatting.black' },
    -- yaml
    { import = 'lazyvim.plugins.extras.lang.yaml' },
    -- docker
    { import = 'lazyvim.plugins.extras.lang.docker' },
    -- lua
    { import = 'lazyvim.plugins.extras.dap.nlua' },

    -- custom plugins location
    { import = 'plugins' },
    { import = 'plugins.neotest' },
    { import = 'plugins.lsp' },
    { import = 'plugins.dap' },
    -- languages
    { import = 'plugins.typescript' },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { 'tokyonight', 'habamax' } },
  checker = { enabled = true, notify = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        'gzip',
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
