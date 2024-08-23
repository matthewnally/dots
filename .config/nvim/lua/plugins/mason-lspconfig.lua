return {
        'williamboman/mason-lspconfig.nvim', -- connects mason and lsp config
        dependencies = {"williamboman/mason.nvim"},
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { "pyright", "ruff", "lua_ls" },
                handlers = {
                    require("lsp-zero").default_setup,
                },
                automatic_installation = true
            })
        end
    }
