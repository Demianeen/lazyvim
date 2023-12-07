return {
	"nvim-neotest/neotest",
	requires = {
		"haydenmeade/neotest-jest",
	},
	opts = function(_, opts)
		table.insert(opts.adapters, {
			opts.adapters,
			adapters = {
				require("neotest-jest")({
					jestCommand = "npm test --",
					jestConfigFile = "custom.jest.config.ts",
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
			},
		})
	end,
}
