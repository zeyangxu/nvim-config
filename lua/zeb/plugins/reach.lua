-- import nvim-tree plugin safely
local setup, reach = pcall(require, "reach")
if not setup then
	return
end

reach.setup({
	notifications = true,
})
