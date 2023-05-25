local lsp = require("lsp-zero").preset({
    manage_nvim_cmp = {
        set_sources = "recommended",
        set_extra_mappings = true,
    }
})

lsp.ensure_installed({
    "pyright",
    "rust_analyzer",
    "gopls",
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()
end)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
--require("lspconfig").pyright.setup({
--    settings = {
--    }
--})

lsp.setup()

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
cmp.setup({
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp_action.luasnip_supertab(),
        ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
    }
})
