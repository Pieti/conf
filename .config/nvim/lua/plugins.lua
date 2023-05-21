return {
    { "nvim-telescope/telescope.nvim",   tag = "0.1.1",      dependencies = { "nvim-lua/plenary.nvim" } },
    { "ellisonleao/gruvbox.nvim",        priority = 1000 },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "nvim-treesitter/playground" },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    { "tpope/vim-vinegar" },
    { "tpope/vim-surround" },
    { "tpope/vim-speeddating" },
    { "tpope/vim-repeat" },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            {
                -- Optional
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },     -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "L3MON4D3/LuaSnip" },     -- Required
        }
    },
    { "mhartington/formatter.nvim" },
}
