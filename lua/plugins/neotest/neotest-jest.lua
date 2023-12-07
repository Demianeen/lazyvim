return {
	"nvim-neotest/neotest",
	dependencies = {
		"haydenmeade/neotest-jest",
	},
	opts = function(_, opts)
		table.insert(
			opts.adapters,
			require("neotest-jest")({
				jestCommand = "npm test --",
				-- jestConfigFile = function()
				-- 	local file = vim.fn.expand("%:p")
				-- 	if string.find(file, "/packages/") then
				-- 		return string.match(file, "(.-/[^/]+/)src")
				-- 			.. "jest.config.ts"
				-- 	end
				--
				-- 	return vim.fn.getcwd() .. "/jest.config.ts"
				-- end,
				env = { CI = true },
				cwd = function()
					local file = vim.fn.expand("%:p")
					if string.find(file, "/packages/") then
						return string.match(file, "(.-/[^/]+/)src")
					end
					return vim.fn.getcwd()
				end,
			})
		)
	end,
}
