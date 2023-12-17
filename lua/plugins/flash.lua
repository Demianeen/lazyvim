return {
  'folke/flash.nvim',
  -- stylua: ignore
  keys = {
    { "S", mode = { "n", "x", "o" }, false},
    { "<leader>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
}
