require('gitsigns').setup()

require 'colorizer'.setup()

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    -- this auto uses all lsps for formatting
    -- order cannot be guaranteed so specify lsps if issues
    lsp_zero.buffer_autoformat()
end)

require('mason').setup({ pip = { upgrade_pip = true } })
require('mason-lspconfig').setup({
    ensure_installed = { "pyright", "lua_ls", "bashls" },
    handlers = {
        lsp_zero.default_setup,
    },
    automatic_installation = true
})
local cmp = require('cmp')
require("mason-lspconfig").setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {}
    end,
    ["pyright"] = function()
        require("lspconfig").pyright.setup {
            settings = {
                python = {
                    venvPath = ".",
                    venv = "venv"
                }
            }
        }
    end

}
cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = cmp.mapping.preset.insert({
        ['<tab>'] = cmp.mapping.confirm({ select = false }),
    })
})


local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        -- require("none-ls.diagnostics.ruff"),
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    -- vim.lsp.buf.formatting_sync()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})
