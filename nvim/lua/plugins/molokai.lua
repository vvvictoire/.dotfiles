return {
	"tomasr/molokai",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme "molokai"
		vim.cmd.molokai_original = 1
	end
}
