local refactoring_setup, refactoring = pcall(require, "refactoring")
if not refactoring_setup then
	return
end

refactoring.setup({})
