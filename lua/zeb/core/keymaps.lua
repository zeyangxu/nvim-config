-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local api = vim.api -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- buffer management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
-- chad-tree
keymap.set("n", "<leader>v", "<cmd>CHADopen<cr>") -- toggle file explorer
-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>") -- show last search
keymap.set(
	"n",
	"<leader>pp",
	":lua require'telescope'.extensions.project.project{}<CR>",
	{ noremap = true, silent = true }
) -- show last search

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- fold-cycle
keymap.set("n", "<leader>zo", function()
	return require("fold-cycle").open()
end, { silent = true, desc = "Fold-cycle: open folds" })
keymap.set("n", "<leader>zO", function()
	return require("fold-cycle").open_all()
end, { silent = true, desc = "Fold-cycle: open folds" })
keymap.set("n", "<leader>zc", function()
	return require("fold-cycle").close()
end, { silent = true, desc = "Fold-cycle: close folds" })
keymap.set("n", "<leader>zC", function()
	return require("fold-cycle").close_all()
end, { remap = true, silent = true, desc = "Fold-cycle: close all folds" })

-- Reach
keymap.set("n", "<leader>rb", "<cmd>ReachOpen buffers<cr>", {})
keymap.set("n", "<leader>rm", "<cmd>ReachOpen marks<cr>", {})
keymap.set("n", "<leader>rt", "<cmd>ReachOpen tabpages<cr>", {})
keymap.set("n", "<leader>rc", "<cmd>ReachOpen colorschemes<cr>", {})

-- Substitue
keymap.set("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
keymap.set("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
keymap.set("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })

-- Diffview
keymap.set("n", "<leader>dp", function()
	local coppied = vim.fn.getreg("*")
	return vim.cmd("DiffviewOpen " .. coppied)
end, {})

-- Refactoring
-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap(
	"v",
	"<leader>re",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
	"v",
	"<leader>rf",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
	"v",
	"<leader>rv",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
	"v",
	"<leader>ri",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
	{ noremap = true, silent = true, expr = false }
)

-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap(
	"n",
	"<leader>rb",
	[[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>rbf",
	[[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
	{ noremap = true, silent = true, expr = false }
)

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap(
	"n",
	"<leader>ri",
	[[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
	{ noremap = true, silent = true, expr = false }
)

-- prompt for a refactor to apply when the remap is triggered--
-- vim.api.nvim_set_keymap(
-- 	"v",
-- 	"<leader>rr",
-- 	":lua require('refactoring').select_refactor()<CR>",
-- 	{ noremap = true, silent = true, expr = false }
-- )
vim.api.nvim_set_keymap(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)
