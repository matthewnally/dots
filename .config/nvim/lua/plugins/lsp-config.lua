--  Good defaults configs for LSPs


return {
    'neovim/nvim-lspconfig', -- Adds sensible defaults for lsps
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
    },
    config = function(
    )
        require("lsp-zero").extend_lspconfig()
        require("mason-lspconfig").setup_handlers {
            function(server_name)
                require("lspconfig")[server_name].setup {}
            end,
            ["pyright"] = function()
                require("lspconfig").pyright.setup {
                    settings = {
                        python = {
                            venvPath = ".",
                            venv = ".venv"
                        }
                    }
                }
            end,
            ["lua_ls"] = function()
                require("lspconfig").lua_ls.setup {

                    settings = {
                        Lua = {
                            runtime = {
                                -- Tell the language server which version of Lua you're using
                                -- (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT',
                            },
                            diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = {
                                    'vim',
                                    'require'
                                },
                            },
                            workspace = {
                                -- Make the server aware of Neovim runtime files
                                library = vim.api.nvim_get_runtime_file("", true),
                            },
                        },
                    },
                }
            end
        }
    end



}
