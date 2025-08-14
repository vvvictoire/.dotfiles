return {
	"tomasr/molokai",
	lazy = false,
	priority = 10000,
	config = function()
		vim.cmd.colorscheme "molokai"
		--vim.g.molokai_original = 1
	end
}
