return {
    "neovim/nvim-lspconfig",
    init = function()
        require'lspconfig'.pyright.setup{}
        require'lspconfig'.clangd.setup{}
    end
}
