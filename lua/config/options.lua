-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.opt.clipboard = ''

-- tabs
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
vim.opt.smartindent = true -- Tries to guess and adds intend when start a new line
vim.opt.autoindent = true -- Remembers indent from previous lines
vim.opt.expandtab = false

vim.opt.textwidth = 80 -- text width. Used for example for comments max length
vim.opt.wrapmargin = 100

vim.opt.undofile = true -- Sets persistent undo

vim.opt.conceallevel = 2 -- conceal level in json/markdown files

-- vim.opt.hlsearch = false -- no highlight during search

vim.opt.scrolloff = 8 -- Always would be at least n characters in the bottom/ at the top of screen unless the end of the file
vim.opt.signcolumn = 'yes' -- Always show columns for sign at the left part of the window

vim.opt.report = 1000

vim.opt.spell = true -- enables spelling
vim.opt.spelloptions = 'camel'

vim.filetype.add({
  filename = {
    ['.eslintrc.json'] = 'jsonc',
    ['pre-commit'] = 'bash',
    ['.lintstagedrc'] = 'json',
  },
})

-- vim.opt.hint.paramType = true -- enables inline parameter hints
