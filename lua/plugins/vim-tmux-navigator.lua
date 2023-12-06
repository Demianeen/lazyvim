return {
  "christoomey/vim-tmux-navigator",
  keys = {
    { "<S-Left>", "<Cmd>TmuxNavigateLeft<CR>", { desc = "Navigate to the left split" } },
    { "<S-Down>", "<Cmd>TmuxNavigateDown<CR>", { desc = "Navigate down" } },
    { "<S-Up>", "<Cmd>TmuxNavigateUp<CR>", { desc = "Navigate up" } },
    { "<S-Right>", "<Cmd>TmuxNavigateRight<CR>", { desc = "Navigate to the right split" } },
  },
  -- config = function()
  --   vim.g.tmux_navigator_no_mappings = 1
  --
  --   local tmux_navigator = require("vim-tmux-navigator")
  --
  --   -- Define custom key mappings
  --   vim.keymap.set("n", "<Left>", tmux_navigator.TmuxNavigateLeft, { desc = "Navigate to the left split" })
  --   vim.keymap.set("n", "<Down>", tmux_navigator.TmuxNavigateDown, { desc = "Navigate down" })
  --   vim.keymap.set("n", "<Up>", tmux_navigator.TmuxNavigateUp, { desc = "Navigate up" })
  --   vim.keymap.set("n", "<Right>", tmux_navigator.TmuxNavigateRight, { desc = "Navigate to the right split" })
  -- end,
}
