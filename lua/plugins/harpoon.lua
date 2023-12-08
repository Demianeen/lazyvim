return {
	{
		"ThePrimeagen/harpoon",
		keys = {
			{
				"<leader>ha",
				function()
					require("harpoon.mark").add_file()
				end,
				desc = "Add file to harpoon",
			},
			{
				"<leader>he",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
				desc = "See all harpooned files",
			},
			{
				"<leader>h1",
				function()
					require("harpoon.ui").nav_file(1)
				end,
				desc = "Open first harpooned file",
			},
			{
				"<leader>h2",
				function()
					require("harpoon.ui").nav_file(2)
				end,
				desc = "Open second harpooned file",
			},
			{
				"<leader>h3",
				function()
					require("harpoon.ui").nav_file(3)
				end,
				desc = "Open third harpooned file",
			},
			{
				"<leader>h4",
				function()
					require("harpoon.ui").nav_file(4)
				end,
				desc = "Open fourth harpooned file",
			},
		},
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"folke/which-key.nvim",
		opts = function(_, _)
			local wk = require("which-key")
			wk.register({
				h = {
					name = "harpoon",
				},
			}, { prefix = "<leader>" })
		end,
	},
}
