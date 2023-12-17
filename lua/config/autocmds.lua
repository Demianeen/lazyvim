-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- resetting options
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove('r')
    vim.opt_local.formatoptions:remove('o')
    vim.opt_local.formatoptions:append('/')
    vim.opt_local.formatoptions:append('1')
  end,
})
