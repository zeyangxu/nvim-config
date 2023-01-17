-- import luasnip plugin safely
local luasnip_status, ls = pcall(require, "luasnip")
if not luasnip_status then
	return
end
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.add_snippets(nil, {
	typescript = {
		snip({
			trig = "unilog",
			namr = "Unilog",
			dscr = "Console log with unicorn emoji",
		}, {
			text({ "console.log('🦄 [" }),
			insert(1, "module"),
			text({ "] " }),
			insert(2, "item"),
			text({ "', " }),
			insert(3),
			text({ ")" }),
		}),
	},
})

ls.filetype_extend("typescriptreact", { "typescript" })
