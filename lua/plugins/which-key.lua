return {
  "folke/which-key.nvim",
  opts = function(_, _)
    local wk = require("which-key")
    wk.register({
      h = {
        name = "harpoon",
      },
    }, { prefix = "<leader>" })
  end,
}
