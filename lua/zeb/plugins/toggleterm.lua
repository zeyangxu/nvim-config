-- import toggleterm plugin safely
local setup, toggleterm = pcall(require, "toggleterm")
if not setup then
	return
end

-- configure toggleterm
toggleterm.setup({
	size = 20,
	open_mapping = [[<c-p>]],
	direction = "float",
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

vim.api.nvim_set_keymap("t", "<C-t>", "<C-p><C-n>:CFloatTerm<CR>", { noremap = true, silent = true })

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
