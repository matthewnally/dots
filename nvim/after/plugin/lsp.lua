require('gitsigns').setup()

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    -- this auto uses all lsps for formatting
    -- order cannot be guaranteed so specify lsps if issues
    lsp_zero.buffer_autoformat()
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
    },
    automatic_installation = true
})
local cmp = require('cmp')
require("mason-lspconfig").setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {}
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


-- setup for guard
local ft = require('guard.filetype')

-- Assuming you have guard-collection
-- ft("python"):fmt("black"):fmt({
--     cmd = 'isort',
--     args = { '-', '--profile', 'black' },
--     stdin = true,
-- }):lint("flake8")
--:extra({ "--profile", "black" })
ft("python"):fmt("black"):append("isort"):lint("flake8"):extra("--max-line-length=200")

ft('typescript,javascript,typescriptreact,prettier'):fmt('prettier')

-- Call setup() LAST!
require('guard').setup({
    -- the only options for the setup function
    fmt_on_save = true,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = false,
})

-- local null_ls = require("null-ls")

-- null_ls.setup({
--     sources = {
--         null_ls.builtins.formatting.black.with({
--             extra_args = { "--line-length=120" }
--         }),
--         null_ls.builtins.formatting.isort.with({
--             extra_args = { "--profile", "black" }
--         }),
--         null_ls.builtins.diagnostics.flake8.with({
--             extra_args = { "--max-line-length=200" }
--         }),
--         null_ls.builtins.completion.spell,
--     },
--     -- you can reuse a shared lspconfig on_attach callback here
--     on_attach = function(client, bufnr)
--         if client.supports_method("textDocument/formatting") then
--             vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--             vim.api.nvim_create_autocmd("BufWritePre", {
--                 group = augroup,
--                 buffer = bufnr,
--                 callback = function()
--                     -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--                     -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
--                     -- vim.lsp.buf.formatting_sync()
--                     vim.lsp.buf.format({ async = false })
--                 end,
--             })
--         end
--     end,
-- })
