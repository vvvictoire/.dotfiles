return {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
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
        vim.keymap.set('n', '<leader>ll' , '<plug>(vimtex-compile)')
        vim.keymap.set('i', '<Tab>', '<C-x><C-o>')
    end
}
