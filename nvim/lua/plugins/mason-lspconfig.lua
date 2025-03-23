return {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    init = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "clangd" }
        })
        require('lspconfig').clangd.setup({
            cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
            init_options = {
                fallbackFlags = { '-std=c++11' },
            },
        })
    end
}
