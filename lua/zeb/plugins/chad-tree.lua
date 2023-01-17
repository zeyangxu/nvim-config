local chadtree_settings = {
	["keymap.primary"] = { " ", "enter" },
	["keymap.tertiary"] = { "<C-t>" },
	["keymap.v_split"] = { "v" },
	["keymap.h_split"] = { "h" },
	["theme.text_colour_set"] = "nord",
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
