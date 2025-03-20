return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
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
    vim.g.vimtex_mappings_enabled = false
    vim.keymap.set('n', '<localleader>ll' , '<plug>(vimtex-compile)')
  end
}
