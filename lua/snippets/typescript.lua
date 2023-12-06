local ls = require("luasnip")
local extras = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt

local clg = ls.snippet("clg", {
	ls.text_node("console.log("),
	ls.insert_node(1),
	ls.text_node(")"),
})

ls.add_snippets("typescriptreact", {
	clg,
	ls.snippet("co", {
		ls.dynamic_node(function()
			local register_data = vim.fn.getreg() .. ""
			if string.match(register_data, "[%d-]+,%s*[%d-]+") then
				return ls.snippet_node(nil, {
					ls.text_node("position([" .. register_data .. "])"),
				})
			end
		end),
	}),
})

ls.add_snippets("typescript", {
	clg,
})
