return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		event_handlers = {
			{
				event = "file_opened",
				-- file_opened
				handler = function(_)
					vim.cmd("Neotree close")
				end,
			},
		},
		filesystem = {
			window = {
				mappings = {
					["n"] = "add",
					["N"] = "add_directory",
				},
			},
		},
	},
}
