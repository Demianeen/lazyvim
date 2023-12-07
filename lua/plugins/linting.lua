return {
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			-- add tsx and treesitter
			vim.list_extend(opts.ensure_installed, {
				"proselint",
				"write-good",
				"alex",
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		opts = {
			-- Event to trigger linters
			events = { "BufWritePost", "BufReadPost", "InsertLeave" },
			linters_by_ft = {

				-- fish = { "fish" },
				-- Use the "*" filetype to run linters on all filetypes.
				markdown = { "proselint", "write_good", "alex" },
				-- ['*'] = { 'global linter' },
				-- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
				-- ['_'] = { 'fallback linter' },
			},
			---@type table<string,table>
			linters = {
				-- Example of using selene only when a selene.toml file is present
				selene = {
					-- `condition` is another LazyVim extension that allows you to
					-- dynamically enable/disable linters based on the context.
					condition = function(ctx)
						return vim.fs.find(
							{ "selene.toml" },
							{ path = ctx.filename, upward = true }
						)[1]
					end,
				},
			},
		},
	},
}
