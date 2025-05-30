return {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
	keys = {
		{"tsf", false},
		{"tsc", false},
		{"tss", false},
		{"tse", false},
		{"ts$", false},
		{"tsb", false},
		{"tsd", false},
		{"tsD", false},
	},
    init = function()
        --vim.g.vimtex_view_method = "atril"
        vim.g.vimtex_view_general_viewer = "xdg-open"
        --[[vim.g.vimtex_compiler_latexmk = {
            executable = 'latexmk',
            options = {
                '-xelatex',
                '-file-line-error',
                '-synctex=1',
                '-interaction=nonstopmode',
            }
        }--]]
        vim.g.vimtex_compiler_latexmk_engines = { _ = '-xelatex' }
        vim.g.vimtex_mappings_enabled = true
        vim.g.vimtex_complete_close_braces = true
		vim.keymap.set('n', '<leader>tsf', '<plug>(vimtex-cmd-toggle-frac)')
		vim.keymap.set('n', '<leader>tsc', '<plug>(vimtex-cmd-toggle-star)')
		vim.keymap.set('n', '<leader>tss', '<plug>(vimtex-env-toggle-star)')
		vim.keymap.set('n', '<leader>tse', '<plug>(vimtex-env-toggle)')
		vim.keymap.set('n', '<leader>ts$', '<plug>(vimtex-env-toggle-math)')
		vim.keymap.set('n', '<leader>tsb', '<plug>(vimtex-env-toggle-break)')
		vim.keymap.set('n', '<leader>tsd', '<plug>(vimtex-delim-toggle-modifier)')
		vim.keymap.set('n', '<leader>tsD', '<plug>(vimtex-delim-toggle-modifier-reverse)')
		vim.keymap.set('n', '<leader>ll' , '<plug>(vimtex-compile)')
        vim.keymap.set('i', '<Tab>', '<C-x><C-o>')
		vim.keymap.set('n', 'tsb' , 't')
		vim.keymap.del("n", "tsb")
		vim.g.vimtex_mappings_disable = {{"n","tsb"}}
    end
}
