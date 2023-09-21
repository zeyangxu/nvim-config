-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	-- keybinds for navigation in lspsaga window
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	-- use enter to open file with finder
	finder = {
		keys = {
			jump_to = "e",
			edit = "<CR>",
			vsplit = "v",
			split = "h",
			tabe = "t",
			tabnew = "r",
		},
	},
	-- use enter to open file with definition preview
	definition = {
		edit = "<CR>",
		vsplit = "<C-v>",
		split = "<C-h>",
		tabe = "<C-t>",
		tabnew = "<C-r>",
	},
})
