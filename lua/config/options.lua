-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- tabs
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
vim.opt.smartindent = true -- Tries to guess and adds intend when start a new line
vim.opt.autoindent = true -- Remembers indent from previous lines

vim.opt.undofile = true -- Sets persistent undo

-- vim.opt.hlsearch = false -- no highlight during search

vim.opt.scrolloff = 8 -- Always would be at least n characters in the bottom/ at the top of screen unless the end of the file
vim.opt.signcolumn = "yes" -- Always show columns for sign at the left part of the window
