-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- delete lazyterm keymap
vim.api.nvim_del_keymap('n', '<c-/>')
vim.api.nvim_del_keymap('t', '<c-/>')
vim.api.nvim_del_keymap('n', '<c-_>')
vim.api.nvim_del_keymap('t', '<C-_>')

vim.g.mapleader = ' '

-- redo
vim.keymap.set('n', 'U', '<C-r>', opts('Redo'))

-- add tabs in visual mode
vim.keymap.set('v', '<Tab>', '>gv', opts('Tab in visual mode: indent right'))
vim.keymap.set(
  'v',
  '<S-Tab>',
  '<gv',
  opts('Shift-Tab in visual mode: indent left')
)

-- paste/delete and not copy
vim.keymap.set(
  'x',
  '<leader>p',
  '"_dP',
  opts('Paste and delete without yanking')
)
vim.keymap.set(
  { 'n', 'v' },
  '<leader>d',
  [["_d]],
  opts('Delete without yanking')
)
vim.keymap.set('n', 'x', '"_x', opts('Delete char without yanking'))
vim.keymap.set('n', 'X', '"_x', opts('Delete char backwards without yanking'))

-- -- allows to move selected code up and down
-- vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts('Move selection down'))
-- vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts('Move selection up'))

-- concats strings but leaves cursor in place
-- vim.keymap.set(
--   "n",
--   "<leader>sx",
--   require("telescope.builtin").resume,
--   { noremap = true, silent = true, desc = "Resume" }
-- )

vim.g.mapleader = ' '
-- vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

-- redo
vim.keymap.set('n', 'U', '<C-r>')

-- add tabs in visual mode
vim.keymap.set('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

-- paste/delete and not copy
vim.keymap.set('x', '<leader>p', '"_dP')
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', 'X', '"_x')
vim.keymap.set('n', '<C-x>', '_x')
vim.keymap.set('n', '<C-X>', '_x')

-- allows to move selected code up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- concats strings but leaves cursor in place
vim.keymap.set('n', 'J', 'mzJ`z')

-- half page down/up, but centers page
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- next/previous search result, but centers page and folded code unfolds
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- disable Q
vim.keymap.set('n', 'Q', '<nop>')

-- -- swap between projects in one window
-- vim.keymap.set(
--   'n',
--   '<C-f>',
--   '<cmd>silent !tmux neww tmux-sessionizer<CR>',
--   opts('Swap projects in tmux')
-- )

-- turns off highlight
vim.keymap.set('n', '<Esc><Esc>', ':noh<CR>', { silent = true })

-- Open new line on ctrl enter in insert mode
vim.keymap.set('i', '<C-CR>', '<Esc>o')

-- auto regex search & replace
vim.keymap.set(
  'n',
  '<leader>rs',
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Select word for a search & replace' }
)
vim.keymap.set('v', '<leader>rs', function()
  -- Get the start and end of the visual selection
  local start_pos = vim.fn.getpos('v')
  local end_pos = vim.fn.getpos('.')
  local start_line, start_col = start_pos[2], start_pos[3]
  local end_line, end_col = end_pos[2], end_pos[3]

  -- Adjust end_col to include the last character in the selection
  if end_col > 0 then end_col = end_col - 1 end

  -- Get the text of the visual selection
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  if #lines == 0 then
    vim.notify('No lines selected')
    return
  end

  local selection = table.concat(lines, '\n')
  print(selection)
  if #lines > 1 then
    vim.notify('More than 1 line selected')
    return
  else
    selection = selection:sub(start_col, end_col + 1)
  end

  -- Escape special characters
  selection = selection:gsub('/', '\\/')

  -- Prepare the substitute command
  local command = ':s/' .. selection .. '/' .. selection .. '/gI'
  vim.api.nvim_feedkeys(command, 'n', true)
end, { desc = 'Select for a search & replace' })

-- makes file executable
vim.keymap.set(
  'n',
  '<leader>fx',
  '<cmd>!chmod +x %<CR>',
  { silent = true, desc = 'makes file executable' }
)
vim.keymap.set(
  'n',
  '<leader>fX',
  '<cmd>!chmod -x %<CR>',
  { silent = true, desc = 'makes file NOT executable' }
)

vim.keymap.set(
  'n',
  '<leader>sP',
  ':!t<CR>',
  { desc = 'Projects', silent = true }
)
